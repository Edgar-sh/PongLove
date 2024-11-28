local Ball = {}

--Construtor que retorna uma nova instancia de Ball
function Ball:new(x, y, speedX, speedY, radius)
	local obj = {}

	setmetatable(obj, self)
	self.__index = self

	obj.x = x
	obj.y = y
	obj.speedX = speedX
	obj.speedY = speedY
	obj.radius = radius or 15

	return obj
end 

--Metodo para desenhar a bola
function Ball:draw()
	love.graphics.circle("fill", self.x, self.y, self.radius)
end

--Metodo para mover a bola
function Ball:update(dt)
	self.x = self.x + self.speedX * dt
	self.y = self.y + self.speedY * dt
end

--Metodo para detectarColisão
function Ball:colision(ret1, ret2)

	--Condição de colisão com o teto e o chão da tela
	if self.x - self.radius <= 0 or self.x + self.radius > love.graphics.getWidth() then
		self.speedX = -self.speedX
	end 
	
	if self.y - self.radius <= 0 or self.y + self.radius > love.graphics.getHeight() then
		self.speedY = -self.speedY
	end 

	--Condição de colisão com o player 1
	if  self.x - self.radius < ret1.x + ret1.width and (self.y > ret1.y and self.y  < ret1.y + ret1.height) then
		self.speedX = -self.speedX
	end

	--Condição de colisão com o player 2
	if self.x + self.radius > ret2.x and (self.y > ret2.y and self.y < ret2.y + ret2.height) then
		self.speedX = -self.speedX
	end
end

return Ball