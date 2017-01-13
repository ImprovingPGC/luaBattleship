local suit = require 'SUIT'
require 'intro'
require 'game'
nameInput = {text = ""}
gameState = intro

function love.update(dt)	
	gameState()
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
