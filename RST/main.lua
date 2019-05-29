-----------------------------------------------------------------------------------------
--
-- Created by: Matsuru Hoshi
-- Created on: May 22, 2019
--
-- This file contains TypeLearner, a game to pratice your keyboard typing.
-----------------------------------------------------------------------------------------

local background = display.setDefault( "background", 100/255, 100/255, 100/255)

local title = display.newText( "TypeLearner", display.contentCenterX, 30, "Times", 20)

local keyboard = display.newImageRect( "assets/keyboard.png", 300, 111)
keyboard.x = display.contentCenterX
keyboard.y = 240

local nameBox = native.newTextField(display.contentCenterX, 60, 190, 15)

local nameText = display.newText( "", display.contentCenterX, 80, "Times", 10)

local intstructionText = display.newText( "Train to type faster. Hit the keys that light up!", display.contentCenterX, 130, "Times", 10)

local enterButon = display.newImageRect( "assets/button.png", 30, 30)
enterButon.x = 370
enterButon.y = 60

local startButton = display.newImageRect( "assets/startButton.png", 60, 47)
startButton.x = display.contentCenterX
startButton.y = 160

-- To check if namePrint() has been called on start()
local functCheck = 0
local functCheck2 = 0
local functCheck3 = 0
-- To check if start() has been called on
--local function keys( event )
--	if (event.keyName == "a" or event.keyName == "j") and (event.phase == "down") then
--		print("Key '".. event.keyName .. "' was pressed " .. event.phase)
--		return true
--	end
--end

local function namePrint( event )
	if (nameBox.text ~= "") then
		nameText.text = "Hi, ".. nameBox.text ..". Welcome!"
		print("Hi")
		functCheck = functCheck + 1
		print(functCheck)
		nameText:setFillColor( 1, 1, 1)
	else
		functCheck2 = functCheck2 +1
		print("write your name")
		nameText.text = "Write your name."
	end
end
			
--Runtime:addEventListener( "key", keys)



local function createLight()
	-- local x = table stuff
	-- local y = table stuff 
	local light = display.newRoundedRect( 63, 81, 17, 17, 2)
	light:setFillColor( 0, 0, 0)
	light.alpha = 0.5
end


local function game()
	if (functCheck3 >= 1) then
		createLight()
	end
end 
-- PERFORM WITH DELAY game() so it will not automaticlly light up after start is pressed

local function start( event )
	if (functCheck >= 1) then
		display.remove(startButton)
		display.remove(enterButon)
		display.remove(nameBox)
		display.remove(nameText)
		display.remove(intstructionText)
		keyboard.y = 130
		keyboard.width = 400
		keyboard.height = 148
		functCheck3 = functCheck3 + 1
	elseif (functCheck2 >= 1) then
		nameText:setFillColor( 1, 0, 0)
	else 
		nameText.text = "Write your name."
		print(functCheck)
		print(functCheck2)
	end
	game()
end

enterButon:addEventListener( "touch", namePrint)
startButton:addEventListener( "touch", start)


