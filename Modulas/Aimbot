-- Güvenli local script, client'ta çalışır, server göremez

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local holdingF = false
local targetPlayer = nil

local function getCharacter()
    return LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
end

-- En yakın oyuncuyu bulur
local function getClosestPlayer()
    local myHRP = getCharacter():FindFirstChild("HumanoidRootPart")
    if not myHRP then return nil end

    local closest = nil
    local shortest = math.huge

    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            local dist = (player.Character.HumanoidRootPart.Position - myHRP.Position).Magnitude
            if dist < shortest then
                shortest = dist
                closest = player
            end
        end
    end

    return closest
end

-- GUI Oluştur
local gui = Instance.new("BillboardGui")
gui.Name = "TargetGUI"
gui.Size = UDim2.new(0, 200, 0, 60)
gui.StudsOffset = Vector3.new(0, 3, 0)
gui.AlwaysOnTop = true

-- İsim
local nameLabel = Instance.new("TextLabel")
nameLabel.Size = UDim2.new(1, 0, 0.33, 0)
nameLabel.Position = UDim2.new(0, 0, 0, 0)
nameLabel.BackgroundTransparency = 1
nameLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
nameLabel.TextStrokeTransparency = 0
nameLabel.TextScaled = true
nameLabel.Font = Enum.Font.GothamBold
nameLabel.Text = ""
nameLabel.Parent = gui

-- Tool
local toolLabel = Instance.new("TextLabel")
toolLabel.Size = UDim2.new(1, 0, 0.33, 0)
toolLabel.Position = UDim2.new(0, 0, 0.33, 0)
toolLabel.BackgroundTransparency = 1
toolLabel.TextColor3 = Color3.fromRGB(255, 255, 0)
toolLabel.TextStrokeTransparency = 0
toolLabel.TextScaled = true
toolLabel.Font = Enum.Font.Gotham
toolLabel.Text = ""
toolLabel.Parent = gui

-- Can
local healthLabel = Instance.new("TextLabel")
healthLabel.Size = UDim2.new(1, 0, 0.33, 0)
healthLabel.Position = UDim2.new(0, 0, 0.66, 0)
healthLabel.BackgroundTransparency = 1
healthLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
healthLabel.TextStrokeTransparency = 0
healthLabel.TextScaled = true
healthLabel.Font = Enum.Font.Gotham
healthLabel.Text = ""
healthLabel.Parent = gui

-- Input kontrolü
UserInputService.InputBegan:Connect(function(input, gpe)
    if gpe then return end
    if input.KeyCode == Enum.KeyCode.F then
        holdingF = true
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then
        holdingF = false
        gui.Parent = nil
        targetPlayer = nil
    end
end)

-- Ana döngü
RunService.RenderStepped:Connect(function()
    if holdingF then
        local char = getCharacter()
        local myHRP = char:FindFirstChild("HumanoidRootPart")
        local newTarget = getClosestPlayer()

        if newTarget and newTarget.Character and newTarget.Character:FindFirstChild("HumanoidRootPart") and myHRP then
            local targetHRP = newTarget.Character.HumanoidRootPart
            local lookDir = (targetHRP.Position - myHRP.Position).Unit
            myHRP.CFrame = CFrame.new(myHRP.Position, myHRP.Position + lookDir)

            if targetPlayer ~= newTarget then
                gui.Parent = targetHRP
                targetPlayer = newTarget
            end

            -- GUI Bilgilerini güncelle
            nameLabel.Text = "🎯 " .. newTarget.DisplayName
            local tool = newTarget.Character:FindFirstChildOfClass("Tool")
            toolLabel.Text = "🧰 Tool: " .. (tool and tool.Name or "Yok")
            local hum = newTarget.Character:FindFirstChildOfClass("Humanoid")
            healthLabel.Text = "❤️ Can: " .. (hum and math.floor(hum.Health) or "??")
        end
    end
end)
