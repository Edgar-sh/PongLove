local Rectangle = {}

-- Construtor que retorna uma nova instancia de Rectangle
function Rectangle:new(x, y, speedY, width, height, touchUp, touchDown)
	local obj = {}

	-- Define Retangulo como a metatable do objeto
	setmetatable(obj, self)
	self.__index = self

	obj.x = x
	obj.y = y
	obj.speedY = speedY or 200
	obj.width = width
	obj.height = height
	obj.touchUp = touchUp or false
	obj.touchDown = touchDown or false

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
function Rectangle:collision()

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

return Rectangle