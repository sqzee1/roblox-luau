local Players = game:GetService("Players")

local function enablePlayersMovement()
	for _, player in Players:GetPlayers() do
		local character = player.Character
		if not character then
			continue
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			continue
		end

		humanoid.WalkSpeed = 16
		humanoid.JumpPower = 50
	end
end

local function disablePlayersMovement()
	for _, player in Players:GetPlayers() do
		local character = player.Character
		if not character then
			continue
		end
		local humanoid = character:FindFirstChildOfClass("Humanoid")
		if not humanoid then
			continue
		end

		humanoid.WalkSpeed = 0
		humanoid.JumpPower = 0
	end
end

return {
	enablePlayersMovement = enablePlayersMovement,
	disablePlayersMovement = disablePlayersMovement,
}
