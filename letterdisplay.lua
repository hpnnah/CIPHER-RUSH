letter = {}
local PreviousScore = 0
local notebook= require("MENU.GAMESTATES.EM_play_state.notebook") -- notebook.lua
    letter.plaintextMessages = {-- array of plain text messages ready to be encrypted
    "alert", "order", "call","plan", "fight", "battle",
    "war","squad","troop","scout","attack","defend",
    "march","charge","rally","siege", "ambush","retreat",
    "force","front","flank","clash","raid","strike",
    "recon","signal","intel","report","maneuver", "target", 
    "assault", "defense","advance","reserve","barrage","sniper",
    "grenade","bomb","ammo","drill","arm","alarm",
    "patrol","resistance","supply","combat","fight","hostile",
    "defeat","armory","injure","medic","capture","intercom",
    "orderly","shelter","trench","aid", "radio", "helmet", 
    "shield", "brigade","squadron","company","division", "corps",
    "regiment", "alliance","formation","mission","objective"
    }
    -- check
    letter.ciphertextMessages = { -- array of cipher text messages ready to be decrypted
    "nyreg","jmyzm","bzkk","kgvi","vywxj","srkkcv",
    "cgx","qosyb","dbyyz","gqcih","tmmtvd","abcbka",
    "aofqv","bgzqfd","sbmmz","vlhjh","dpexvk","vixviex",
    "gpsdf","qczye","cixkh","tcrjy","lucx","jkizbv",
    "yljvu","rhfmzk","diozg","anyxac","wkxoefob","dkbqod",
    "cuucwnv","stutcht","dgydqfh","jwkwjnw","dcttcig","kfahwj",
    "sdqzmpq","fsqf","cooq","esjmm","ulg","lwlcx",
    "bmfdax","lymcmnuhwy","xzuuqd","tfdsrk","knlmy","xeijybu",
    "nopokd","zqlnqx","ydzkhu","btsxr","aynrspc","pualyjvt",
    "twijwqd","pebiqbo","fdqzot","tbw","vehms","xubcuj",
    "ynokrj","csjhbef","ljntwkhg","rdbepcn","sxkxhxdc","ampnq",
    "tgikogpv","eppmergi","bkniwpekj","dzjjzfe","wjrmkbqdm"
}
local rotorSelection = { -- array rotors where only one element is displayed randomly at a time when a new message generates
    "AHZ","LOP","POP","BUT","TII","NDU",
    "PEG","HDH","ZIW","QTY","PLM","NCB",
    "IGT","QJK","NMV","POT","HDM","LSU",
    "ZXY","POB","LSN","FBE","IOR","SNF",
    "MFJ","MSO","DID", "ZBC","ABC","IER",
    "GHI","HDY","MCI","MXC","AYX","PWA",
    "SMB","GOD","COF","SUI","MDY","PWT",
    "KIN","YEL","LSV","BDG","LAN","WAN",
    "FTF","POP","TXT","PNG","WER","BGT",
    "LKD","XZU","EVG","NFU","LAM","YUR",
    "ITY", "TIT","WOC","OBT","LKN","MNS",
    "AZW","BGQ","QIT", "JIT", "XTL" 
    }

    local coding_type = { -- this array decides whether the message should be encrypted or decrypted
        "encryption",
        "decryption"
    }
    local plug_letters = { -- array of plug letters to make pairs
    "A","B","C","D","E","F",
    "G","H","I","J","K","L",
    "M","N","O","P","Q","R",
    "S","T","U","V","W","X",
    "Y","Z"}

function letter.load()
    letter.random()
end

function letter.update(dt)
    if score.value>PreviousScore then -- checks if current score is greater than the previous score
        letter.random() -- letter.random function is called
        PreviousScore = score.value -- previous score is updated
    end
end

function letter.draw()
    if letter.randomCoding == coding_type[1] then -- checks if the random variable chose the encryption option
        --generates random message to be printed 
        love.graphics.print(letter.randomMessages1,780,320)
        love.graphics.print(letter.randomCoding,830,430)
        love.graphics.print(letter.randomRotors,665,520)
        love.graphics.print(letter.randomLetters1,800,385)
        love.graphics.print(letter.randomLetters2,840,385)
        love.graphics.print(letter.randomLetters3,880,385)
        love.graphics.print(letter.randomLetters4,920,385)
        love.graphics.print(letter.randomLetters5,960,385)
        love.graphics.print(letter.randomLetters6,1000,385)
        love.graphics.print(letter.randomLetters7,1040,385)
        love.graphics.print(letter.randomLetters8,1080,385)
    elseif letter.randomCoding == coding_type[2] then-- checks if the random variable chose the decryption option
        love.graphics.print(letter.randomMessages2,780,320)
        love.graphics.print(letter.randomCoding,830,430)
        love.graphics.print(letter.randomRotors,665,520)
        love.graphics.print(letter.randomLetters1,800,385)
        love.graphics.print(letter.randomLetters2,840,385)
        love.graphics.print(letter.randomLetters3,880,385)
        love.graphics.print(letter.randomLetters4,920,385)
        love.graphics.print(letter.randomLetters5,960,385)
        love.graphics.print(letter.randomLetters6,1000,385)
        love.graphics.print(letter.randomLetters7,1040,385)
        love.graphics.print(letter.randomLetters8,1080,385)
    end
end


function letter.random()
            --generates random message to be printed
            letter.randomLetters1 = plug_letters[(love.math.random(26))]
            letter.randomLetters2 = plug_letters[(love.math.random(26))]
            letter.randomLetters3 = plug_letters[(love.math.random(26))]
            letter.randomLetters4 = plug_letters[(love.math.random(26))]
            letter.randomLetters5 = plug_letters[(love.math.random(26))]
            letter.randomLetters6 = plug_letters[(love.math.random(26))]
            letter.randomLetters7 = plug_letters[(love.math.random(26))]
            letter.randomLetters8 = plug_letters[(love.math.random(26))]
            letter.randomCoding = coding_type[(love.math.random(2))]
            random = love.math.random(71)
            letter.randomMessages1 = letter.plaintextMessages[random]
            letter.randomRotors = rotorSelection[random]
            letter.randomMessages2 = letter.ciphertextMessages[random]
end


return letter -- value of module is returned

