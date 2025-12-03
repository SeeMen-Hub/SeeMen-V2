local UIDir = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/ui/UIDirectory.luau"))()

local ui = nil

if UIDir[game.PlaceId] then
    ui = loadstring(game:HttpGetAsync(UIDir[game.PlaceId]))()
else
    ui = loadstring(game:HttpGetAsync(UIDir[0]))()
end

if ui == nil then return end

ui.Elements.Main.SpeedSlider:OnChanged(function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)