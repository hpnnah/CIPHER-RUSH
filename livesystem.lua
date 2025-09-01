lives = {}

function lives.load()
    current_lives = 3 -- initial value of lives
    livesImage = love.graphics.newImage("NEA IMAGES/PLAY PAGE/LIVE SYSTEM/lives.png") -- lives image is loaded
end

function lives.update(dt)

end

function lives.draw()
    if gamestate == "playing" then
        if current_lives == 3 then
            -- lives 1,2,3 image
            love.graphics.draw(livesImage,50,50)
            love.graphics.draw(livesImage,100,50)
            love.graphics.draw(livesImage,150,50)
        elseif current_lives == 2 then
            -- lives 1,2 image
            love.graphics.draw(livesImage,50,50)
            love.graphics.draw(livesImage,100,50)
        elseif current_lives == 1 then
            -- lives 1 image
            love.graphics.draw(livesImage,50,50)
        elseif current_lives == 0 then
            -- gameover screen will pop up 
            love.graphics.print("gameover")
        end
    end
end

return lives -- value of lives is returned