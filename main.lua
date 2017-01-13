suit = require 'SUIT'
require 'intro'
gameState = intro
background = nil
nameInput = {text = ""}

function love.update(dt)
	gameState()
end

function love.draw()
	if background then
		local sx = love.graphics.getWidth() / background:getWidth()
		local sy = love.graphics.getHeight() / background:getHeight()
		love.graphics.draw(background, 0, 0, 0, sx, sy)
	end
	suit.draw()
end

function love.textinput(t)
	suit.textinput(t)
end

function love.keypressed(key)
	love.keyboard.setKeyRepeat(true)
	suit.keypressed(key)
end
