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

local nameBox = native.newTextField(display.contentCenterX, 80, 200, 15)

local nameText = display.newText( "", display.contentCenterX, 100, "Times", 10)

local enterButon = display.newImageRect( "assets/button.png", 30, 30)
enterButon.x = 370
enterButon.y = 80

local startButton = display.newImageRect( "assets/startButton.png", 60, 47)
startButton.x = display.contentCenterX
startButton.y = 160

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
	else
		print("write yuor name")
		nameText.text = "Write your name."
	end
end
			
enterButon:addEventListener( "touch", namePrint)
--Runtime:addEventListener( "key", keys)

local function start( event )
	display.remove(startButton)
	display.remove(enterButon)
	display.remove(nameBox)
	keyboard.y = 130

end

startButton:addEventListener( "touch", start)

