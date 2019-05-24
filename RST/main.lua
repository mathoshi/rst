-----------------------------------------------------------------------------------------
--
-- Created by: Matsuru Hoshi
-- Created on: May 22, 2019
--
-- This file contains TypeLearner, a game to pratice your keyboard typing.
-----------------------------------------------------------------------------------------

local title = display.newText( "TypeLearner", display.contentCenterX, 30, "Times", 20)

local keyboard = display.newImageRect( "assets/keyboard.png", 300, 111)
keyboard.x = display.contentCenterX
keyboard.y = 160

local nameBox = native.newTextField(display.contentCenterX, 80, 200, 15)

local nameText = display.newText( "", display.contentCenterX, 80, "Times", 15)

--local function keys( event )
--	if (event.keyName == "a" or event.keyName == "j") and (event.phase == "down") then
--		print("Key '".. event.keyName .. "' was pressed " .. event.phase)
--		return true
--	end
--end

local function namePrint( event )
	if ((event.keyName == "enter" or event.keyName == "numPadEnter") and (event.phase == "down")) then
		nameText.text = "Write your name."
		if (nameBox.text ~= "") then
			nameText.text = "Hi, ".. nameBox.text ..". Welcome!"
			print("Hi")
			print(event.keyName)
			
		else
			print("write yuor name")
		end
	end
end
			

Runtime:addEventListener( "key", namePrint)
--Runtime:addEventListener( "key", keys)
