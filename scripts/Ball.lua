local Ball = {}

--Contrutor que retorna uma nova instancia de Ball
function Ball:new(x, y, radius)
	local obj = {}

	setmetatable(obj, self)
	self.__index = self

	obj.x = x
	obj.y = y
	obj.radius = radius or 15

	return obj
end 

--Metodo para desenhar a bola
function Ball:draw()
	love.graphics.circle("fill", self.x, self.y, self.radius)
end

--Metodo para mover a bola
function Ball:update(dt)
	
end

--Metodo para detectarColisão
function Ball:colision(ret1, ret2)
	print("Retangulo 1:".." "..ret1.y)
	print("Retangulo 2:".." "..ret2.y)
end

return Ball