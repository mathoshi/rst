-----------------------------------------------------------------------------------------
--
-- Created by: Matsuru Hoshi
-- Created on: June 16, 2019
--
-- This file contains memory, the card game
-----------------------------------------------------------------------------------------

local background = display.setDefault( "background", 156/255, 209/255, 25/255)

local title = display.newText( "Memory Game", display.contentCenterX, 140, "Gill Sans", 35)

local startText = display.newText( "Press Button to start", display.contentCenterX, 250, "Gill Sans", 20)

local startButton = display.newImageRect( "assets/startbutton.png", 100, 100)
startButton.x = display.contentCenterX
startButton.y = 350


local cards = {}
local positions = {}

row = 1
for i = 30, 280, 50 do
	col = 1
	positions[row] = {}
	for j = 0, 500, 50 do
		positions[row][col] = { i, j }
		col = col + 1
	end
	row = row + 1
end

imageWidth = 50
imageHeight = 50

ids = { 
    "assets/elephant.jpg",
    "assets/penguin.png",
    "assets/kangaroo.jpg",
    "assets/cat.jpg",
    "assets/dog.jpg",
    "assets/giraffe.jpg",
    "assets/llama.jpg",
    "assets/lion.jpg",
    "assets/snake.jpg",
    "assets/rhinoceros.jpg",
    "assets/platypus.jpg",
    "assets/duck.jpg",
    "assets/monkey.jpg",
    "assets/harambe.jpg",
    "assets/mouse.jpg",
    "assets/bunny.jpg",
    "assets/bird.jpg",
    "assets/whale.jpg",
    "assets/gremlin.jpg",
    "assets/chameleon.jpg",
    "assets/bantha.jpg",
    "assets/squirrel.jpg",
    "assets/mrpeanutbutter.jpg",
    "assets/flie.png",
    "assets/redpanda.jpg",
    "assets/panda.jpg",
    "assets/fox.jpg",
    "assets/wolf.jpg",
    "assets/turtle.jpg",
    "assets/dinosaur.jpg"
}

firstAttempt = nil
local function onWrongAnswer( event )
    local params = event.source.params

	params.card1.alpha = 1
	params.card2.alpha = 1
end

local function onCardClick( event )
    if ( event.phase == "began" ) then
        currentAttempt = event.target
        if firstAttempt == nil then
        	firstAttempt = currentAttempt
	        currentAttempt.alpha = 0
        elseif firstAttempt.id == currentAttempt.id then
            cards[firstAttempt.cardRow][firstAttempt.cardCol].alpha = 0
        	cards[currentAttempt.cardRow][currentAttempt.cardCol].alpha = 0
        	firstAttempt.alpha = 0
        	currentAttempt.alpha = 0
        	firstAttempt = nil
        else
        	currentAttempt.alpha = 0
        	local tm = timer.performWithDelay(1000, onWrongAnswer)
        	tm.params = { card1 = firstAttempt, card2 = currentAttempt }
        	firstAttempt = nil
    	end
    end
    return true
end

local function getposition()
	repeat
       	x = math.random(6)
       	y = math.random(10)
    until cards[x][y] == null 
    return x, y
end

local function initcards()
    for i = 1, 6, 1 do
        cards[i] = {}
    end
    for n = 1, 30 do
        id = ids[n]
        x, y = getposition()
        cards[x][y] = display.newImageRect(id, imageWidth, imageHeight)
        cards[x][y].id = n

        x, y = getposition()
        cards[x][y] = display.newImageRect(id, imageWidth, imageHeight)
        cards[x][y].id = n
    end
end

local function cardsspreader()
    for i = 1, 6 do
        for j = 1, 10 do
        	card = cards[i][j]
            card.x = positions[i][j][1]
            card.y = positions[i][j][2]

            darksquare = display.newRect(card.x, card.y, imageWidth, imageHeight)
            darksquare.strokeWidth = 1
            darksquare.id = card.id
            darksquare.cardRow = i
            darksquare.cardCol = j
           	darksquare:setFillColor( 0, 0, 0)

           	darksquare:addEventListener( "touch", onCardClick )
        end
    end
end

local function start( event )
	display.remove(title)
	display.remove(startText)
	display.remove(startButton)
	initcards()
    cardsspreader()
end



startButton:addEventListener( "touch", start)








