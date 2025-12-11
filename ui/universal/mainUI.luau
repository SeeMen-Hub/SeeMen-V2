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
    Debug = {},
    Main = {
        PlayerLeftGroupBox = Tabs.Main:AddLeftGroupBox("Player", "user"),
    },
    UISettings = {}
}

local Elements = {
    Debug = {
        
    },
    Main = {
        SpeedToggle = Groupboxes.Main.PlayerLeftGroupBox:AddToggle("Speed Toggle", {
            Text = "Speed",
            Default = false
        }),
        SpeedSlider = Groupboxes.Main.PlayerLeftGroupBox:AddSlider("Speed Slider", {
            Text = "Speed",
            Default = 16,
            Min = 0,
            Max = 100,
            Rounding = 0
        }),
        JumpToggle = Groupboxes.Main.PlayerLeftGroupBox:AddToggle("Jump Toggle", {
            Text = "Jump Power",
            Default = false
        }),
        JumpSlider = Groupboxes.Main.PlayerLeftGroupBox:AddSlider("Jump Slider", {
            Text = "Power",
            Default = 50,
            Min = 0,
            Max = 100,
            Rounding = 0
        }),
        FlyToggle = Groupboxes.Main.PlayerLeftGroupBox:AddToggle("Fly Toggle", {
            Text = "Fly",
            Default = false
        }),
        FlySlider = Groupboxes.Main.PlayerLeftGroupBox:AddSlider("Fly Slider", {
            Text = "Speed",
            Default = 5,
            Min = 0,
            Max = 10,
            Rounding = 0
        }),
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