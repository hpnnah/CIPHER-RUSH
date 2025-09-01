play_game = {}
local button = require("MENU.button") --(which is button.lua)


function play_game.load()-- function for initialising (loading) up the design
    playImage = love.graphics.newImage("NEA IMAGES/PLAY PAGE/playbackgroundpage .png") -- background image is loaded
    EMimage = love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/BASE/base.png") -- EM base is loaded
end

function play_game.update(dt) -- function for when game needs to be updated when something changes (e.g user clicking a button)

end

function play_game.draw()
    -- graphics is drawn and ready to be loaded into main.lua
    if playImage then -- checks to see if playImage is a valid image object before attempting to draw it
        love.graphics.draw(playImage,10,20)
    end
    if EMimage then
        love.graphics.draw(EMimage,0,180)
    end
end

return play_game -- value of play_game is returned