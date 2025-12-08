local UIDir = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/ui/UIDirectory.luau"))()

local ui = nil

if UIDir[game.PlaceId] then
    ui = loadstring(game:HttpGetAsync(UIDir[game.PlaceId]))()
else
    ui = loadstring(game:HttpGetAsync(UIDir[0]))()
end

if ui == nil then error("No UI loaded") end

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