local Player = game:GetService("Players").LocalPlayer
local Packages = game.ReplicatedStorage.Packages
local Components = game.ReplicatedStorage.Components

local PlayerGui = Player:WaitForChild("PlayerGui")

--set Coreguis to disabled
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

local Fusion = require(Packages.fusion)
local scope = Fusion.scoped(Fusion)

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
		}),
	},
})
