local UIDir = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/SeeMen-Hub/SeeMen-V2/refs/heads/main/ui/UIDirectory.luau"))()

local ui = nil

print(game.PlaceId)

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

-- All enemies will fall under workspace.NPCs (assume HumanoidRootPart exists)