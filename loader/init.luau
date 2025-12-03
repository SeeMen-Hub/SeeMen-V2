local function HttpGet(url)
    return game:HttpGet(url)
end

local loadedModules = {}

local function loadModule(url)
    -- If we already loaded this URL, return cached result
    if loadedModules[url] then
        return loadedModules[url]
    end

    -- Download source
    local source = HttpGet(url)

    -- Compile source
    local chunk, err = loadstring(source)
    if not chunk then
        error(("Failed to load module from %s: %s"):format(url, err))
    end

    -- Execute module (just like require)
    local result = chunk()

    -- Cache result
    loadedModules[url] = result

    return result
end

local BASE_URL = "https://github.com/SeeMen-Hub/SeeMen-V2"

local URLs = {
    UILibrary = BASE_URL .. "ui/UILibrary.lua",

    PlaceModules = {
        -- Replace these with your actual place IDs
        [1234567890] = {
            BASE_URL .. "ui/place_123/MainMenuConfig.lua",
            BASE_URL .. "ui/place_123/HUDConfig.lua",
        },

        [9876543210] = {
            BASE_URL .. "ui/place_987/MainMenuConfig.lua",
        },
    },
}