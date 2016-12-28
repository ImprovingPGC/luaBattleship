--[[
function love.draw()
	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print("Welcome to Improving Battleship!", 290, 20) 
	love.graphics.print("Please enter your name", 315, 280)
	love.graphics.rectangle("fill", 315, 300, 150, 10)
	love.graphics.rectangle("fill", 365, 320, 50, 20)
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.print("Start!", 375, 325)
end]]

-- suit up
local suit = require 'suit'

-- storage for text input
local input = {text = ""}

function love.update(dt)
	local windowWidth = love.graphics.getWidth()
	local windowHeight = love.graphics.getHeight()

    suit.layout:reset(windowWidth/3,0)
	suit.Label("Welcome to Improving Battleship!", suit.layout:row(windowWidth/3, 30))
	suit.layout:push(windowWidth/3, windowHeight/2)
	suit.Label("Please enter your name", suit.layout:row(windowWidth/3, 30))
    suit.Input(input, suit.layout:row())

    -- put a label that displays the text below the first cell
    -- the cell size is the same as the last one (200x30 px)
    -- the label text will be aligned to the left
    suit.Label("Hello, "..input.text, {align = "left"}, suit.layout:row())

    -- put an empty cell that has the same size as the last cell (200x30 px)
    suit.layout:row()

    -- put a button of size 200x30 px in the cell below
    -- if the button is pressed, quit the game
    if suit.Button("Close", suit.layout:row()).hit then
        love.event.quit()
    end
end

function love.draw()
    -- draw the gui
    suit.draw()
end

function love.textinput(t)
    -- forward text input to SUIT
    suit.textinput(t)
end

function love.keypressed(key)
    -- forward keypresses to SUIT
    suit.keypressed(key)
end