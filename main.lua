local Rectangle = {}
-- Construtor que retorna uma nova instancia de Rectangle
function Rectangle:new(x, y, speedY, width, height, touchUp, touchDown)
	local obj = {
		x = x,
		y = y,
		speedY = speedY or 200,
		width = width,
		height = height,
		touchUp = touchUp or false,
		touchDown = touchDown or false
	}
	-- Define Retangulo como a metatable do objeto
	setmetatable(obj, self)
	self.__index = self

	return obj
end

-- Metodo para desenhar o retangulo
function Rectangle:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

-- Metodo para mover o retangulo
function Rectangle:update(keyUp, keyDown, dt)
	
	--condição que detectar quando a tecla keyUp foi clicada
	if love.keyboard.isDown(keyUp) and self.touchUp == false then
		self.y = self.y - self.speedY * dt
	end

	--condição que detectar quando a tecla keyDown foi clicada
	if love.keyboard.isDown(keyDown) and self.touchDown == false then
		self.y = self.y + self.speedY * dt
	end

end

-- Metodo para detectar colisão do retangulo
function Rectangle:detectColision()

	-- Colisão player com a borda superior
	if self.y <= 0 then
		self.touchUp = true
		self.y = 0
	else
		self.touchUp = false
	end

	-- Colisão player com a borda inferior
	if self.y + self.height >= love.graphics.getHeight() then
		self.touchDown = true
		self.y = love.graphics.getHeight() - self.height
	else
		self.touchDown = false
	end
end

local ball = {
	x = 400,
	y = 300,
	radius = 15
}

local rectangle1 = Rectangle:new(50, 300, 200, 20, 80, false, false)
local rectangle2 = Rectangle:new(750, 300, 200, 20, 80, false, false)

function love.update(dt)
	rectangle1:detectColision()
	rectangle2:detectColision()

	rectangle1:update("w", "s", dt)
	rectangle2:update("up", "down", dt)

end

function love.draw()
	rectangle1:draw()
	rectangle2:draw()
	love.graphics.circle("fill", ball.x, ball.y, ball.radius)
end