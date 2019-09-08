# Contants
local playerCurrentMana = UnitMana("player");
local playerMaxMana = UnitMaxMana("player"); 

if (playerCurrentMana < playerMaxMana * 0.1)
 then sendChatWarning();
end

function sendChatWarning ()
    SendChatMessage("I am out of mana", "PARTY");
end