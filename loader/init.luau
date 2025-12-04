_G.Library = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua"))()

local GDir = loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/loader/gameDirectory.luau"))()

if GDir[game.PlaceId] then
    loadstring(game:GetService("HttpService"):GetAsync(GDir[game.PlaceId]))()
else
    loadstring(game:GetService("HttpService"):GetAsync(GDir[0]))()
end