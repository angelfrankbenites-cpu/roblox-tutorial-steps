--!strict
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Config = require(ReplicatedStorage.TutorialConfig)
local player = Players.LocalPlayer

local screen = Instance.new("ScreenGui")
screen.Name = "TutorialHud"
screen.ResetOnSpawn = false

local label = Instance.new("TextLabel")
label.AnchorPoint = Vector2.new(0.5, 0)
label.Position = UDim2.new(0.5, 0, 0, 22)
label.Size = UDim2.new(0.88, 0, 0, 58)
label.BackgroundColor3 = Color3.fromRGB(23, 33, 50)
label.TextColor3 = Color3.new(1, 1, 1)
label.TextSize = 18
label.TextWrapped = true
label.Font = Enum.Font.GothamMedium
label.Parent = screen

local limit = Instance.new("UISizeConstraint")
limit.MaxSize = Vector2.new(520, 58)
limit.Parent = label

local function render()
	local current = player:GetAttribute(Config.attribute)
	if typeof(current) ~= "number" then
		label.Visible = false
		return
	end
	local step = Config.steps[current]
	label.Text = if step then step.text else Config.completeText
	label.Visible = true
end

player:GetAttributeChangedSignal(Config.attribute):Connect(render)
render()
screen.Parent = player:WaitForChild("PlayerGui")
