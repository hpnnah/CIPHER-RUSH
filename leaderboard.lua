leaderboard_game = {} 
local button = require("MENU.button") --(which is button.lua)

function leaderboard_game.load()-- function for loading up the design
    leaderboardImage = love.graphics.newImage("NEA IMAGES/LEADERBOARD PAGE/leaderboard.png") -- background leaderboard image is created
    local leaderboardbackButtonImage = "INSTRUCTIONS PAGE/backbutton.png"-- back button image variable is defined & created
    local leaderboardbackButtonHoverImage = "INSTRUCTIONS PAGE/backbuttonhover.png" -- hover back button image variable is defined & created
    -- instance of an object
    leaderboardbackButton = button.new(-30,850,leaderboardbackButtonImage,leaderboardbackButtonHoverImage)
end

function leaderboard_game.update()

end

function leaderboard_game.draw()
    -- graphics is drawn and ready to be loaded into main.lua
    if leaderboardImage then -- checks to see if leaderboardImage is a valid image object before attempting to draw it
        love.graphics.draw(leaderboardImage,20,20)
    end
    leaderboardbackButton:draw()
end

return leaderboard_game -- value of leaderboard_game is returned 