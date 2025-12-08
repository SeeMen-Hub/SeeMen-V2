local Window = getgenv().Library:CreateWindow({
    Title = "SeeMen",
    Footer = "version: example",
    Icon = 95816097006870,
    NotifySide = "Right",
    ToggleKeybind = Enum.KeyCode.RightShift
})

local Tabs = {
    Debug = Window:AddTab("Debug"),
    Main = Window:AddTab("Main", "user"),
    ["UI Settings"] = Window:AddTab("UI Settings", "settings"),
}

local Groupboxes = {
    Debug = {
        LeftGroupBox = Tabs.Debug:AddLeftGroupbox("Left Groupbox", "wrench")
    },
    Main = {
        LeftGroupBox = Tabs.Main:AddLeftGroupbox("Player", "user")
    },
    UISettings = {}
}

local Elements = {
    Debug = {
        
    },
    Main = {
        SpeedToggle = Groupboxes.Main.LeftGroupBox:AddToggle("Speed Toggle", {
            Text = "Speed",
            Default = false
        }),
        SpeedSlider = Groupboxes.Main.LeftGroupBox:AddSlider("Speed Slider", {
            Text = "Speed",
            Default = 16,
            Min = 0,
            Max = 100,
            Rounding = 0
        })
    },
    UISettings = {}
}

local ui = {
    Window = Window,
    Tabs = Tabs,
    Groupboxes = Groupboxes,
    Elements = Elements
}

return ui