local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

if RunService:IsServer() then
    error("Utility should not be used on server")
end

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui") :: PlayerGui

return {
    playerGui = playerGui,
}
