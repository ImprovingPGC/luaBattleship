local suit = require 'SUIT'
local nameInput = {text = ""}

function love.update(dt)
	local windowWidth = love.graphics.getWidth()
	local windowHeight = love.graphics.getHeight()	

    suit.layout:reset(windowWidth/3,0)
	suit.Label("Welcome to Improving Battleship!", suit.layout:row(windowWidth/3, 30))
	suit.layout:push(windowWidth/3, windowHeight/2)
	suit.Label("Please enter your name", suit.layout:row(windowWidth/3, 30))
    suit.Input(nameInput, suit.layout:row())
	if nameInput.text ~= "" then
		suit.Label("Hello, " .. nameInput.text .. "!", suit.layout:row())
	end
	suit.layout:row()
	if suit.Button("Start!", suit.layout:row()).hit then
		-- start game with the given name
	end
    suit.layout:row()

    if suit.Button("Close", suit.layout:row()).hit then
        love.event.quit()
    end
end

function love.draw()
    suit.draw()
end

function love.textinput(t)
    suit.textinput(t)
end

function love.keypressed(key)
	love.keyboard.setKeyRepeat(true)
    suit.keypressed(key)
end
