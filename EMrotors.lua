rotors = {}
local button = require("MENU.button") -- button.lua is called
local rotorImages = { -- images for rotor
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR A.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR B.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR C.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR D.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR E.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR F.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR G.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR H.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR I.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR J.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR K.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR L.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR M.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR N.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR O.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR P.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR Q.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR R.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR S.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR T.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR U.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR V.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR W.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR X.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR Y.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/ROTORS/ROTOR Z.png")
}
--global variables, going to be used in other modules
rotor_I =1
rotor_II =1
rotor_III =1
function rotors.load()
    -- images for creating a new button object
    local triangleButtonsup1 = "PLAY PAGE/ENIGMA MACHINE/ROTORS/upButton.png"
    local triangleButtonsup2 = "PLAY PAGE/ENIGMA MACHINE/ROTORS/upButton.png"
    local triangleButtonsdown1 = "PLAY PAGE/ENIGMA MACHINE/ROTORS/downButton.png"
    local triangleButtonsdown2 = "PLAY PAGE/ENIGMA MACHINE/ROTORS/downButton.png"
    --instance of an object for rotors
    up1 = button.new(150,225,triangleButtonsup1,triangleButtonsup2)
    up2= button.new(200,225,triangleButtonsup1,triangleButtonsup2)
    up3= button.new(250,225,triangleButtonsup1,triangleButtonsup2)
    down1= button.new(149,325,triangleButtonsdown1,triangleButtonsdown2)
    down2= button.new(199,325,triangleButtonsdown1,triangleButtonsdown2)
    down3= button.new(249,325,triangleButtonsdown1,triangleButtonsdown2)
end

function rotors.update(dt)

end
function rotors.imageRotate(x,y) 
    -- this increments rotors I,II,III by 1 when the up 1,2,3 button is clicked
    if up1:hover (x,y) then
        if up1.hovered then
            if rotor_I == 26 then
                rotor_I = 1
            end
            rotor_I = rotor_I +1
            love.graphics.draw(rotorImages[rotor_I],150,240)
        end
    end
    if up2:hover (x,y) then
        if up2.hovered then
            if rotor_II == 26 then
                rotor_II = 1
            end
            rotor_II = rotor_II +1
            love.graphics.draw(rotorImages[rotor_II],150,240)
        end
    end
    if up3:hover (x,y) then
        if up3.hovered then
            if rotor_III == 26 then
                rotor_III = 1
            end
            rotor_III = rotor_III +1
            love.graphics.draw(rotorImages[rotor_III],150,240)
        end
    end
    -- this decrements rotors I,II,III by 1 when the down 1,2,3 button is clicked
    if down1:hover (x,y) then
        if down1.hovered then
            if rotor_I == 1 then
                rotor_I=27
            end
            rotor_I = rotor_I -1
            love.graphics.draw(rotorImages[rotor_I],150,240)
        end
    end
    if down2:hover (x,y) then
        if down2.hovered then
            if rotor_II == 1 then
                rotor_II=27
            end
            rotor_II = rotor_II -1
            love.graphics.draw(rotorImages[rotor_II],150,240)
        end
    end
    if down3:hover (x,y) then
        if down3.hovered then
            if rotor_III == 1 then
                rotor_III=27
            end
            rotor_III = rotor_III -1
            love.graphics.draw(rotorImages[rotor_III],150,240)
        end
    end
end
function rotors.draw()
    -- images for rotors are drawn
    if gamestate == "playing" then
        -- uses rotors I,II,III as indexes so the image can change when the up/down button is clicked by user
        love.graphics.draw(rotorImages[rotor_I],150,240)
        love.graphics.draw(rotorImages[rotor_II],200,240)
        love.graphics.draw(rotorImages[rotor_III],250,240)
        up1:draw()
        up2:draw()
        up3:draw()
        down1:draw()
        down2:draw()
        down3:draw()
    end
end


return rotors