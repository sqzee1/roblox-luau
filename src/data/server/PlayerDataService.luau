local Players = game:GetService("Players")
const ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerScriptService = game:GetService("ServerScriptService")

const PlayerTemplate = require(ReplicatedStorage.shared.data.PlayerTemplate)
local profileStore = require(ServerScriptService.ServerPackages["profile-store"])

const IS_MOCK = RunService:IsStudio()

local Store = profileStore.New("PlayerDataStore", PlayerTemplate)
local PlayerDataStore = if IS_MOCK then Store.Mock else Store

if IS_MOCK then
    print("MOCK data")
end

local PlayerDataService = {}

type PlayerDataService = typeof(PlayerDataService)

local profiles: { [Player]: profileStore.Profile<typeof(PlayerTemplate)> } = {}

local function hydrate(player: Player, profile: profileStore.Profile<typeof(PlayerTemplate)>)
    print("Initializing data for player " .. player.Name)
end

function PlayerDataService.init(self: PlayerDataService, player: Player)
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
        profiles[player] = nil
        player:Kick("Data error - Please rejoin")
    end)

    if player.Parent == Players then
        profiles[player] = profile
        hydrate(player, profile)
    else
        profile:EndSession()
    end
end

function PlayerDataService.remove(self: PlayerDataService, player: Player)
    local profile = profiles[player]
    if not profile then
        return
    end

    profile:EndSession()
    profiles[player] = nil
end

return PlayerDataService
