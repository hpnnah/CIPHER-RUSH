paused = {}

returnButton = nil -- resume variable
menuButton = nil -- return to main menu variable
local button = require("MENU.button") --(which is button.lua)
function paused.load()
    pausedImage = love.graphics.newImage("NEA IMAGES/PLAY PAGE/PAUSE PAGE/pause page .png") -- pause image is loaded
    local mainmenuButton = "PLAY PAGE/PAUSE PAGE/mainmenuButton.png"
    local mainmenuHover = "PLAY PAGE/PAUSE PAGE/mainmenuButtonhover.png"
    local resumeButton = "PLAY PAGE/PAUSE PAGE/resumeButton.png"
    local resumeHover = "PLAY PAGE/PAUSE PAGE/resumeButtonhover.png"
    -- instance of an object
    menuButton = button.new(400,600,mainmenuButton,mainmenuHover)
    returnButton = button.new(400,400,resumeButton,resumeHover)
end

function paused.draw()
    --pause menu is displayed
    if gamestate == "paused" then
        if pausedImage then
            love.graphics.draw(pausedImage,0,0)
        end
        -- button options displayed in the pause menu
        menuButton:draw()
        returnButton:draw()
    end
end
function paused.keyescape (key,x,y)
    -- when the escape key button is pressed, the gamestate changes to pause
    if key == "escape" then
        if gamestate == "playing" then
            gamestate = "paused"
        end
    end
end
return paused
