local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ServerScriptService = game:GetService("ServerScriptService")
local ProfileStore = require(ServerScriptService.ServerPackages["profile-store"])

local PlayerTemplate = {}

local PlayerDataStore = ProfileStore.New("PlayerDataStore", PlayerTemplate)

if RunService:IsStudio() then
    PlayerDataStore = PlayerDataStore.Mock
    print("MOCK data")
end

local PlayerData = {}
PlayerData._profiles = {} :: { [Player]: ProfileStore.Profile<typeof(PlayerTemplate)> }

type PlayerData = typeof(PlayerData)

function PlayerData.hydrate(
    self: PlayerData,
    player: Player,
    profile: ProfileStore.Profile<typeof(PlayerTemplate)>
)
    print("Initializing data for player " .. player.Name)
end

function PlayerData.init(self: PlayerData, player: Player)
    local profile = PlayerDataStore:StartSessionAsync("Player" .. player.UserId, {
        Cancel = function()
            return player.Parent ~= Players
        end,
    })

    if not profile then
        player:Kick("FAILED TO LOAD DATA")
        return
    end

    profile:AddUserId(player.UserId)
    profile:Reconcile()

    profile.OnSessionEnd:Connect(function()
        self._profiles[player] = nil
        player:Kick("Data error - Please rejoin")
    end)

    if player.Parent == Players then
        self._profiles[player] = profile
        self:hydrate(player, profile)
    else
        profile:EndSession()
    end
end

function PlayerData.remove(self: PlayerData, player: Player)
    local profile = self._profiles[player]
    if not profile then
        return
    end

    profile:EndSession()
    self._profiles[player] = nil
end

return PlayerData
