	local retangulo1 = {
	x = 50,
	y = 300, 
	speedY = 200,
	width = 20, 
	height = 80,
	touchUp = false,
	touchDown = false
}

local retangulo2 = {
	x = 750,
	y = 300, 
	width = 20, 
	height = 80,
	touchUp = false

}

local function isToucheEdge(retangulo1, retangulo2) 

	if retangulo1.y - retangulo1.height < 0 then
		
		retangulo1.touchUp = true
	else
		retangulo1.touchUp = false
	end

	if retangulo1.y + retangulo1.height > love.graphics.getHeight() then
		retangulo1.touchDown = true
	else
		retangulo1.touchDown = false
	end

end

function love.update(dt)
	print(retangulo1.y)
	isToucheEdge(retangulo1, retangulo2)

	if love.keyboard.isDown("w") and retangulo1.touchUp == false then
		retangulo1.y = retangulo1.y - retangulo1.speedY * dt
	end

	if love.keyboard.isDown("s") and retangulo1.touchDown == false then
		retangulo1.y = retangulo1.y + retangulo1.speedY * dt
	end
end

function love.draw()
	love.graphics.rectangle("fill", retangulo1.x, retangulo1.y, retangulo1.width, retangulo1.height)
	love.graphics.rectangle("fill", retangulo2.x, retangulo2.y, retangulo2.width, retangulo2.height)
end