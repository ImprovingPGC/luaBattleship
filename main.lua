yui = require  'yaoui'

function love.load()
	yui.UI.registerEvents()
	
	local windowWidth = love.graphics.getWidth()
	view = yui.View(0, 0, 0, 0, {
		margin_top = 0,
		margin_left = 0,
		yui.Flow({
			yui.HorizontalSpacing({ w = windowWidth/3}),
			yui.Textinput({onEnter = function(self, text) print(text) end , w = windowWidth/3}),
			yui.HorizontalSpacing({ w = windowWidth/3})
		})
	})
end

function love.update(dt)
	yui.update({view})
	view:update(dt)
end

function love.draw()
	view:draw()
end


--[[	love.graphics.setColor(255, 255, 255, 255)
	love.graphics.print("Welcome to Improving Battleship!", 290, 20) 
	love.graphics.print("Please enter your name", 315, 280)
	love.graphics.rectangle("fill", 315, 300, 150, 10)
	love.graphics.rectangle("fill", 365, 320, 50, 20)
	love.graphics.setColor(0, 0, 0, 255)
	love.graphics.print("Start!", 375, 325)]]