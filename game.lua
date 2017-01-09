local suit = require 'SUIT'

local alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
local numberOfRows, numberOfColumns = 10, 10

function start(name)
	local windowWidth = love.graphics.getWidth()
	local windowHeight = love.graphics.getHeight()

	local width, height = windowWidth/24, windowHeight/24
	local boardXPosition = windowWidth/4
	labelXPosition, labelYPosition = windowWidth/12, windowHeight/4

	makeGrid("Enemy", width, height, boardXPosition, height)
	
	local playerYPosition = windowHeight/2
	labelYPosition = labelYPosition * 3
	makeGrid(name, width, height, boardXPosition, playerYPosition)
end

function makeGrid(player, width, height, startXPosition, startYPosition)
	currentX, currentY = startXPosition, startYPosition
	
	label(player, width, height)
	createXAxisLables(width, height, startXPosition)

	for i=1, numberOfRows do
		row = string.sub(alphabet, i, i)
		createYAxisLabel(width, height)
		for j=1, numberOfColumns do 
			suit.Button("", player..row..j, currentX, currentY, width, height)
			currentX = currentX + width
		end
		currentX = startXPosition
		currentY = currentY + height
	end
end

function label(player, width, height)
	suit.Label(player, labelXPosition, labelYPosition, width, height)
end

function createXAxisLables(width, height, startXPosition)
	currentX = currentX + width
	for j=1, numberOfColumns do 
		suit.Label(j, currentX, currentY, width, height)
		currentX = currentX + width
	end
		
	currentX = startXPosition
	currentY = currentY + height
end

function createYAxisLabel(width, height)
	suit.Label(row, currentX, currentY, width, height)
	currentX = currentX + width
end
