local UIDir = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/ui/UIDirectory.luau"))()

local ui = nil

if UIDir[game.PlaceId] then
    ui = loadstring(game:HttpGetAsync(UIDir[game.PlaceId]))()
else
    ui = loadstring(game:HttpGetAsync(UIDir[0]))()
end

if ui == nil then error("No UI loaded") end

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"))()
local ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/ThemeManager.lua"))()

SaveManager:SetLibrary(getgenv().Library)
ThemeManager:SetLibrary(getgenv().Library)

SaveManager:SetFolder("SeeMen/Absolvement")
ThemeManager:SetFolder("SeeMen/Absolvement")

SaveManager:BuildConfigSection(ui.Tabs["UI Settings"])
ThemeManager:ApplyToTab(ui.Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()
ThemeManager:LoadDefault()

ui.Elements.Main.SpeedToggle:OnChanged(function(value)
    getgenv().Movement.setSpeedState(value)
end)

ui.Elements.Main.SpeedSlider:OnChanged(function(value)
    getgenv().Movement.setSpeed(value)
end)

ui.Elements.Main.JumpToggle:OnChanged(function(value)
    getgenv().Movement.setJumpState(value)
end)

ui.Elements.Main.JumpSlider:OnChanged(function(value)
    getgenv().Movement.setJumpPower(value)
end)

ui.Elements.Main.FlyToggle:OnChanged(function(value)
    getgenv().Movement.setFlyState(value)
end)

ui.Elements.Main.FlySlider:OnChanged(function(value)
    getgenv().Movement.setFlySpeed(value/10)
end)