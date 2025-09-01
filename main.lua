-- require function is used to load my external modules into the main file 
local button = require("MENU.button") --which is button.lua
local play_game = require("MENU.GAMESTATES.EM_play_state.play") -- which is play.lua
local instructions_game = require ("MENU.GAMESTATES.instructions") -- instructions.lua
local leaderboard_game = require ("MENU.GAMESTATES.leaderboard") -- leaderboard.lua
local timer = require("MENU.GAMESTATES.EM_play_state.timesystem") -- timersystem.lua
local lives = require("MENU.GAMESTATES.EM_play_state.livesystem") -- lives.lua
local paused = require("MENU.GAMESTATES.paused") -- paused.lua
local EM_keyboard = require("MENU.GAMESTATES.EM_play_state.EMkeyboard") --EMkeyboard.lua
local score = require ("MENU.GAMESTATES.EM_play_state.scoresystem") -- scoresystem.lua
local lampboard = require ("MENU.GAMESTATES.EM_play_state.EMlampboard") -- EMlampboard.lua
local plugboard = require ("MENU.GAMESTATES.EM_play_state.EMplugboard") -- EMplugboard.lua
local notebook = require("MENU.GAMESTATES.EM_play_state.notebook") -- notebook.lua
local letter = require("MENU.GAMESTATES.EM_play_state.letterdisplay") -- letterdisplay.lua
local message= require("MENU.GAMESTATES.EM_play_state.message") -- message.lua
local rotors = require("MENU.GAMESTATES.EM_play_state.EMrotors") -- EMrotors.lua
--
play_menu = nil -- play varibale
leaderboard_menu = nil-- leaderboard varibale
instructions_menu = nil-- instructions varibale
exit_menu = nil-- exit varibale
plugboard_game = nil
function love.load() -- for love2D this is usually where we would load recources, initialise variables and set specific settings.
    local font = love.graphics.newFont("NEA IMAGES/impact.ttf",50) -- loads the font to match the game's style
    love.graphics.setFont(font)
gamestate = "menu" -- initialises value of gamestate to the main menu
    if gamestate == "menu" then
        mainImage = love.graphics.newImage("NEA IMAGES/MAIN MENU IMAGES/MENU3.png")
        love.graphics.setBackgroundColor(30/255,69/255,96/255) --sets colour of background
        --loads main menu images & hover images
        local playImage = "MAIN MENU IMAGES/PLAYBUTTON1.png"
        local playHover = "MAIN MENU IMAGES/PLAYBUTTON2.png" 
        local leaderboardImage = "MAIN MENU IMAGES/LEADERBOARDBUTTON1.png"
        local leaderboardHover = "MAIN MENU IMAGES/LEADERBOARDBUTTON2.png"
        local instructionsImage = "MAIN MENU IMAGES/INSTRUCTIONSBUTTON1.png"
        local instructionsHover = "MAIN MENU IMAGES/INSTRUCTIONSBUTTON2.png"
        local exitImage = "MAIN MENU IMAGES/EXITBUTTON1.png"
        local exitHover = "MAIN MENU IMAGES/EXITBUTTON2.png"
        -- create button instances (new object)
        play_menu = button.new(50,100,playImage,playHover)
        leaderboard_menu = button.new(50,200,leaderboardImage,leaderboardHover)
        instructions_menu = button.new(50,300,instructionsImage,instructionsHover)
        exit_menu = button.new(50,400,exitImage,exitHover)
    end
        -- loads name.lua into main.lua for love.load
    timer.load()
    lives.load()
    paused.load()
    EM_keyboard.load()
    score.load()
    lampboard.load()
    plugboard:load()
    notebook.load()
    letter.load()
    rotors.load()
    message.load()
end

function love.update(dt) -- for love2D this is usually called continuously, 'dt' stands for delta time, and is the amount of seconds since the last time this function was called.
    if gamestate == "playing" then -- checks if gamestate is "playing"
        play_game.load() -- calls function play_game.load() from play.lua 
        letter.update(dt)
    end
    if gamestate == "instructions" then-- checks if gamestate is "instructions"
        instructions_game.load()-- calls function instructions_game.load() from instructions.lua
    end
    if gamestate == "leaderboard" then-- checks if gamestate is "leaderboard"
        leaderboard_game.load()-- calls function leaderboard_game.load() from leaderboard.lua
    end
    -- loads name.lua into main.lua for love.update
    timer.update(dt) -- loads timersystem.lua into main.lua's love.update
    plugboard:update(dt)
    rotors.update(dt)
    score.update(dt)
    letter.update(dt)
    collectgarbage("collect") -- this is used to reduce memory, good for users with lower specs, doesnt lead to stack overflow
end
function love.textinput(text) 
    message.textinput(text) -- calls function textinput from message.lua
end
function love.draw() -- for love2D this is where all the graphics will be displayed so player can interact with the game.
    if gamestate == "menu" then -- checks if gamestate is "menu"
        -- when menu then all buttons appear/drawn
        -- all of these are callback functions from their designated module I made e.g play_menu from play.lua
        play_menu:draw()
        leaderboard_menu:draw()
        instructions_menu:draw()
        exit_menu:draw()
    end
    if gamestate == "menu" then-- checks if gamestate is "menu"
        if mainImage then -- checks if mainImage is a valid image
            love.graphics.draw(mainImage,15,10) -- background image is drawn 
        end
    end
    if gamestate == "playing" then -- checks if gamestate is "playing"
        play_game.draw() -- calls draw function from play.lua
        notebook.draw()
        letter.draw()
        message.draw()
    end
    if gamestate == "instructions" then -- checks if gamestate is "instructions"
        instructions_game.draw()-- calls draw function from instructions.lua
    end
    if gamestate == "leaderboard" then-- checks if gamestate is "leaderboard"
        leaderboard_game.draw()-- calls draw function from leaderboard.lua
    end
    -- loads name.lua into main.lua for love.draw
timer.draw()
lives.draw()
paused.draw()
score.draw()
lampboard.draw()
plugboard:draw()
notebook.draw()
rotors.draw()
EM_keyboard.draw(keypress)
end

function love.mousemoved (x,y) -- callback function is used when mouse is moved (this applies only to the current buttons within this function)
    if gamestate == "menu" then-- checks if gamestate is "menu"
        -- calls hover function within button.lua 
        play_menu:hover(x,y)
        leaderboard_menu:hover(x,y)
        instructions_menu:hover(x,y)
        exit_menu:hover(x,y) 
    end
    -- calls hover function within button.lua from buttons created within the designated lua files
    --checks what type of gamestate
    if gamestate == "instructions" then
        -- hover images are displayed
        instructionsbackButton:hover(x,y)
    end
    if gamestate == "leaderboard" then
        -- hover images are displayed
        leaderboardbackButton:hover(x,y)
    end
    if gamestate == "paused" then
        -- hover images are displayed
        returnButton:hover(x,y)
        menuButton:hover(x,y)
    end
    if gamestate == "playing" then
        -- hover images are displayed
        encryptButton:hover(x,y)
        decryptButton:hover(x,y)
        up1:hover(x,y)
        up2:hover(x,y)
        up3:hover(x,y)
        down1:hover(x,y)
        down2:hover(x,y)
        down3:hover(x,y)
        sendButton:hover(x,y)
    end
end
--callback function is used when mouse button is clicked
function love.mousepressed (x,y,button)
    if button == 1 then -- checks if left mouse button is clicked
        message.textboxclick(x,y)-- calls textbox function from message.lua
        if gamestate == "menu" then -- checks if gamestate is menu
            if play_menu.hovered and play_menu:hover (x,y) then -- checks if mouse is currently hovering over play hoverimage
                gamestate = "playing" -- changes gamestate to playing
            elseif leaderboard_menu.hovered and leaderboard_menu:hover (x,y) then-- checks if mouse is currently hovering over leaderboard hoverimage
                gamestate = "leaderboard" -- changes gamestate to leaderboard
            elseif instructions_menu.hovered and instructions_menu:hover (x,y) then-- checks if mouse is currently hovering over instructions hoverimage
                gamestate = "instructions"-- changes gamestate to instructions
            elseif exit_menu.hovered and exit_menu:hover (x,y) then-- checks if mouse is currently hovering over exit hoverimage
                love.event.quit()  -- exits game
            end
        elseif gamestate == "instructions" then
            if instructionsbackButton.hovered and instructionsbackButton:hover (x,y) then -- checks if user's cursour is currently on the hover image
                gamestate = "menu"-- when clicked, will return to the main menu
            end
        elseif gamestate == "leaderboard" then
            if leaderboardbackButton.hovered and leaderboardbackButton:hover (x,y) then-- checks if user's cursour is currently on the hover image
                gamestate = "menu"-- when clicked, will return to the main menu
            end
        elseif gamestate == "paused" then
            if menuButton.hovered and menuButton:hover (x,y) then-- checks if user's cursour is currently on the hover image
                gamestate = "menu"
            elseif returnButton.hovered and returnButton:hover (x,y) then-- checks if user's cursour is currently on the hover image
                gamestate = "playing"
            end
        end
        if gamestate == "playing" then -- checks if gamestate is playing
                for i,pair in ipairs(plugboard.pair) do --loops through the pairs
                    if pair:onClick(x,y) then -- calls Onclick function from Emplugboard.lua
                        plugboard:addPair(pair,pairImages)-- calls addPair function from Emplugboard.lua
                    end
                end
            rotors.imageRotate(x,y) -- calls imageRotate function from Emrotors.lua
            message.check(text,x,y)-- calls check function from message.lua

            --swaps the side of plaintext and cipher text in notebook (and vice versa)
            if coding =="decryption" then
                if encryptButton.hovered and encryptButton:hover (x,y) then -- checks if mouse is currently hovering encrypt button
                    coding = "encryption"-- notebook is now switched to encryption image
                end
            end
            if coding == "encryption" then
                if decryptButton.hovered and decryptButton:hover (x,y) then -- checks if mouse is currently hovering decrypt button
                    coding = "decryption" -- notebook is now switched to decryption image
                end
            end
        end
    end
end
function love.keypressed (key,x,y)
    paused.keyescape (key,x,y)
    EM_keyboard.enter(key,x,y)
    message.deletetext(key)
    if key == "0" then -- checks if 0 is pressed
        for i, pair in pairs(plugboard.pair) do -- cycles through current pairs
            plugboard:removePair(pair) -- deletes all pairs at once
        end
    end
end