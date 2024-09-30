-- 8 total tiles, split screen into two sections of tiles

return function(scope, props)
	return scope:New("Frame")({
		Name = "Tile",
		AnchorPoint = Vector2.new(0.5, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		BorderColor3 = Color3.fromRGB(0, 0, 0),
		BorderSizePixel = 0,
		Position = UDim2.fromScale(0.1, 0.1),
		Size = UDim2.fromOffset(100, 100),

		[scope.Children] = {
			scope.New("UICorner")({
				Name = "UICorner",
				CornerRadius = UDim.new(1, 0),
			}),
		},
	})
end
