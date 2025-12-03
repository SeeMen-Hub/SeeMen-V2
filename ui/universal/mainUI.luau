local Window = getgenv().Library:CreateWindow({
    Title = "mspaint",
    Footer = "version: example",
    Icon = 95816097006870,
    NotifySide = "Right",
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
        LeftGroupBox = Tabs.Main:AddLeftGroupbox("Left Groupbox", "wrench")
    },
    UISettings = {}
}

local Elements = {
    Debug = {
        killButton = Groupboxes.Debug.LeftGroupBox:AddButton("Kill UI", function()
            Window.Parent = nil
        end)
    },
    Main = {
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