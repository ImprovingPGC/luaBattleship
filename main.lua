suit = require 'SUIT'
intro = require 'intro'
lobby = require 'lobby'
game = require 'game'
network = require 'network'

gameState = {
	currentState = nil,
	background = nil,
	playerName = {text = ""},
	network = {
		ip = nil, -- will need to be discovered in love.load()
		serverNamePrefix = "PgcBattleship:",
		discoveryPort = 12521, -- used for peering
		gamePort = 12522 -- used during an active game
	}
}

function love.load()
	gameState.network.ip = network:getIp()
	intro:takeScreen()
end

function love.update(dt)
	gameState.currentState:update()
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
