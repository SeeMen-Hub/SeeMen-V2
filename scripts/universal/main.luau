local UIDir = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/ui/UIDirectory.luau"))()

if UIDir[game.PlaceId] then
    loadstring(game:HttpGetAsync(UIDir[game.PlaceId]))()
else
    loadstring(game:HttpGetAsync(UIDir[0]))()
end