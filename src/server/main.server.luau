game.Loaded:Wait()

game:GetService("Players").PlayerAdded:Connect(function(player)
	local character = player.Character or player.CharacterAdded:Wait()
end)
