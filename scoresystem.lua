score = {}
function score.load()
    score.value = 0 -- initialising score value
end

function score.draw()
    if gamestate == "playing" then -- checks if gamestate is playing
        love.graphics.print(score.value,490,71) -- score is displayed
    end
end

return score