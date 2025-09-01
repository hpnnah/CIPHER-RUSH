local plugboard = {}
plugboard.__index = plugboard -- new class
local plugImage = { -- array of plugboard button images
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/1Q.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/2W.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/3E.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/4R.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/5T.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/6Z.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/7U.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/8I.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/9O.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z10_A.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z11_S.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z12_D.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z13_F.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z14_G.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z15_H.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z16_J.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z17_K.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z18_P.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z19_Y.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z20_X.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z21_C.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z22_V.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z23_B.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z24_N.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z25_M.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/Z26_L.png")
}

local pairImages = { -- array of plugboard pair images
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/redpair.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/redpair.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/yellowpair.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/yellowpair.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/greenpair.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/greenpair.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/bluepair.png"),
    love.graphics.newImage("NEA IMAGES/PLAY PAGE/ENIGMA MACHINE/PLUGBOARD/bluepair.png")
}

function plugboard:load(x,y)
    self.plug = { -- self is an argument used to pass to the function/procedure
        -- array of plug buttons that are objects 
        plugboard_Q = plugboard.new(42,565,plugImage[1]),
        plugboard_W = plugboard.new(82,565,plugImage[2]),
        plugboard_E = plugboard.new(122,565,plugImage[3]),
        plugboard_R = plugboard.new(162,565,plugImage[4]),
        plugboard_T = plugboard.new(202,565,plugImage[5]),
        plugboard_Z = plugboard.new(242,565,plugImage[6]),
        plugboard_U = plugboard.new(282,565,plugImage[7]),
        plugboard_I = plugboard.new(322,565,plugImage[8]),
        plugboard_O = plugboard.new(362,565,plugImage[9]),
        plugboard_A = plugboard.new(62,600,plugImage[10]),
        plugboard_S = plugboard.new(102,600,plugImage[11]),
        plugboard_D = plugboard.new(142,600,plugImage[12]),
        plugboard_F = plugboard.new(182,600,plugImage[13]),
        plugboard_G = plugboard.new(222,600,plugImage[14]),
        plugboard_H = plugboard.new(262,600,plugImage[15]),
        plugboard_J = plugboard.new(302,597,plugImage[16]),
        plugboard_K = plugboard.new(342,600,plugImage[17]),
        plugboard_P = plugboard.new(42,632,plugImage[18]),
        plugboard_Y = plugboard.new(82,635,plugImage[19]),
        plugboard_X = plugboard.new(122,634,plugImage[20]),
        plugboard_C = plugboard.new(162,634,plugImage[21]),
        plugboard_V = plugboard.new(202,635,plugImage[22]),
        plugboard_B = plugboard.new(242,635,plugImage[23]),
        plugboard_N = plugboard.new(282,635,plugImage[24]),
        plugboard_M = plugboard.new(322,634,plugImage[25]),
        plugboard_L = plugboard.new(362,636,plugImage[26])
    }
    
    self.pair = {-- self is an argument used to pass to the function/procedure
        -- array of pairs that are objects 
        red = plugboard.new(x,y,pairImages[1]),
        red_2 = plugboard.new(x, y, pairImages[1]),
        yellow = plugboard.new(x,y,pairImages[2]),
        yellow_2 = plugboard.new(x, y, pairImages[2]),
        green = plugboard.new(x,y,pairImages[3]),
        green_2 = plugboard.new(x, y, pairImages[3]), 
        blue = plugboard.new(x,y,pairImages[4]),
        blue_2 = plugboard.new(x, y, pairImages[4]) 
    }

end

function plugboard:update(dt)
    if gamestate == "playing" then
        local click,isClicked = self:onClick(love.mouse.getX(),love.mouse.getY()) -- local variables to check the position of the x,y coordinates of mouse
        if click and isClicked then -- checks if use has clicked plug
            local x,y=click.x,click.y -- takes the x,y values and is replaced where clicked
            self:addPair(click,pairImages)-- callback function addPair() used
        end
    end
end

function plugboard:draw() -- setting a method for button
    if gamestate == "playing" then -- checks if gamestate is playing
        for i, plug in pairs(self.plug) do -- goes through each element in self.plug
            if plug then -- checks if plug is valid
                self:displayplug(plug)  -- callback function displayplug() used
            end
        end
        for i, pair in pairs(self.pair) do-- goes through each element in self.pair
            if pair and pair.plugImage then -- checks if pair is valid and has a valid plugImage
                self:displaypair(pair) -- callback function displaypair() used
            end
        end
    end
end
function plugboard:displaypair(pair)
    if pair then -- checks if pair is a valid image object before attempting to draw it
        love.graphics.draw(pair.plugImage,pair.x,pair.y) -- displays all pairs that are clicked
    end
end
function plugboard:displayplug(plug)
    if plug then -- checks if plug is a valid image object before attempting to draw it
        love.graphics.draw(plug.plugImage,plug.x,plug.y) -- displays all plug buttons
    end
end

function plugboard:addPair(plug,pairImages)
    local pair_I = 0
    for i, pressed in pairs(self.pair) do-- loops through all elements within self.pair
        if pressed.clicked then -- checks if plug is clicked
            pair_I = pair_I + 1 -- pair_I index is increased by 1
        end
    end
    if pair_I >= 8 then -- checks if the index is reached to 8 (max buttons)
        return -- when max,just only returning, makes it do nothing
    end
    colourPair = pair_I % 8 +1 -- calculates the order of the colour pairs: ((pair_I MOD 8)+1)
--makes sure the pairs don't duplicate (go on top of each other)
    for i, pressed in pairs(self.pair) do-- loops through all elements within self.pair
        if pressed.x == plug.x and pressed.y == plug.y then -- checks if the pairs have the same coordinates
            return -- just only returning, makes it do nothing
        end
    end
    -- checks to see if there are any current empty pair slots, so a new pair can be added when clicked by user
    for i, pressed in pairs(self.pair) do
        if not pressed.clicked then
            pressed.x = plug.x
            pressed.y = plug.y
            pressed.plugImage = pairImages[colourPair]
            pressed.clicked = true
            return
        end
    end
end

-- when 0 clicked on the pair button, it will go back to the plugboard button state
function plugboard:removePair(pair)
    -- will lose their x,y positions
    pair.x = 0
    pair.y = 0
    pair.plugImage = nil -- image no longer displayed
    pair.clicked = false -- clicked is no longer true
end

function plugboard:onClick(x,y)
    local currentClicks = 0 -- index for number of clicks used
    for i, plug in pairs(self.plug) do -- loop
        if plug.clicked then -- checks if a plug from the plugboard is clicked
            currentClicks = currentClicks + 1 -- when clicked, it will take in account of a new value, by adding 1
        end
    end
    if currentClicks >= 8 then -- checks if max clicks is used
        return nil, false -- makes sure no new pairs can be created when clicked
    end
    for i, plug in pairs(self.plug) do -- loops through all elements within self.pair
        if x >= plug.x and x <= plug.x + plug.plugImage:getWidth() and y >= plug.y and y <= plug.y + plug.plugImage:getHeight() then -- checks if user is hovering over plug button
            if love.mouse.isDown(1) then -- if left button is clicked
                return plug,true -- new pair can be created when clicked
            end
        end
    end
    return nil,false -- user has not clicked a plug button
end

function plugboard.new(x,y,plugImage) -- setting a constructor method for the plugboard button
    local buttonTable = setmetatable({}, plugboard)
    --coordinates
    buttonTable.x = x 
    buttonTable.y = y
    buttonTable.plugImage = plugImage -- defining plugBoard button image A-Z
    buttonTable.pair = false -- sets a boolean value of false basically saying that there is currently no pair
    buttonTable.clicked = false -- sets a boonlean value of false as it not registered user's click yet
    return buttonTable -- returns value of new button
end


return plugboard -- value of this whole module is returned
