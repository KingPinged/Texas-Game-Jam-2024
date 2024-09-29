local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Packages.fusion)

return function(scope, props)
	return scope:New("Frame")({
		Name = "Frame",
		AnchorPoint = Vector2.new(0.5, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BackgroundTransparency = 1,
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.5, 0.2),
		Size = UDim2.fromScale(0.2, 0.2),

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
				Size = UDim2.fromScale(1, 1),
				Rotation = scope:Spring(scope:Value(10), 1, 0.0),
			}),
		},
	})
end
