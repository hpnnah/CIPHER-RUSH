lampboard = {}
 -- this code just displays the image of the lampboard base on the Enigma machine.
function lampboard.load()
    EMlampboardimage = love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ENIGMA KEYBOARD/lampboard.png")
end

function lampboard.draw()
    if gamestate == "playing" then
        if EMlampboardimage then
            love.graphics.draw(EMlampboardimage,37,348)
        end
    end
end

return lampboard