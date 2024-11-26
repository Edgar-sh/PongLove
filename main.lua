local rectangle = {
	x = 300,
	y = 200,
	width = 20,
	height = 60
}

function love.draw()
	love.graphics.rectangle("fill", rectangle.x, rectangle.y, rectangle.width, rectangle.height)
end