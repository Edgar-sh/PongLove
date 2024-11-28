
--Importando Ball e Rectangle
local Ball = require("scripts.Ball")
local Rectangle = require("scripts.Rectangle")

--Instanciando a bola
local ball = Ball:new(400, 300, 150, 150, 15)

--Instancia de Rectangle
local rectangle1 = Rectangle:new(50, 300, 200, 20, 80, false, false)
local rectangle2 = Rectangle:new(750, 300, 200, 20, 80, false, false)

function love.update(dt)
	rectangle1:collision()
	rectangle2:collision()

	rectangle1:update("w", "s", dt)
	rectangle2:update("up", "down", dt)

	ball:colision(rectangle1, rectangle2)

	ball:update(dt)
end

function love.draw()
	rectangle1:draw()
	rectangle2:draw()

	ball:draw()
end