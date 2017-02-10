intro = {}

function intro:takeScreen()
  love.graphics.clear()
  if not self.background then
    self.background = love.graphics.newImage('/images/background.jpg')
  end
  gameState.background = self.background
  gameState.currentState = self
end

function intro:update(dt)
	local windowWidth = love.graphics.getWidth()
	local windowHeight = love.graphics.getHeight()

	suit.layout:reset(windowWidth/3,0)
	suit.Label("Welcome to Improving Battleship!", suit.layout:row(windowWidth/3, 30))
	suit.layout:push(windowWidth/3, windowHeight/2)
	suit.Label("Please enter your name", suit.layout:row(windowWidth/3, 30))
	suit.Input(gameState.playerName, suit.layout:row())
	if gameState.playerName.text ~= "" then
		suit.Label("Hello, " .. gameState.playerName.text .. "!", suit.layout:row())
	end

	suit.layout:row()
	if suit.Button("Find Suckers!", "lobby", suit.layout:row()).hit then
		lobby:takeScreen()
	end

	suit.layout:row()
	if suit.Button("Close","close", suit.layout:row()).hit then
		love.event.quit()
	end
end

return intro
