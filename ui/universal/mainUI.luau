ui = {
    Window = getgenv().Library:CreateWindow({
        Title = "mspaint",
        Footer = "version: example",
        Icon = 95816097006870,
        NotifySide = "Right",
    }),
    Tabs = {
        Debug = ui.Window:AddTab("Debug"),
        Main = ui.Window:AddTab("Main", "user"),
        ["UI Settings"] = ui.Window:AddTab("UI Settings", "settings"),
    },

    DebugLeftGroupBox = ui.Tabs.Debug:AddLeftGroupbox("Left Groupbox", "wrench"),

    MainLeftGroupBox = ui.Tabs.Main:AddLeftGroupbox("Left Groupbox", "wrench"),

    killButton = ui.DebugLeftGroupBox:AddButton("Kill UI", function()
        ui.Window:Destroy()
    end),

    SpeedSlider = ui.MainLeftGroupBox:AddSlider("Speed Slider", {
        Text = "Speed",
        Default = 16,
        Min = 0,
        Max = 100,
        Rounding = 0
    })
}

return ui