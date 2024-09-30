local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.fusion)

return function(scope, props)
	local springEnd = scope:Value(0)
	local isHeldDown = scope:Value(false)

	-- coroutine.wrap(function()
	-- 	while true do
	-- 		if
	-- 	end
	-- end)()

	return scope:New("Frame")({
		Name = "container",
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0, 0),
		Size = UDim2.fromScale(1, 1),

		[scope.Children] = {
			scope:New("TextLabel")({
				Name = "TextLabel",
				FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json"),
				Text = "Tango Together",
				TextColor3 = Color3.fromRGB(40, 217, 55),
				TextScaled = true,
				TextSize = 26,
				TextWrapped = true,
				BackgroundColor3 = Color3.fromRGB(255, 255, 255),
				BackgroundTransparency = 1,
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.5, 0.2),
				Size = UDim2.fromScale(0.3, 0.2),
				AnchorPoint = Vector2.new(0.5, 0.5),
			}),
			scope:New("TextButton")({
				Name = "TextButton",
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundColor3 = Color3.fromRGB(182, 209, 74),
				BorderColor3 = Color3.fromRGB(0, 0, 0),
				BorderSizePixel = 0,
				Position = UDim2.fromScale(0.5, 0.75),
				Size = UDim2.fromScale(0.3, 0.1),
				Text = "Start",
				TextScaled = true,
				TextColor3 = Color3.fromRGB(192, 85, 56),

				[scope.OnEvent("Activated")] = function()
					print(props)
					props.Started:set(true)
				end,
			}),
		},
	})
end
