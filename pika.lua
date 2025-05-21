local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/7Smoker/Smoker/refs/heads/main/UILibrary/Library", true))()
Library.DefaultColor = Color3.fromRGB(3, 73, 252)

local tab = Library:Window({Text = "pika pikal"})
local LocalPlayer = game.Players.LocalPlayer
tab:Slider({
    Text = "Speed",
    Default = 30,
    Minimum = 30,
    Maximum = 104,
    Callback = function(speedval)
        LocalPlayer.Character.Humanoid.WalkSpeed = speedval
    end
})

local players = game:GetService("Players")
local localplayer = players.LocalPlayer
local stage = localplayer.leaderstats.Stage
local stages = game.Workspace:WaitForChild("Stages")
local teleporting = false

tab:Toggle({
    Text = "tpbotton",
    Callback = function(stagetp)
        teleporting = stagetp
        if teleporting then
            coroutine.wrap(function()
                for i = stage.Value + 1, 725 do
                    if not teleporting then break end
                    local stagefolder = stages:FindFirstChild(tostring(i))
                    if stagefolder then
                        local spawnpart = stagefolder:FindFirstChild("Spawn")
                        if spawnpart and localplayer.Character and localplayer.Character:FindFirstChild("HumanoidRootPart") then
                            local position = spawnpart.Position + Vector3.new(0, 3, 0)
                            localplayer.Character.HumanoidRootPart.CFrame = CFrame.new(position)
                            wait(0.5)
                        end
                    end
                end
            end)()
        end
    end
})








MovementWindow:Slider({
    Text = "Speed",
    Default = 16,
    Minimum = 16,
    Maximum = 100,
    Callback = function(value)
        LocalPlayer.Character.Humanoid.WalkSpeed = value
    end
})

SettingsWindow:Dropdown({
    Text = "Theme",
    List = {"Dark", "White", "Aqua", "Nova", "RGB"},
    Callback = function(theme)
        RGBEnabled = false

        if theme == "Dark" then
            Library.DefaultColor = Color3.fromRGB(0, 0, 0)
        elseif theme == "White" then
            Library.DefaultColor = Color3.fromRGB(255, 255, 255)
        elseif theme == "Aqua" then
            Library.DefaultColor = Color3.fromRGB(66, 245, 194)
        elseif theme == "Nova" then
            Library.DefaultColor = Color3.fromRGB(255, 0, 234)
        elseif theme == "RGB" then
            RGBEnabled = true
            task.spawn(function()
                while RGBEnabled do
                    for hue = 0, 1, 0.01 do
                        if not RGBEnabled then break end
                        Library.DefaultColor = Color3.fromHSV(hue, 1, 1)
                        task.wait(0.03)
                    end
                end
            end)
        end

        Library:Notification({Text = "Changed Theme to: " .. theme, Duration = 15})
    end
})

VisualWindow:Label({
   Text = "Smoker Client",
   Color = Library.DefaultColor
})

VisualWindow:Toggle({
    Text = "Watermark",
    Callback = function()

    end
})

VisualWindow:Toggle({
    Text = "Vibe",
    Callback = function(state)
        Vibe = state
        if Vibe then
            Lighting.TimeOfDay = "00:00:00"
            Lighting.Ambient = Color3.fromRGB(0, 85, 255)
            Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
            Lighting.Technology = Enum.Technology.Future
        else

        end
    end
})