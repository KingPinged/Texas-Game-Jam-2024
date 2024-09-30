game:GetService("Players").PlayerAdded:Connect(function(player)
	local character = player.Character or player.CharacterAdded:Wait()
end)
print("Loaded player")
