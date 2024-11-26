local retangulo1 = {
	x = 50,
	y = 300, 
	speedY = 100,
	width = 20, 
	height = 80
}

local retangulo2 = {
	x = 750,
	y = 300, 
	width = 20, 
	height = 80
}

local function isToucheEdge(retangulo1, retangulo2)
	îf 


function love.update(dt)
	if love.keyboard.isDown("s") then
		retangulo1.y = retangulo1.y + retangulo1.speedY * dt
	end
	if love.keyboard.isDown("w") then
		retangulo1.y = retangulo1.y - retangulo1.speedY * dt
	end
end

function love.draw()
	love.graphics.rectangle("fill", retangulo1.x, retangulo1.y, retangulo1.width, retangulo1.height)
	love.graphics.rectangle("fill", retangulo2.x, retangulo2.y, retangulo2.width, retangulo2.height)

end