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

local timeUp = display.newText( "", 50, 40, "Times", 10)

local correct = 0
pressed = 0
a = 0 


t = {}

t[1] = {63, 81}
t[1].id = "27"
t[2] = {90, 81}
t[2].id = "112"
t[3] = {106, 81}
t[3].id = "113"
t[4] = {122.5, 81}
t[4].id = "114"
t[5] = {139, 81}
t[5].id = "115"
t[6] = {164, 81}
t[6].id = "116"
t[7] = {180, 81}
t[7].id = "117"
t[8] = {197, 81}
t[8].id = "118"
t[9] = {213, 81}
t[9].id = "119"
t[10] = {238, 81}
t[10].id = "120"
t[11] = {254, 81}
t[11].id = "121"
t[12] = {270, 81}
t[12].id = "122"
t[13] = {287, 81}
t[13].id = "123"
t[14] = {62, 112.5}
t[14].id = "192"
t[15] = {78, 112.5}
t[15].id = "49"
t[16] = {94, 112.5}
t[16].id = "50"
t[17] = {110.5, 112.5}
t[17].id = "51"
t[18] = {126.5, 112.5}
t[18].id = "52"
t[19] = {142.5, 112.5}
t[19].id = "53"
t[20] = {158, 112.5}
t[20].id = "54"
t[21] = {175, 112.5}
t[21].id = "55"
t[22] = {191, 112.4}
t[22].id = "56"
t[23] = {207, 112.5}
t[23].id = "57"
t[24] = {223, 112.5}
t[24].id = "48"
t[25] = {239.5, 112.5}
t[25].id = "189"
t[26] = {255.5, 112.5}
t[26].id = "187"
t[27] = {280, 112.5}
t[27].id = "8"
t[28] = {369, 112.5}
t[28].id = "144"
t[29] = {385, 112.5}
t[29].id = "111"
t[30] = {402, 112.5}
t[30].id = "106"
t[31] = {418, 112.5}
t[31].id = "109"
t[32] = {66, 130}
t[32].id = "9"
t[33] = {87, 130}
t[33].id = "81"
t[34] = {102.5, 130}
t[34].id = "87"
t[35] = {119, 130}
t[35].id = "69"
t[36] = {135, 130}
t[36].id = "82"
t[37] = {151, 130}
t[37].id = "84"
t[38] = {167, 130}
t[38].id = "89"
t[39] = {183, 130}
t[39].id = "85"
t[40] = {199, 130}
t[40].id = "73"



--print (t[40].id)
--print( t[2][1])

--local myTable = { 'a', 'b', 'c', 'd' }

--i = math.random(1, 2)
--print(t[i][1])
--print(t[i][2])
--print( t[ math.random( #t ) ] )


-- To check if namePrint() has been called on start()
local functCheck = 0
local functCheck2 = 0
local functCheck3 = 0
local functCheck4 = 0
local functCheck5 = 0
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
		
local function keyCheck()
	local function keys( event )
		if ((tostring(event.nativeKeyCode) == t[i].id) and (event.phase == "down")) then
			correct = correct + 1
			print("correct : " .. correct)
			i = math.random(1, 40)
			x = t[i][1]
			y = t[i][2]
			light.x = x
			light.y = y
		end
		if (event.phase == "down") then
			pressed = pressed + 1
			print("pressed: ".. pressed)
			print("Current Key keyCode: ".. event.nativeKeyCode)
			functCheck5	= functCheck5 + 1
		end
	end
	Runtime:addEventListener( "key", keys)
end

local function createLight()
	-- local x = table stuff
	-- local y = table stuff 
	--x = t[ math.random( t[1][1], t[2][1] ) ] 
	--y = t[ math.random( t[1][2], t[2][2] ) ] 
	--print(x)
	--print(y)
	--a = "63, 81"
	--tonumber(a)
	i = math.random(1, 40)
	x = t[i][1]
	y = t[i][2]
	light = display.newRoundedRect( x, y , 17, 17, 2)
	light:setFillColor( 0, 0, 0)
	light.alpha = 0.5

	keyCheck()
end

--local function continue()
--	if (functCheck5 >= 1) then
--		print("functCkeck5: "..functCheck5)
--		print("dfd:".. pressed)
--		if (pressed >= 1) then
--			print("dfd")
--			i = math.random(1, 40)
--			x = t[i][1]
--			y = t[i][2]
--			light.x = x
--			light.y = y
--		end
--	end
--end

local function game()
	if (functCheck3 >= 1) then
		createLight()
	end
	functCheck4 = functCheck4 + 1
	print("functCheck4: " .. functCheck4)
	--continue()
end 

local function time()
	a = a + 1
	print("a: "..a)
	timeUp.text = "Timer: " .. a
	--display.newText("Timer: " .. a .. 
end

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
		timer.performWithDelay( 1000, time, 0)
		functCheck3 = functCheck3 + 1
	elseif (functCheck2 >= 1) then
		nameText:setFillColor( 1, 0, 0)
	else 
		nameText.text = "Write your name."
		print(functCheck)
		print(functCheck2)
	end
	timer.performWithDelay( 1000, game )
end

enterButon:addEventListener( "touch", namePrint)
startButton:addEventListener( "touch", start)


---- Called when a key event has been received
--local function onKeyEvent( event )
--    local message = "Key '" .. event.keyName .. "' has key code: " .. tostring( event.nativeKeyCode )
--    print( message )
--    print( event.nativeKeyCode)
--    return false
--end
-- 
---- Add the key event listener
--Runtime:addEventListener( "key", onKeyEvent )----
