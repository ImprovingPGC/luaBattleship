local socket = require "socket"

network = {}

-- Returns the device's current IP address.
function network:getIp()
    local s = socket.udp()
    s:setpeername("8.8.8.8", 80) -- Need to set an IP here, even though unused
    local ip, sock = s:getsockname()
    return ip
end

-- Advertise this app as ready to start a new game. Note, this will repeatedly
-- broadcast unless network:stopAdvertising is called or the app is exited.
function network:advertise(serverName, discoveryPort)
    local send = socket.udp()
    send:settimeout(0)  -- Don't wait for messages. We will poll instead.
    local counter = 0

    local function broadcast()
        send:sendto(serverName, "192.168.1.1", discoveryPort)
        -- Not all devices can multicast so also broadcast, but the network has
        -- to allow that.
        send:setoption("broadcast", true)
        send:sendto(serverName, "255.255.255.255", discoveryPort)
        send:setoption("broadcast", false)
    end

    -- Announce 2 times per second.
    network.serverBroadcast = timer.performWithDelay(500, broadcast, 0)
end

-- Stops this app from advertising availability to start a new game.
function network:stopAdvertising()
  if network.serverBroadcast then
    timer.cancel(network.serverBroadcast)
  end
end

-- Search for peers ready for a new game. Note, this will search forever as long
-- as there is at least one peer out there unless network:stopSearching is
-- called or the app is exited.
function network:searchForPeers(serverNamePrefix, discoveryPort, newPeerCallback)
  local listen = socket.udp()
  listen:setsockname("192.168.1.1", discoveryPort) -- attempt multicast
  if (listen:getsockname()) then  -- does device support multicast?
    listen:setoption("ip-add-membership", {
      multiaddr = "192.168.1.1",
      interface = getIp()
    })
  else  -- no? try broadcast
    listen:close()  -- close the old socket; this is important
    listen = socket.udp()  -- make a new socket
    listen:setsockname(getIp(), discoveryPort) -- setting socket name to actual IP makes it
  end

  listen:settimeout(0) --  move along if there is nothing to hear

  local stop -- Will map to a function that allows us to stop searching early
  local counter = 0

  local function look()
    repeat
        local data, ip, port = listen:receivefrom()
        print( "data: ", data, "IP: ", ip, "port: ", port )
        if isServerAdvertisement(data) then
          newPeerCallback(data, ip)
        end
    until not data

    counter = counter + 1
    if counter == 20 then  --stop after 2 seconds
        stop()
    end
  end

  local function isServerAdvertisement(data)
    if data and string.sub(data, 1, string.len(serverNamePrefix)) == serverNamePrefix then
        return true
    end
    return false
  end

  --pulse 10 times per second
  network.serverSearch = timer.performWithDelay( 100, look, 0 )
end

function network:stopSearching()
  if network.serverSearch then
    timer.cancel(network.serverSearch)
  end
end

return network
