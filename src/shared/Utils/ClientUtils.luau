local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

if RunService:IsServer() then
    error("Utility should not be used on server")
end

local player = Players.LocalPlayer

local ClientUtils = {
    PlayerGui = player:WaitForChild("PlayerGui") :: PlayerGui,
}

return ClientUtils
