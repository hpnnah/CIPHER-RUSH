-- button module can be used for selection button for main menu, paused menu, EM functions like e.g rotors
local button = {} -- creates table called button
button.__index = button -- this creates a class called button

function button.new(w,h,image,hover_image,click) -- setting a constructor method for the button used for menus, playing gamestate. back button etc...
    local buttonTable = setmetatable({}, button)
    buttonTable.w = w -- width
    buttonTable.h = h -- height
     -- allows me to choose the image and hover image in my files directory in NEA IMAGES when creating a new object
    buttonTable.image = love.graphics.newImage("NEA IMAGES/"..image)
    buttonTable.hover_image = love.graphics.newImage("NEA IMAGES/"..hover_image) 

    buttonTable.hovered = false -- sets a boolean value of true or false basically saying if image is hovered over mouse or not
    buttonTable.click = click -- basically gets user's click input and performs specific action in module
    return buttonTable -- returns value of new button
end

function button:draw() -- setting a method for button
    if self.hovered then -- checks if user have hovered over button
        love.graphics.draw(self.hover_image,self.w,self.h) -- hover image is displayed
    else
        love.graphics.draw(self.image,self.w,self.h) -- original image displayed
    end
end

function button:hover(w,h) -- method called hover that determines whether cursour is hovered over image which width and height passed through parameter
    self.hovered = w >= self.w and w <= self.w + self.image:getWidth() and h >= self.h and h <= self.h + self.image:getHeight() --determines whether cursour is hovered over image
    return self.hovered  -- value is returned (.hovered has came from the buttonTable)
end

return button -- value is returned

