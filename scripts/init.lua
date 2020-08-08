--  Load configuration options up front
ScriptHost:LoadScript("scripts/settings.lua")
ScriptHost:LoadScript("scripts/logic.lua")

Tracker:AddItems("items/items.json")

Tracker:AddMaps("maps/maps.json")

Tracker:AddLocations("locations/locations.json")

Tracker:AddLayouts("layouts/tracker.json")
Tracker:AddLayouts("layouts/broadcast.json")

if _VERSION == "Lua 5.3" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
else
    print("Auto-tracker is unsupported by your tracker version")
end

