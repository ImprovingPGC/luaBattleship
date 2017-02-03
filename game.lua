game = {}

local alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
local numberOfRows, numberOfColumns = 10, 10
local isAddObject=false
local enemy = "Enemy"
local playerYPosition

function game:takeScreen()
  love.graphics.clear()
  gameState.background = nil
  gameState.currentState = self
end


function game:update()
	WINDOW_WIDTH = love.graphics.getWidth()
	WINDOW_HEIGHT = love.graphics.getHeight()
	WIDTH, HEIGHT = WINDOW_WIDTH/24, WINDOW_HEIGHT/24

	suit.layout:reset(WINDOW_WIDTH/12, WINDOW_HEIGHT/4, 1, 10)

	playerYPosition = HEIGHT/2

	makeGrid(enemy, HEIGHT)

	playerYPosition = WINDOW_HEIGHT/2
	suit.layout:reset(WINDOW_WIDTH/4,playerYPosition, 1, 1)
	suit.layout:reset(WINDOW_WIDTH/12, WINDOW_HEIGHT/4*3, 1, 2)

	makeGrid(gameState.playerName.text, playerYPosition)
end

function makeGrid(player, startYPosition)
	suit.Label(player, suit.layout:row(WIDTH*4,HEIGHT))

	suit.layout:reset(WINDOW_WIDTH/4,startYPosition, 1, 1)
	createXAxisLables()

	for i=1, numberOfRows do
		row = string.sub(alphabet, i, i)
		createYAxisLabel(i)
		for j=1, numberOfColumns do
			suit.Button("", player..row..j, suit.layout:col(WIDTH, HEIGHT))
		end
	end
end

function createXAxisLables()
	suit.layout:col(WIDTH, HEIGHT)
	for j=1, numberOfColumns do
		suit.Label(j, suit.layout:col())
	end
end

function createYAxisLabel(colnum)
	suit.layout:push(WINDOW_WIDTH/4, playerYPosition+ HEIGHT*colnum)
	suit.Label(row, suit.layout:row(WIDTH, HEIGHT))
end

return game
