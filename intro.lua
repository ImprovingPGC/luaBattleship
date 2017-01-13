require 'game'

function intro()
	local windowWidth = love.graphics.getWidth()
	local windowHeight = love.graphics.getHeight()

	background = love.graphics.newImage('/images/background.jpg')

	suit.layout:reset(windowWidth/3,0)
	suit.Label("Welcome to Improving Battleship!", suit.layout:row(windowWidth/3, 30))
	suit.layout:push(windowWidth/3, windowHeight/2)
	suit.Label("Please enter your name", suit.layout:row(windowWidth/3, 30))
	suit.Input(nameInput, suit.layout:row())
	if nameInput.text ~= "" then
		suit.Label("Hello, " .. nameInput.text .. "!", suit.layout:row())
	end

	suit.layout:row()
	if suit.Button("Start!", "start", suit.layout:row()).hit then
		love.graphics.clear()
		gameState = start
	end

	suit.layout:row()
	if suit.Button("Close","close", suit.layout:row()).hit then
		love.event.quit()
	end
end
