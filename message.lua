message = {}
local button = require("MENU.button") -- button.lua
local letterdisplay= require("MENU.GAMESTATES.EM_play_state.letterdisplay") -- letterdisplay.lua
local scoresystem= require("MENU.GAMESTATES.EM_play_state.scoresystem") -- scoresystem.lua
local livesystem= require("MENU.GAMESTATES.EM_play_state.livesystem") -- livesystem.lua
local plugboard = require ("MENU.GAMESTATES.EM_play_state.EMplugboard") -- EMplugboard.lua
local activeInput = false -- makes sure that textbox cant be selected immediately until clicked
local height = 150
local width = 380
--check

function message.load()
    userInput = "" -- user's input
    --images loaded in for object
    local sendImage1 = "PLAY PAGE/sendButton.png"
    local sendImage2 = "PLAY PAGE/sendButton.png"
    -- instance of a new object
    sendButton = button.new(630,900,sendImage1,sendImage2)
end

function message.draw()
    sendButton:draw() -- button is displayed

    --textbox is displayed and user's input is displayed
    love.graphics.rectangle("line",630,750,380,150)
    love.graphics.print(userInput,630,750)
end

function message.textboxclick(x,y)
    -- if user clicks within baseXheight of the box then textbox is ready to be inputted with user's text
    if x >= 630 and x <= 630 + width and y >= 750 and y <= 750 + height then
        activeInput = true -- user can now type in box
    else
        activeInput = false -- not selected, so user can't type in box
    end
end


function message.deletetext(key)
    if activeInput then-- checks if activeInput is valid
        if key == "backspace" then
            --checks when backspace is pressed
            userInput = userInput.sub(userInput,1,-2) -- removes a letter by one through substring
        end
    end
end

function message.textinput(text)
    if activeInput then -- checks if activeInput is valid
        userInput = userInput .. text -- allows user to type in text box
    end
    return userInput
end

function message.check(text,x,y)
    -- gets value of the current message being used on the letter
    -- checks when send button is clicked by user
    if sendButton.hovered and sendButton:hover (x,y) then
        if coding == "encryption" then -- checks if notebook is selected encryption
            if userInput == ciphertexts[letterdisplay.random] then -- compares user's text and the current plaintext chosen in the array
                letter.random() -- letter.random() function is called
                score.value = score.value+100 -- score increased when right
                love.graphics.print(score.value,490,71)
            else
                current_lives = current_lives-1 -- lives lost by one when wrong
            end
        elseif coding == "decryption" then
            if userInput == plaintexts[letterdisplay.random] then -- compares user's text and the current plaintext chosen in the array
                letter.random() -- letter.random() function is called
                score.value = score.value+100 -- score increased when right
                love.graphics.print(score.value,490,71)
            else
                current_lives = current_lives-1 -- lives lost by one when wrong
            end
        end
    end
end


return message -- message module value is returned