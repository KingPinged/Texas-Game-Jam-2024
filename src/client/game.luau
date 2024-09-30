local a = {}
local Player = game:GetService("Players").LocalPlayer
local Camera = workspace.Camera
local TileFolder = game.ReplicatedStorage:WaitForChild("Tiles")
local userInputService = game:GetService("UserInputService")

local TweenService = game:GetService("TweenService")

local SS = game:GetService("SoundService")
local songs = {
	["Dance With Fate"] = SS:WaitForChild("Dance With Fate"),
}
print("Loaded songs")

local chosen = songs["Dance With Fate"]

local difficulty = 2 -- time it takes for notes to go from start - finish.
local noteCooldown = 0.25 -- so we dont have an overflow of notes.
local canMakeNote = true

function generateNote()
	local pbl = chosen.beats.PlaybackLoudness

	local ranges = {
		Red = NumberRange.new(140, 184),
		Yellow = NumberRange.new(185, 249),
		Green = NumberRange.new(250, 304),
		Blue = NumberRange.new(305, 340),
		random = NumberRange.new(341, 9999999),
	}

	local noteType = nil

	for color, property in pairs(ranges) do
		if pbl >= property.Min and pbl <= property.Max then -- found value in range
			noteType = tostring(color)

			if noteType == "random" then
				noteType = "Yellow"
			end
			local rod
			local tween
			local tile
			if noteType == "Yellow" then
				rod = workspace:FindFirstChild("Rod1")
				coroutine.wrap(function()
					tile = TileFolder:FindFirstChild("Yellow"):Clone()
					tile.Parent = rod
					tile.Position = rod.End.Position

					tween = TweenService:Create(tile, TweenInfo.new(difficulty), { Position = rod.Start.Position })
					tween:Play()
				end)()
			elseif noteType == "Green" then
				rod = workspace:FindFirstChild("Rod2")
				coroutine.wrap(function()
					tile = TileFolder:FindFirstChild("Green"):Clone()
					tile.Parent = rod
					tile.Position = rod.End.Position

					tween = TweenService:Create(tile, TweenInfo.new(difficulty), { Position = rod.Start.Position })
					tween:Play()
				end)()
			elseif noteType == "Blue" then
				rod = workspace:FindFirstChild("Rod3")
				coroutine.wrap(function()
					tile = TileFolder:FindFirstChild("Blue"):Clone()
					tile.Parent = rod
					tile.Position = rod.End.Position

					tween = TweenService:Create(tile, TweenInfo.new(difficulty), { Position = rod.Start.Position })
					tween:Play()
				end)()
			elseif noteType == "Red" then
				rod = workspace:FindFirstChild("Rod4")
				coroutine.wrap(function()
					tile = TileFolder:FindFirstChild("Red"):Clone()
					tile.Parent = rod
					tile.Position = rod.End.Position

					tween = TweenService:Create(tile, TweenInfo.new(difficulty), { Position = rod.Start.Position })
					tween:Play()
				end)()
			end

			tween.Completed:Connect(function()
				if tile then
					tile:Destroy()
				end
			end)
		end
	end
end

userInputService.InputBegan:Connect(function(input)
	if input.KeyCode == Enum.KeyCode.A then
		local tile = workspace:FindFirstChild("Rod1"):FindFirstChild("Yellow")
		if tile then
			tile:Destroy()
			print("Hit")
		end
	end
	if input.KeyCode == Enum.KeyCode.S then
		local tile = workspace:FindFirstChild("Rod2"):FindFirstChild("Green")
		if tile then
			tile:Destroy()
			print("Hit")
		end
	end
	if input.KeyCode == Enum.KeyCode.D then
		local tile = workspace:FindFirstChild("Rod3"):FindFirstChild("Blue")
		if tile then
			tile:Destroy()
			print("Hit")
		end
	end
	if input.KeyCode == Enum.KeyCode.F then
		local tile = workspace:FindFirstChild("Rod4"):FindFirstChild("Red")
		if tile then
			tile:Destroy()
			print("Hit")
		end
	end
end)

local players = 1

return function()
	print("Game started 2")
	Camera.CameraType = Enum.CameraType.Scriptable

	--place Camera in between the two middle rods
	Camera.CFrame = workspace.CameraPos.CFrame

	chosen.beats:Play()
	task.wait(difficulty)
	chosen.tango:Play()

	game:GetService("RunService").RenderStepped:Connect(function()
		if canMakeNote then
			canMakeNote = false
			generateNote()
			wait(noteCooldown)
			canMakeNote = true
		end
	end)
end
