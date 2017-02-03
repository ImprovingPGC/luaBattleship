game = {}

local alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
local numberOfRows, numberOfColumns = 10, 10
local isAddObject=false
local enemy = "Enemy"
local playerYPosition
local text = ""
local tile
local try

local option=	{
			color = {
				normal   = {bg = { 0, 66, 66}, fg = {0,188,188}}
					}
				}

function game:update()
	gameState.background = nil

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



	addObject = suit.Button("Add Object", "id", WINDOW_WIDTH*3/4, playerYPosition)
	if addObject.hit then 
		isAddObject = true
		if tile ~= nil then
			try = tile.opt.state
		end
	end 
	suit.Label(text, WINDOW_WIDTH*3/4, playerYPosition+10, WIDTH * 4, HEIGHT)
	if tile ~= nil then
		try = tile.opt.state
		suit.Label(try, WINDOW_WIDTH*3/4, playerYPosition+20, WIDTH * 4, HEIGHT)
	end
end

function makeGrid(player, startYPosition)
	suit.Label(player, suit.layout:row(WIDTH*4,HEIGHT))

	suit.layout:reset(WINDOW_WIDTH/4,startYPosition, 1, 1)
	createXAxisLables()

	for i=1, numberOfRows do
		row = string.sub(alphabet, i, i)
		createYAxisLabel(i)
		for j=1, numberOfColumns do
			--suit.Button("", player..row..j, suit.layout:col(WIDTH, HEIGHT))
			option.id = player..row..j
			boardTile = suit.Button("", option.id, option, suit.layout:col(WIDTH, HEIGHT))
			if player ~= enemy and isAddObject and boardTile.hit then
				text = boardTile.opt.state
				tile = boardTile
				--boardTile.opt = option
				--boardTile:setFillColor(0,0,0)
				isAddObject = false
			end
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
