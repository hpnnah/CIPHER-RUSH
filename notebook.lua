notebook = {}
local button = require("MENU.button") --which is button.lua
function notebook.load()
    --loads images, initialising values
    coding = "encryption" -- this will be used for the letter later on
    encrypt_NB = love.graphics.newImage("NEA IMAGES/PLAY PAGE/NOTEBOOK/NOTEBOOKENCRYPT.png")
    local encrypt = "PLAY PAGE/NOTEBOOK/ENCRYPTBUTTON.png"
    local encrypt_2 = "PLAY PAGE/NOTEBOOK/ENCRYPTBUTTON.png"
    decrypt_NB = love.graphics.newImage("NEA IMAGES/PLAY PAGE/NOTEBOOK/NOTEBOOKDECRYPT.png")
    local decrypt = "PLAY PAGE/NOTEBOOK/DECRYPTBUTTON.png"
    local decrypt_2 = "/PLAY PAGE/NOTEBOOK/DECRYPTBUTTON.png"
    --new objects from button.lua
    encryptButton = button.new(235,970,encrypt,encrypt_2)
    decryptButton = button.new(300,970,decrypt,decrypt_2)
end

function notebook.draw()
    if gamestate == "playing" then
        if coding == "encryption" then -- if coding is equal to encryption, it will switch to the encryption side of notebook
                love.graphics.draw(encrypt_NB,-10,570)
        end
        if coding == "decryption" then-- if coding is equal to decryption, it will switch to the decryption side of notebook
                love.graphics.draw(decrypt_NB,-10,570)
        end
    -- notebook buttons are displayed
        encryptButton:draw()
        decryptButton:draw() 
    end
end


return notebook -- value is returned
