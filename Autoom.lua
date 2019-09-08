local manaEventFrame = CreateFrame("Frame"); 
manaEventFrame:RegisterEvent("COMBAT_TEXT_UPDATE"); 
manaEventFrame:SetScript("OnEvent", checkMana(event)); 


function checkMana(event) 
    local playerCurrentMana = UnitMana("player");
    local playerMaxMana = UnitMaxMana("player"); 
    
    if (playerCurrentMana < playerMaxMana * 0.1)
        then sendChatWarning();
    end
end 

function sendChatWarning ()
    SendChatMessage("I am out of mana", "PARTY");
end