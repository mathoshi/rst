-----------------------------------------------------------------------------------------
--
-- Created by: Matsuru Hoshi
-- Created on: May 22, 2019
--
-- This file contains TypeLearner, a game to pratice your keyboard typing.
-----------------------------------------------------------------------------------------

local background = display.setDefault( "background", 100/255, 100/255, 100/255)

local rect = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
rect:setFillColor( 0, 0, 0)
rect.alpha = 0

local title = display.newText( "TypeLearner", display.contentCenterX, 30, "Times", 20)

local keyboard = display.newImageRect( "assets/keyboard.png", 300, 111)
keyboard.x = display.contentCenterX
keyboard.y = 255

local nameBox = native.newTextField(display.contentCenterX, 60, 190, 15)

local nameText = display.newText( "", display.contentCenterX, 80, "Times", 10)

local letterNumberText = display.newText( "Choose the number of letters \n you wish to type.", 50, 140, "Times", 10)

local letterNumberTextBox = native.newTextField( 30, display.contentCenterY, 50, 10)

local intstructionText = display.newText( "Train to type faster. Hit the keys that light up!", display.contentCenterX, 155, "Times", 10)

local enterButon = display.newImageRect( "assets/button.png", 30, 30)
enterButon.x = 370
enterButon.y = 60

local letterEnterButton = display.newImageRect( "assets/button.png", 20, 20)
letterEnterButton.x = 70
letterEnterButton.y = 160

local startButton = display.newImageRect( "assets/startButton.png", 60, 47)
startButton.x = display.contentCenterX
startButton.y = 180

local osText = display.newText( "Choose your opertating system for the game to work properly.", display.contentCenterX, 105, "Times", 10)

local windowsButton = display.newImageRect( "assets/windowsbutton.png", 20, 20)
windowsButton.x = 200
windowsButton.y = 130
windowsButton.id = "windows"

local appleButton = display.newImageRect( "assets/applebutton.png", 20, 18)
appleButton.x = 280
appleButton.y = 130
appleButton.id = "apple"

local timeUp = display.newText( "", 30, 40, "Times", 10)

local percentage = display.newText( "", 100, 40, "Times", 10)

local slowRect = display.newRect( display.contentCenterX, display.contentCenterY, display.actualContentWidth, display.actualContentHeight)
slowRect:setFillColor( 0, 0, 0)
slowRect.alpha = 0

local slowEnterButton = display.newImageRect( "assets/button.png", 30, 30)
slowEnterButton.x = 310	
slowEnterButton.y = 185
slowEnterButton.alpha = 0

local slowText = display.newText( "", display.contentCenterX, 140, "Times", 10)

local slowWord = display.newText( "", display.contentCenterX, 157, "Times", 10)

local endText = display.newText( "", display.contentCenterX, 80, "Times", 13)

local correct = 0
local pressed = 0
local percent = 0
local a = 0
local score = 0 
local letters = 0
local name = 0
			    

local function let( event )
	letters = tonumber(letterNumberTextBox.text)
	print(letters)
end

letterEnterButton:addEventListener( "touch", let)

windowsKeys = {}

windowsKeys[1] = {63, 81} -- escape 
windowsKeys[1].id = "27"
windowsKeys[2] = {90, 81} -- f1
windowsKeys[2].id = "112"
windowsKeys[3] = {106, 81} -- f2
windowsKeys[3].id = "113"
windowsKeys[4] = {122.5, 81} -- f3
windowsKeys[4].id = "114"
windowsKeys[5] = {139, 81} -- f4
windowsKeys[5].id = "115"
windowsKeys[6] = {164, 81} -- f5
windowsKeys[6].id = "116"
windowsKeys[7] = {180, 81} -- f6
windowsKeys[7].id = "117"
windowsKeys[8] = {197, 81} -- f7
windowsKeys[8].id = "118"
windowsKeys[9] = {213, 81} -- f8
windowsKeys[9].id = "119" 
windowsKeys[10] = {238, 81} -- f9
windowsKeys[10].id = "120"
windowsKeys[11] = {254, 81} -- f10
windowsKeys[11].id = "121"
windowsKeys[12] = {270, 81} -- f11
windowsKeys[12].id = "122"
windowsKeys[13] = {287, 81} -- f12
windowsKeys[13].id = "123"
windowsKeys[14] = {62, 112.5} -- ` ~
windowsKeys[14].id = "192"
windowsKeys[15] = {78, 112.5} -- 1
windowsKeys[15].id = "49"
windowsKeys[16] = {94, 112.5} -- 2
windowsKeys[16].id = "50"
windowsKeys[17] = {110.5, 112.5} -- 3
windowsKeys[17].id = "51"
windowsKeys[18] = {126.5, 112.5} -- 4
windowsKeys[18].id = "52"
windowsKeys[19] = {142.5, 112.5} -- 5
windowsKeys[19].id = "53"
windowsKeys[20] = {158, 112.5} -- 6
windowsKeys[20].id = "54"
windowsKeys[21] = {175, 112.5} -- 7
windowsKeys[21].id = "55"
windowsKeys[22] = {191, 112.4} -- 8
windowsKeys[22].id = "56"
windowsKeys[23] = {207, 112.5} -- 9
windowsKeys[23].id = "57"
windowsKeys[24] = {223, 112.5} -- 0
windowsKeys[24].id = "48"
windowsKeys[25] = {239.5, 112.5} -- -
windowsKeys[25].id = "189"
windowsKeys[26] = {255.5, 112.5} -- = +
windowsKeys[26].id = "187"
windowsKeys[27] = {280, 112.5} -- delete back
windowsKeys[27].id = "8"
windowsKeys[28] = {369, 112.5} -- num lock
windowsKeys[28].id = "144"
windowsKeys[29] = {385, 112.5} -- num /
windowsKeys[29].id = "111"
windowsKeys[30] = {402, 112.5} -- *
windowsKeys[30].id = "106"
windowsKeys[31] = {418, 112.5} -- num -
windowsKeys[31].id = "109"
windowsKeys[32] = {66, 130} -- tab
windowsKeys[32].id = "9"
windowsKeys[33] = {87, 130} -- q
windowsKeys[33].id = "81"
windowsKeys[34] = {102.5, 130} -- w
windowsKeys[34].id = "87"
windowsKeys[35] = {119, 130} -- e
windowsKeys[35].id = "69"
windowsKeys[36] = {135, 130} -- r
windowsKeys[36].id = "82"
windowsKeys[37] = {151, 130} -- t
windowsKeys[37].id = "84"
windowsKeys[38] = {167, 130} -- y
windowsKeys[38].id = "89"
windowsKeys[39] = {183, 130} -- u
windowsKeys[39].id = "85"
windowsKeys[40] = {199, 130} -- i
windowsKeys[40].id = "73"
windowsKeys[25] = {215, 130} -- o
windowsKeys[25].id = "79"
windowsKeys[26] = {231, 130} -- p
windowsKeys[26].id = "80"
windowsKeys[27] = {247, 130} -- [ }
windowsKeys[27].id = "219"
windowsKeys[28] = {263.5, 130} -- ] }
windowsKeys[28].id = "187"
windowsKeys[29] = {283.5, 130} -- | \
windowsKeys[29].id = "220"
windowsKeys[30] = {368.5, 130} -- num 7
windowsKeys[30].id = "55"
windowsKeys[31] = {385, 130} -- num 8
windowsKeys[31].id = "56"
windowsKeys[32] = {401, 130} -- num 9
windowsKeys[32].id = "57"
windowsKeys[33] = {418, 130} -- num +
windowsKeys[33].id = "107"									
windowsKeys[30] = {68, 147} -- caps lock
windowsKeys[30].id = "20"
windowsKeys[31] = {89, 146.5} -- a
windowsKeys[31].id = "65"
windowsKeys[32] = {105.5, 146.5} -- s
windowsKeys[32].id = "83"
windowsKeys[33] = {121.5, 146.5} -- d
windowsKeys[33].id = "68"
windowsKeys[34] = {138, 146.5} -- f
windowsKeys[34].id = "70"
windowsKeys[35] = {154, 146.5} -- g
windowsKeys[35].id = "71"
windowsKeys[36] = {170, 146.5} -- h
windowsKeys[36].id = "72"
windowsKeys[37] = {186.5, 146.5} -- j
windowsKeys[37].id = "74"
windowsKeys[38] = {202.5, 146.5} -- k
windowsKeys[38].id = "75"
windowsKeys[39] = {218.5, 146.5} -- l
windowsKeys[39].id = "76"
windowsKeys[40] = {235, 146.5} -- : ;
windowsKeys[40].id = "186"
windowsKeys[41] = {251, 146.5} -- " ''
windowsKeys[41].id = "222"
windowsKeys[42] = {277, 146.5} -- enter
windowsKeys[42].id = "13"
windowsKeys[43] = {368.5, 163.5} -- num 4
windowsKeys[43].id = "52"
windowsKeys[44] = {385, 163.5} -- num 5
windowsKeys[44].id = "53"
windowsKeys[45] = {401, 163.5} -- num 6
windowsKeys[45].id = "54"
windowsKeys[43] = {73, 163.5} -- left shift
windowsKeys[43].id = "16"
windowsKeys[44] = {97.5, 163.5} -- z
windowsKeys[44].id = "90"
windowsKeys[45] = {114, 163.5} -- x
windowsKeys[45].id = "88"
windowsKeys[46] = {130, 163.5} -- c
windowsKeys[46].id = "67"
windowsKeys[47] = {146, 163.5} -- v
windowsKeys[47].id = "86"
windowsKeys[48] = {162.5, 163.5} -- b
windowsKeys[48].id = "66"
windowsKeys[49] = {178.5, 163.5} -- n
windowsKeys[49].id = "78"
windowsKeys[50] = {195, 163.5} -- m
windowsKeys[50].id = "77"
windowsKeys[51] = {211, 163.5} -- < ,
windowsKeys[51].id = "188"
windowsKeys[52] = {227, 163.5} -- > .
windowsKeys[52].id = "190"
windowsKeys[53] = {243.5, 163.5} -- ? /
windowsKeys[53].id = "191"
windowsKeys[60] = {328, 163} -- up arrow
windowsKeys[60].id = "38"
windowsKeys[55] = {368.5, 163} -- num 1
windowsKeys[55].id = "59"
windowsKeys[56] = {385, 163} -- num 2
windowsKeys[56].id = "58"
windowsKeys[57] = {401, 163} -- num 3
windowsKeys[57].id = "49"
windowsKeys[55] = {66, 180.5} -- control
windowsKeys[55].id = "17"
windowsKeys[56] = {109, 180.5} -- alt option
windowsKeys[56].id = "18"
windowsKeys[57] = {162, 180.5} -- space
windowsKeys[57].id = "32"
windowsKeys[59] = {312, 180} -- left arrow
windowsKeys[59].id = "37"
windowsKeys[61] = {328, 180} -- down arrow
windowsKeys[61].id = "40"
windowsKeys[62] = {344, 180} -- right arrow
windowsKeys[62].id = "39"
windowsKeys[63] = {401, 180.5} -- num .
windowsKeys.id = "110"



macKeys = {}

macKeys[1] = {63, 81} -- escape
macKeys[1].id = "53"
macKeys[2] = {62, 112.5} -- ~
macKeys[2].id = "50"
macKeys[3] = {78, 112.5} -- 1
macKeys[3].id = "18"
macKeys[4] = {94, 112.5} -- 2
macKeys[4].id = "19"
macKeys[5] = {110.5, 112.5} -- 3
macKeys[5].id = "20"
macKeys[6] = {126.5, 112.5} -- 4
macKeys[6].id = "21"
macKeys[7] = {142.5, 112.5} -- 5
macKeys[7].id = "23"
macKeys[8] = {158, 112.5} -- 6
macKeys[8].id = "22"
macKeys[9] = {175, 112.5} -- 7
macKeys[9].id = "26"
macKeys[10] = {191, 112.4} -- 8
macKeys[10].id = "28"
macKeys[11] = {207, 112.5} -- 9
macKeys[11].id = "25"
macKeys[12] = {223, 112.5} -- 0
macKeys[12].id = "29"
macKeys[13] = {239.5, 112.5} -- -
macKeys[13].id = "27"
macKeys[14] = {255.5, 112.5} -- =
macKeys[14].id = "24"
macKeys[15] = {280, 112.5} -- delete back
macKeys[15].id = "51"
macKeys[16] = {66, 130} -- tab
macKeys[16].id = "48"
macKeys[17] = {87, 130} -- q
macKeys[17].id = "12"
macKeys[18] = {102.5, 130} -- w
macKeys[18].id = "13"
macKeys[19] = {119, 130} -- e
macKeys[19].id = "14"
macKeys[20] = {135, 130} -- r
macKeys[20].id = "15"
macKeys[21] = {151, 130} -- t
macKeys[21].id = "17"
macKeys[22] = {167, 130} -- y
macKeys[22].id = "16"
macKeys[23] = {183, 130} -- u
macKeys[23].id = "32"
macKeys[24] = {199, 130} -- i
macKeys[24].id = "34"
macKeys[25] = {215, 130} -- o
macKeys[25].id = "31"
macKeys[26] = {231, 130} -- p
macKeys[26].id = "35"
macKeys[27] = {247, 130} -- [ }
macKeys[27].id = "33"
macKeys[28] = {263.5, 130} -- ] }
macKeys[28].id = "30"
macKeys[29] = {283.5, 130} -- | \
macKeys[29].id = "42"
macKeys[30] = {68, 147} -- caps lock
macKeys[30].id = "57"
macKeys[31] = {89, 146.5} -- a
macKeys[31].id = "0"
macKeys[32] = {105.5, 146.5} -- s
macKeys[32].id = "1"
macKeys[33] = {121.5, 146.5} -- d
macKeys[33].id = "2"
macKeys[34] = {138, 146.5} -- f
macKeys[34].id = "3"
macKeys[35] = {154, 146.5} -- g
macKeys[35].id = "5"
macKeys[36] = {170, 146.5} -- h
macKeys[36].id = "4"
macKeys[37] = {186.5, 146.5} -- j
macKeys[37].id = "38"
macKeys[38] = {202.5, 146.5} -- k
macKeys[38].id = "40"
macKeys[39] = {218.5, 146.5} -- l
macKeys[39].id = "37"
macKeys[40] = {235, 146.5} -- : ;
macKeys[40].id = "41"
macKeys[41] = {251, 146.5} -- " ''
macKeys[41].id = "39"
macKeys[42] = {277, 146.5} -- enter
macKeys[42].id = "36"
macKeys[43] = {73, 163.5} -- left shift
macKeys[43].id = "56"
macKeys[44] = {97.5, 163.5} -- z
macKeys[44].id = "6"
macKeys[45] = {114, 163.5} -- x
macKeys[45].id = "7"
macKeys[46] = {130, 163.5} -- c
macKeys[46].id = "8"
macKeys[47] = {146, 163.5} -- v
macKeys[47].id = "9"
macKeys[48] = {162.5, 163.5} -- b
macKeys[48].id = "11"
macKeys[49] = {178.5, 163.5} -- n
macKeys[49].id = "45"
macKeys[50] = {195, 163.5} -- m
macKeys[50].id = "46"
macKeys[51] = {211, 163.5} -- < ,
macKeys[51].id = "43"
macKeys[52] = {227, 163.5} -- > .
macKeys[52].id = "47"
macKeys[53] = {243.5, 163.5} -- ? /
macKeys[53].id = "44"
macKeys[54] = {273, 163.5} -- right shift
macKeys[54].id = "60"
macKeys[55] = {66, 180.5} -- control
macKeys[55].id = "59"
macKeys[56] = {109, 180.5} -- alt option
macKeys[56].id = "58"
macKeys[57] = {162, 180.5} -- space
macKeys[57].id = "49"
macKeys[58] = {219, 180.5} -- left alt option
macKeys[58].id = "61"
macKeys[59] = {312, 180} -- left arrow
macKeys[59].id = "123"
macKeys[60] = {328, 163} -- up arrow
macKeys[60].id = "126"
macKeys[61] = {328, 180} -- down arrow
macKeys[61].id = "125"
macKeys[62] = {344, 180} -- right arrow
macKeys[62].id = "124"

-- Words to be used if 20 twenty keys are pressed. Look at slowDown() on line 337.
words = {"different", "thaw", "swim", "overeat", "supplementary", 
"stock", "bless", "drive", "expectation", "chair", "original", "mess", 
"wonder", "outside", "wolf", "bread", "opera"} 

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

local function macCheck( event )
	windowsKeys = nil
	print("You are running macOS")
end

local function windowsCheck( event )
	macKeys = nil
	print("You are running Windows")	
end

local function namePrint( event )
	if (nameBox.text ~= "") then
		nameText.text = "Hi, ".. nameBox.text ..". Welcome!"
		print("name")
		name = nameBox.text
		functCheck = functCheck + 1
		nameText:setFillColor( 1, 1, 1)
	else
		functCheck2 = functCheck2 +1
		print("write your name")
		nameText.text = "Write your name."
	end
end
	
local function finish()
	display.remove(timeUp)
	display.remove(keyboard)
	display.remove(light)
	display.remove(percentage)
	rect.alpha = 1
	score = (correct / a) * 100
	endText.text = "You got a score of: " .. math.round(score) 
end
local function slowCheck( event )
	if (slowTextBox.text == tostring(words[r])) then
		slowRect.alpha = 0
		display.remove(slowTextBox)
		slowText.text = ""
		slowWord.text = ""
		slowEnterButton.alpha = 0
		light.alpha = 0.5
	end
end

local function slowDown()
	r = math.random(1, 17)
	slowRect.alpha = 0.9
	slowTextBox = native.newTextField( display.contentCenterX, 185, 100, 13	)
	native.setKeyboardFocus( slowTextBox )
	slowText.text = "Type the following word to continue."
	slowWord.text = tostring(words[r])
	slowEnterButton.alpha = 1
	light.alpha = 0
	slowEnterButton:addEventListener( "touch", slowCheck)
	print("hey abjdfsdhffldfhdsjhdddddjshfdshfjsdfhsdkjfhdskfh")
end



local function keyCheck()
	local function keys( event )
		if (windowsKeys == nil) then
			if ((tostring(event.nativeKeyCode) == macKeys[i].id) and (event.phase == "down")) then
				print(event.nativeKeyCode)
				correct = correct + 1
				print("correct : " .. correct)
				i = math.random(1, 62)
				x = macKeys[i][1]
				y = macKeys[i][2]
				light.x = x
				light.y = y
			end
		elseif ((tostring(event.nativeKeyCode) == windowsKeys[i].id) and (event.phase == "down")) then
			correct = correct + 1
			print("correct : " .. correct)
			i = math.random(1, 40)
			x = windowsKeys[i][1]
			y = windowsKeys[i][2]
			light.x = x
			light.y = y
		end
		if (event.phase == "down") then
			pressed = pressed + 1
			percent = (correct / pressed) * 100
			percentage.text = "Accuracy: " .. math.round(percent) .. "%"
			print("pressed: ".. pressed)
			--print("Current Key keyCode: ".. event.nativeKeyCode)
			functCheck5	= functCheck5 + 1
			if (pressed == letters) then
				finish()
				local f = assert(io.open("/tmp/test.log", "a+"))
				f:write(name .. ", your accuracy is: ".. percent .. " \n")
				f:write(name .. ", your time is: " .. a .. " \n")
				f:write(name .. ", your number of correct letters is: ".. correct .. " \n")
				f:write(name .. ", your number of pressed letters is: ".. pressed .. " \n")
			    f:close()
			end
			if ((pressed ~= letters) and ((pressed % 20) == 0)) then
				slowDown()
			end
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
	if (windowsKeys == nil ) then
		i = math.random(1, 62)
		x = macKeys[i][1]
		y = macKeys[i][2]
		light = display.newRoundedRect( x, y, 17, 17, 2)
		light:setFillColor( 0, 0, 0)
		light.alpha = 0.5
	elseif (macKeys == nil) then
		--i = math.random(1, 40)
		--x = windowsKeys[i][1]
		--y = windowsKeys[i][2]
		light = display.newRoundedRect( 377, 180.5, 17, 17, 2)
		light:setFillColor( 0, 0, 0)
		light.alpha = 0.5
	end
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
	-- a is the time in seconds. It is created on line 56.
	a = a + 1
	print("a: "..a)
	timeUp.text = "Timer: " .. a
	--percent = (correct / pressed) * 100
	--percentage.text = "Accuracy: " .. math.round(percent) .. "%"
	--display.newText("Timer: " .. a .. 
end

local function start( event )
	if (functCheck >= 1) then
		display.remove(startButton)
		display.remove(enterButon)
		display.remove(nameBox)
		display.remove(nameText)
		display.remove(intstructionText)
		display.remove(osText)
		display.remove(windowsButton)
		display.remove(appleButton)
		display.remove(letterNumberText)
		display.remove(letterNumberTextBox)
		display.remove(letterEnterButton)
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

appleButton:addEventListener( "touch", macCheck)
windowsButton:addEventListener( "touch", windowsCheck)
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
