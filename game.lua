local suit = require 'SUIT'

local alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
local numberOfRows, numberOfColumns = 10, 10

function start(name)
	WINDOW_WIDTH = love.graphics.getWidth()
	WINDOW_HEIGHT = love.graphics.getHeight()

	WIDTH, HEIGHT = WINDOW_WIDTH/24, WINDOW_HEIGHT/24
	local boardXPosition = WINDOW_WIDTH/4
	labelXPosition, labelYPosition = WINDOW_WIDTH/12, WINDOW_HEIGHT/4

	makeGrid("Enemy", boardXPosition, HEIGHT)
	
	local playerYPosition = WINDOW_HEIGHT/2
	labelYPosition = labelYPosition * 3
	makeGrid(name, boardXPosition, playerYPosition)
end

function makeGrid(player, startXPosition, startYPosition)
	currentX, currentY = startXPosition, startYPosition
	
	suit.Label(player, labelXPosition, labelYPosition, WIDTH * 4, HEIGHT)
	createXAxisLables(startXPosition)

	for i=1, numberOfRows do
		row = string.sub(alphabet, i, i)
		createYAxisLabel()
		for j=1, numberOfColumns do 
			suit.Button("", player..row..j, currentX, currentY, WIDTH, HEIGHT)
			currentX = currentX + WIDTH
		end
		currentX = startXPosition
		currentY = currentY + HEIGHT
	end
end

function createXAxisLables(startXPosition)
	currentX = currentX + WIDTH
	for j=1, numberOfColumns do 
		suit.Label(j, currentX, currentY, WIDTH, HEIGHT)
		currentX = currentX + WIDTH
	end
		
	currentX = startXPosition
	currentY = currentY + HEIGHT
end

function createYAxisLabel()
	suit.Label(row, currentX, currentY, WIDTH, HEIGHT)
	currentX = currentX + WIDTH
end
