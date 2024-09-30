local Player = game:GetService("Players").LocalPlayer
local Packages = game.ReplicatedStorage.Packages
local Components = game.ReplicatedStorage.Components

local PlayerGui = Player:WaitForChild("PlayerGui")
local Camera = workspace.CurrentCamera

local gameModule = require(script.Parent.game)

--set Coreguis to disabled
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
--prevent player from moving
local character = Player.Character or Player.CharacterAdded:Wait()

for _, v in ipairs(character:GetChildren()) do
	if v:IsA("BasePart") then
		v.Anchored = true
	end
end

local Fusion = require(Packages.fusion)
local scope = Fusion.scoped(Fusion)

local TileFolder = game.ReplicatedStorage:WaitForChild("Tiles")

task.wait(2)

local startFunction = {}

local Started = scope:Value(false)

local ScreenGui = scope:New("ScreenGui")({
	Name = "ScreenGui",
	Parent = PlayerGui,
	DisplayOrder = 0,
	IgnoreGuiInset = true,
	ResetOnSpawn = false,
	Enabled = true,

	[Fusion.Children] = {
		require(Components.Menu)(scope, {
			Title = "Tango Together",
			Subtitle = "A game by Tango",
			Started = Started,
		}),
	},
})

local observer = scope:Observer(Started)
observer:onChange(function()
	print("Game started")

	gameModule()
	scope:doCleanup()
end)
