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
keyboard.y = 150


local function keys( event )
	--if (event.keyName == "a" and event.phase == "down") then
		print("Key '".. event.keyName .. "' was pressed " .. event.phase)
		return true
	--end
end

Runtime:addEventListener( "key", keys)
