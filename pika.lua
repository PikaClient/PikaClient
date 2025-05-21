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
