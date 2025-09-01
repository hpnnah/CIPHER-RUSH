timer = {}
function timer.load()
    -- loads values of variables in the time.load function when gamestate is playing
    countdown = 300 -- time iona suggested
    gameover = false -- initial boolean value for gameover
    frame = 0 -- initial value for making timer go down by -1
end
function timer.update(dt)
    if gamestate == "playing" then -- checks if gamestate is playing
        frame = frame+dt -- makes timer go slower 
        if frame >1 then -- timer will now decrease by 1 second
            frame = 0
            if countdown >=0 then -- checks if countdown is 0 or greater than it
                countdown = math.floor(countdown - dt) -- math.floor rounds number so its an integer
            else
                -- when timer is 0, then a game ended screen will pop up as gameover will be set to true
                countdown = 0
                gameover = true 
            end
        end
    end
end

function timer.draw()
    if gamestate == "playing" then -- timer only starts when gamestate is currently playing
        if gameover == false then
            love.graphics.print(countdown,960,71) -- couintdown is displayed
        else
            love.graphics.print("gameover") -- gameover is displayed 
        end
    end
end

return timer -- timer value is returned