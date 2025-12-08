getgenv().Library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/deividcomsono/Obsidian/refs/heads/main/Library.lua"))()
getgenv().Players = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/utils/players.luau"))()
getgenv().Pathfind = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/utils/pathfind.luau"))()
getgenv().Movement = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/utils/movement.luau"))()
getgenv().Esp = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/utils/esp.luau"))()
getgenv().Aimbot = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/utils/aimbot.luau"))()

local GDir = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/loader/gameDirectory.luau"))()

if GDir[game.PlaceId] then
    loadstring(game:HttpGetAsync(GDir[game.PlaceId]))()
else
    loadstring(game:HttpGetAsync(GDir[0]))()
end