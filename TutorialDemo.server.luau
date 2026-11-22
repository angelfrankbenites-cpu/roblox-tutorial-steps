--!strict
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Config = require(ReplicatedStorage.TutorialConfig)
local TutorialSteps = require(ReplicatedStorage.TutorialSteps)
local checkpoints = workspace:WaitForChild("TutorialCheckpoints")

local function startTutorial(player: Player)
	if player:GetAttribute(Config.attribute) == nil then
		player:SetAttribute(Config.attribute, 1)
	end
end

Players.PlayerAdded:Connect(startTutorial)
for _, player in Players:GetPlayers() do
	startTutorial(player)
end

for _, step in Config.steps do
	local checkpoint = checkpoints:WaitForChild(step.id)
	assert(checkpoint:IsA("BasePart"), "Tutorial checkpoint must be a BasePart")
	local prompt = checkpoint:WaitForChild("ProximityPrompt")
	assert(prompt:IsA("ProximityPrompt"), "Tutorial checkpoint needs a ProximityPrompt")

	prompt.Triggered:Connect(function(player: Player)
		local character = player.Character
		local root = character and character:FindFirstChild("HumanoidRootPart")
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if not root or not root:IsA("BasePart") or not humanoid or humanoid.Health <= 0 then
			return
		end
		if not prompt.Enabled or (root.Position - checkpoint.Position).Magnitude > prompt.MaxActivationDistance then
			return
		end

		local current = player:GetAttribute(Config.attribute)
		if typeof(current) ~= "number" then
			return
		end
		local nextStep = TutorialSteps.advance(Config.steps, current, step.id)
		if nextStep ~= current then
			player:SetAttribute(Config.attribute, nextStep)
		end
	end)
end
