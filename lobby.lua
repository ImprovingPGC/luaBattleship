lobby = {}

function lobby:takeScreen()
  love.graphics.clear()
  if not self.background then
    self.background = love.graphics.newImage('/images/background.jpg')
  end
  gameState.background = self.background
  gameState.currentState = self
end

function lobby:update()
  local windowWidth = love.graphics.getWidth()
	local windowHeight = love.graphics.getHeight()

	suit.layout:reset(0,0)
	suit.Label("Local IP: " .. gameState.network.ip, 0,0,200,30)

	suit.layout:reset(windowWidth/3,0)
	suit.Label("Finding Peers...", suit.layout:row(windowWidth/3, 30))
	suit.layout:push(windowWidth/3, windowHeight/2)

	if suit.Button("Cancel", "intro", suit.layout:row(windowWidth/3, 30)).hit then
    intro:takeScreen()
	end

  suit.layout:row()
  if suit.Button("Skip To Game", "game", suit.layout:row(windowWidth/3, 30)).hit then
    game:takeScreen()
	end

	suit.layout:row()
	if suit.Button("Close","close", suit.layout:row(windowWidth/3, 30)).hit then
		love.event.quit()
	end
end

return lobby
