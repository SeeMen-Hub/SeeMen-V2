getgenv().Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua"))()

local GDir = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/loader/gameDirectory.luau"))()

if GDir[game.PlaceId] then
    loadstring(game:HttpGetAsync(GDir[game.PlaceId]))()
else
    loadstring(game:HttpGetAsync(GDir[0]))()
end