autoomOptions = {};
autoomOptions.powerThreshold = .1;

local autoomEventFrame = CreateFrame("Frame");
autoomEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
autoomEventFrame:RegisterEvent("UNIT_MODEL_CHANGED");
autoomEventFrame:RegisterEvent("UNIT_LEVEL");
autoomEventFrame:RegisterEvent("UNIT_RESISTANCES");
autoomEventFrame:RegisterEvent("UNIT_STATS");
autoomEventFrame:RegisterEvent("UNIT_DAMAGE");
autoomEventFrame:RegisterEvent("UNIT_RANGEDDAMAGE");
autoomEventFrame:RegisterEvent("PLAYER_DAMAGE_DONE_MODS");
autoomEventFrame:RegisterEvent("UNIT_ATTACK_SPEED");
autoomEventFrame:RegisterEvent("UNIT_ATTACK_POWER");
autoomEventFrame:RegisterEvent("UNIT_RANGED_ATTACK_POWER");
autoomEventFrame:RegisterEvent("UNIT_ATTACK");
autoomEventFrame:RegisterEvent("PLAYER_GUILD_UPDATE");
autoomEventFrame:RegisterEvent("SKILL_LINES_CHANGED");
autoomEventFrame:RegisterEvent("COMBAT_LOG_EVENT");


autoomEventFrame:SetScript("OnEvent",
    function(self, event, ...)
        autoomEventFrame.CheckMana();
    end)


function autoomEventFrame:CheckMana() 
    
    local playerMaxMana = UnitPowerMax("player", 0);
    local playerCurrentMana = UnitPower("player", 0);
    
    if (playerCurrentMana < playerMaxMana * autoomOptions.powerThreshold)
        then autoomEventFrame:sendChatWarning(playerCurrentMana);
    end
end 


function autoomEventFrame:sendChatWarning (remainingMana)
    SendChatMessage("I have" .. tostring(remainingMana) .. " mana remaining", "party", nil, nil);
end