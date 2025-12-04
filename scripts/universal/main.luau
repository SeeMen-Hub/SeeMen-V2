local UIDir = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/ui/UIDirectory.luau"))()
local ui = nil

if UIDir[game.PlaceId] then
    ui = loadstring(game:GetService("HttpService"):GetAsync(UIDir[game.PlaceId]))()
else
    ui = loadstring(game:GetService("HttpService"):GetAsync(UIDir[0]))()
end

if ui == nil then error("No UI found") end

ui.Elements.Main.SpeedSlider:OnChanged(function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)