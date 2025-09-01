instructions_game = {} 
local button = require("MENU.button") --(which is button.lua)

function instructions_game.load() -- function for initialising (loading) up the design
    instructionsImage = love.graphics.newImage("NEA IMAGES/INSTRUCTIONS PAGE/Instructions_page.png") -- background instructions image
    local instructionsbackButtonImage = "INSTRUCTIONS PAGE/backbutton.png" -- back button image variable is defined & created
    local instructionsbackButtonHoverImage = "INSTRUCTIONS PAGE/backbuttonhover.png" -- hover back button image variable is defined & created
    -- instance of an object
    instructionsbackButton = button.new(915,850,instructionsbackButtonImage,instructionsbackButtonHoverImage) -- backbutton is created
end

function instructions_game.update(dt)

end

function instructions_game.draw()
    -- graphics is drawn and ready to be loaded into main.lua
    if instructionsImage then -- checks to see if instructionsImage is a valid image object before attempting to draw it
        love.graphics.draw(instructionsImage,15,20)
    end
    instructionsbackButton:draw()
end

return instructions_game -- value of instructions_game is returned