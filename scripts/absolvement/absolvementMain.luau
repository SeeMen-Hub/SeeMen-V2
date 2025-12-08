local UIDir = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/ui/UIDirectory.luau"))()

local ui = nil

if UIDir[game.PlaceId] then
    ui = loadstring(game:HttpGetAsync(UIDir[game.PlaceId]))()
else
    ui = loadstring(game:HttpGetAsync(UIDir[0]))()
end

if ui == nil then error("No UI loaded") end

local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/deividcomsono/Obsidian/main/addons/SaveManager.lua"))()

SaveManager:SetLibrary(getgenv().Library)

SaveManager:SetFolder("SeeMen/Absolvement")
-- omit for now SaveManager:SetSubFolder("Lobby")

SaveManager:BuildConfigSection(ui.Tabs["UI Settings"])

SaveManager:LoadAutoloadConfig()