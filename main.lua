local rectangle1 = {
	x = 50,
	y = 300, 
	speedY = 250,
	width = 20, 
	height = 80,
	touchUp = false,
	touchDown = false
}

local rectangle2 = {
	x = 750,
	y = 300, 
	speedY = 200,
	width = 20, 
	height = 80,
	touchUp = false,
	touchDown = false
}

local ball = {
	x = 400,
	y = 300,
	radius = 15

}

local function isToucheEdge(rectangle1, rectangle2) 

-- Colisão player 1 com a borda superior
	if rectangle1.y <= 0 then
		rectangle1.touchUp = true
		rectangle1.y = 0
	else
		rectangle1.touchUp = false
	end

-- Colisão player 1 com a borda inferior
	if rectangle1.y + rectangle1.height >= love.graphics.getHeight() then
		rectangle1.touchDown = true
		rectangle1.y = love.graphics.getHeight() - rectangle1.height
	else
		rectangle1.touchDown = false
	end

-- Colisão player 2 com a borda superior
	if rectangle2.y <= 0 then
		rectangle2.touchUp = true
		rectangle2.y = 0
	else
		rectangle2.touchUp = false
	end

-- Colisão player 2 com a borda inferior
	if rectangle2.y + rectangle2.height >= love.graphics.getHeight() then
		rectangle2.touchDown = true
		rectangle2.y = love.graphics.getHeight() - rectangle1.height
	else
		rectangle2.touchDown = false
	end

end

function love.update(dt)

	isToucheEdge(rectangle1, rectangle2)

	if love.keyboard.isDown("w") and rectangle1.touchUp == false then
		rectangle1.y = rectangle1.y - rectangle1.speedY * dt
	end

	if love.keyboard.isDown("s") and rectangle1.touchDown == false then
		rectangle1.y = rectangle1.y + rectangle1.speedY * dt
	end

	if love.keyboard.isDown("o") and rectangle2.touchUp == false then
		rectangle2.y = rectangle2.y - rectangle2.speedY * dt
	end

	if love.keyboard.isDown("l") and rectangle2.touchDown == false then
		rectangle2.y = rectangle2.y + rectangle2.speedY * dt
	end

	print("Posição retangulo 1:".." "..rectangle1.y)
end

function love.draw()
	love.graphics.rectangle("fill", rectangle1.x, rectangle1.y, rectangle1.width, rectangle1.height)
	love.graphics.rectangle("fill", rectangle2.x, rectangle2.y, rectangle2.width, rectangle2.height)
	love.graphics.circle("fill", ball.x, ball.y, ball.radius)
end