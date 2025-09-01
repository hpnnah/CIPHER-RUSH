EM_keyboard = {}
local EMlampboard = require ("MENU.GAMESTATES.EM_play_state.EMlampboard") -- EMplugboard.lua
local notebook= require("MENU.GAMESTATES.EM_play_state.notebook") -- notebook.lua
local EMrotors= require("MENU.GAMESTATES.EM_play_state.EMrotors") -- notebook.lua
local EMplugboard = require("MENU.GAMESTATES.EM_play_state.EMplugboard") -- notebook.lua
local keypress =0
local keyboardTimer = 2
local displayImage = true
local totalRotors
local lampboardImages = {
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_A.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_B.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_C.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_D.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_E.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_F.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_G.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_H.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_I.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_J.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_K.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_L.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_N.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_M.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_O.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_P.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_Q.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_R.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_S.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_T.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_U.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_V.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_W.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_X.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_Y.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_Z.png")
}
local lampboardPositions = { -- position coordinates for each letter on lampboard for x,y when key pressed
{x=59,y=380}, -- a
{x=246,y=411},-- b
{x=165,y=411},-- c
{x=142,y=380},-- d
{x=123,y=349},-- e
{x=184,y=380},-- f
{x=226,y=380},-- g
{x=267,y=380},-- h
{x=328,y=349},-- i
{x=307,y=380},-- j
{x=348,y=380},-- k
{x=370,y=411},-- l
{x=328,y=411},-- m
{x=287,y=411},-- n
{x=370,y=349},-- o
{x=40,y=411},-- p
{x=40,y=349},-- q
{x=165,y=349},-- r
{x=101,y=380},-- s
{x=205,y=349},-- t
{x=287,y=349},-- u
{x=205,y=411},-- v
{x=81,y=349},-- w
{x=123,y=411},-- x
{x=81,y=411},-- y
{x=246,y=349}-- z
}
local keyboard_Images = {
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSA.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSB.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSC.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSD.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSE.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSF.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSG.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSH.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSI.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSJ.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSK.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSL.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSM.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSN.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSO.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSP.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSQ.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSR.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSS.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESST.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSU.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSV.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSW.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSX.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSY.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESSZ.png")
    }
    local placeValue = { -- position coordinates for each letter on EM keyboard for x,y when key pressed
        {x=59,y=485}, -- a
        {x=246,y=518},-- b
        {x=165,y=518},-- c
        {x=142,y=485},-- d
        {x=123,y=452},-- e
        {x=184,y=485},-- f
        {x=226,y=485},-- g
        {x=267,y=485},-- h
        {x=328,y=452},-- i
        {x=307,y=485},-- j
        {x=348,y=485},-- k
        {x=370,y=518},-- l
        {x=328,y=518},-- m
        {x=287,y=518},-- n
        {x=370,y=452},-- o
        {x=40,y=518},-- p
        {x=40,y=452},-- q
        {x=165,y=452},-- r
        {x=101,y=485},-- s
        {x=205,y=452},-- t
        {x=287,y=452},-- u
        {x=205,y=518},-- v
        {x=81,y=452},-- w
        {x=123,y=518},-- x
        {x=81,y=518},-- y
        {x=246,y=452}-- z
    }
function EM_keyboard.load()
    keyboardImage =  love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/EMwholekeyboard.png")
    for i = 1, 26 do
        local keyboardLocation = string.format("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/PRESS%s.png", string.char(96 + i)) -- goes through each keyboard image alphabetically
        keyboard_Images[i] = love.graphics.newImage(keyboardLocation) -- new image is loaded
    end
    for i = 1,26 do
        local lampboardLocation = string.format("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/LIGHT UP KEYBOARD/LIGHT_%s.png", string.char(96 + i))-- goes through each lampboard image alphabetically
        lampboardImages[i] = love.graphics.newImage(lampboardLocation)-- new image is loaded
    end
end

function EM_keyboard.update(dt)

end
function EM_keyboard.ceaserciphershift()
    if gamestate == "playing" then
        --initialises value
        local pairshift = 0 -- no pairs have been made yet
        pairColour = ""
        -----
        if coding == "encryption" or coding == "decryption" then
            if colourPair then
                -- checks to see which is the current pair on the plugboard
                -- the max they can shift using the plugboard is 4
                if colourPair == 1 or colourPair == 2 then
                pairColour = "red"
                pairshift = 1
                elseif colourPair == 3 or colourPair == 4 then
                pairColour = "yellow"
                pairshift = 2
                elseif colourPair == 5 or colourPair == 6 then
                pairColour = "green"
                pairshift = 3
                elseif colourPair == 7 or colourPair == 8 then
                pairColour = "blue"
                pairshift = 4
                end 
            end
            local totalRotors = (rotor_I+rotor_II+rotor_III) -- global variables rotor I,II,III are added on as it also affects the shift taking place
            shift = totalRotors+pairshift -- this is then added to the global variable shift so the ceaser cipher can take place
        end
    end
    return shift
end

function EM_keyboard.draw(keypress)
    if gamestate == "playing" then
        if keyboardImage then -- checks if keyboardImage is valid
            love.graphics.draw(keyboardImage,37,451)
        end
        if EM_keyboard.keypress and keyboard_Images[EM_keyboard.keypress] then -- checks if user has pressed a key on the keyboard
            local keyboardCoordinate = (placeValue[EM_keyboard.keypress]) -- chooses the coordinates based on the users input from A-Z
            if keyboardCoordinate then -- checks if coordinates are valid
                love.graphics.draw(keyboard_Images[EM_keyboard.keypress],keyboardCoordinate.x,keyboardCoordinate.y) -- this takes over x,y value so it can be overwritten when a new key is displayed
            end
            local shift = EM_keyboard.ceaserciphershift() -- takes value of shift from ceaserciphershift function
            if coding == "encryption" then
                local shiftIndex = (EM_keyboard.keypress+shift) % 26-- shift is added the keyboard press so this shift index then takes the remainder of this (MOD 26)so it can encrypt the message 
                local lampboardCoordinate = (lampboardPositions[shiftIndex])-- finds the x,y coordinates using the new shiftIndex
                if lampboardCoordinate then
                    love.graphics.draw(lampboardImages[shiftIndex],lampboardCoordinate.x,lampboardCoordinate.y) --lampboard letter is lit up
                end
            elseif coding == "decryption" then
                local shift = EM_keyboard.ceaserciphershift()-- takes value of shift from ceaserciphershift function
                local shiftIndex = (EM_keyboard.keypress - shift) % 26 -- shift is taken away from the keyboard press then takes the remainder of this (MOD 26)so it can encrypt the message 
                if shiftIndex < 0 then -- checks if its a negative value so it doesnt lead to an error in the program
                    shiftIndex = shiftIndex + 26 -- if its negative, 26 is added to be positive
                end
                local lampboardCoordinate = (lampboardPositions[shiftIndex]) -- finds the x,y coordinates using the new shiftIndex
                if lampboardCoordinate then
                    love.graphics.draw(lampboardImages[shiftIndex],lampboardCoordinate.x,lampboardCoordinate.y)--lampboard letter is lit up
                end
            end
        end
    end
end

function EM_keyboard.enter(key,x,y)
    -- this takes in the user's input from A-Z
    if gamestate == "playing" then
        if key >= "a" and key <= "z" then
            EM_keyboard.keypress = string.byte(key) - 96 -- converts the key pressed to an index value to perform a shift.
        end
    end
end



return EM_keyboard