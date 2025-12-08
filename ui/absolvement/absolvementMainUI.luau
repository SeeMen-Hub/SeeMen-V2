local Window = getgenv().Library:CreateWindow({
    Title = "SeeMen",
    Footer = "version: example",
    Icon = 95816097006870,
    NotifySide = "Right",
    ToggleKeybind = Enum.KeyCode.RightShift
})

local Tabs = {
    Main = Window:AddTab("Main", "user"),
    ["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local Groupboxes = {
    Main = {
        LeftGroupBox = Tabs.Main:AddLeftGroupbox("Player", "user"),
    },
    UISettings = {}
}

local Elements = {
    Main = {},
    UISettings = {}
}

local ui = {
    Window = Window,
    Tabs = Tabs,
    Groupboxes = Groupboxes,
    Elements = Elements
}

return ui