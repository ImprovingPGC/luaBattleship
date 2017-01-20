suit = require 'SUIT'
require 'intro'
gameState = {
	update = intro,
	background = nil,
	nameInput = {text = ""}
}

function love.update(dt)
	gameState.update()
end

function love.draw()
	drawBackground(gameState.background)
	suit.draw()
end

function drawBackground(background)
	if background then
		local sx = love.graphics.getWidth() / background:getWidth()
		local sy = love.graphics.getHeight() / background:getHeight()
		love.graphics.draw(background, 0, 0, 0, sx, sy)
	end
end

function love.textinput(t)
	suit.textinput(t)
end

function love.keypressed(key)
	love.keyboard.setKeyRepeat(true)
	suit.keypressed(key)
end
