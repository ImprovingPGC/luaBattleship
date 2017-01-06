local suit = require 'SUIT'

local alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
local numberOfRows, numberOfColumns = 10, 10

function start(name)
	local windowWidth = love.graphics.getWidth()
	local windowHeight = love.graphics.getHeight()

	local width, height = windowWidth/24, windowHeight/24
	makeGrid(width, height, width, height)

	local newXPosition = windowWidth/2
	local newYPosition = windowHeight/2
	makeGrid(width, height, newXPosition, newYPosition)
end

function makeGrid(width, height, startXPosition, startYPosition)
	local currentX, currentY = startXPosition, startYPosition
	for i=1, numberOfRows do
		for j=1, numberOfColumns do 
			row = string.sub(alphabet, i, i)
			suit.Button(row..j, currentX, currentY, width, height)
			currentX = currentX + width
		end
		currentX = startXPosition
		currentY = currentY + height
	end
end