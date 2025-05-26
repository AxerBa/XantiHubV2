-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

-- Vars
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local holding = false
local target = nil

-- Function: En yakın oyuncuyu bul
local function getClosestPlayer()
	local closest = nil
	local shortest = math.huge
	for _, player in pairs(Players:GetPlayers()) do
		if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
			local distance = (LocalPlayer.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
			if distance < shortest then
				shortest = distance
				closest = player
			end
		end
	end
	return closest
end

-- Function: BillboardGui ekle
local function createBillboard(targetPlayer)
	if not targetPlayer.Character or targetPlayer.Character:FindFirstChild("TargetBillboard") then return end

	local bb = Instance.new("BillboardGui", targetPlayer.Character)
	bb.Name = "TargetBillboard"
	bb.Size = UDim2.new(0, 200, 0, 50)
	bb.Adornee = targetPlayer.Character:FindFirstChild("Head")
	bb.AlwaysOnTop = true
	bb.StudsOffset = Vector3.new(0, 3, 0)

	local name = Instance.new("TextLabel", bb)
	name.Size = UDim2.new(1, 0, 0.5, 0)
	name.BackgroundTransparency = 1
	name.TextStrokeTransparency = 0
	name.TextColor3 = Color3.new(1, 1, 1)
	name.Font = Enum.Font.GothamBold
	name.TextScaled = true
	name.Text = targetPlayer.Name

	local health = Instance.new("TextLabel", bb)
	health.Size = UDim2.new(1, 0, 0.5, 0)
	health.Position = UDim2.new(0, 0, 0.5, 0)
	health.BackgroundTransparency = 1
	health.TextStrokeTransparency = 0
	health.TextColor3 = Color3.new(1, 0.3, 0.3)
	health.Font = Enum.Font.Gotham
	health.TextScaled = true
	health.Name = "HealthLabel"
	health.Text = "HP: ???"
end

-- Function: Karakter yönünü döndür (shiftlock olsa bile)
local function forceFaceTarget(targetPlayer)
	local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	local targetHrp = targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")

	if hrp and targetHrp then
		local direction = (targetHrp.Position - hrp.Position).Unit
		local look = CFrame.new(hrp.Position, hrp.Position + Vector3.new(direction.X, 0, direction.Z))
		hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, math.atan2(direction.X, direction.Z), 0)
	end
end

-- Function: Billboard sağlığı güncelle
local function updateHealth()
	if target and target.Character and target.Character:FindFirstChild("TargetBillboard") then
		local hum = target.Character:FindFirstChildOfClass("Humanoid")
		local label = target.Character.TargetBillboard:FindFirstChild("HealthLabel")
		if hum and label then
			label.Text = "HP: " .. math.floor(hum.Health)
		end
	end
end

-- Tuş dinleyici
UserInputService.InputBegan:Connect(function(input, processed)
	if input.KeyCode == Enum.KeyCode.F and not processed then
		holding = true
		target = getClosestPlayer()
		if target then
			createBillboard(target)
		end
	end
end)

UserInputService.InputEnded:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.F then
		holding = false
		if target and target.Character and target.Character:FindFirstChild("TargetBillboard") then
			target.Character.TargetBillboard:Destroy()
		end
		target = nil
	end
end)

-- Sürekli güncelle
RunService.RenderStepped:Connect(function()
	if holding and target then
		forceFaceTarget(target)
		updateHealth()
	end
end)
