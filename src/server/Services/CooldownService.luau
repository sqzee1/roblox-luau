local CooldownService = {}
CooldownService._cooldowns = {}

type CooldownService = typeof(CooldownService)

local function getKey(player: Player, action: string): string
    return `{player.UserId}:{action}`
end

function CooldownService.onCooldown(
    self: CooldownService,
    player: Player,
    action: string,
    duration: number
): boolean
    local key = getKey(player, action)
    local now = os.clock()

    local lastUsed = self._cooldowns[key] or 0

    if now - lastUsed <= duration then
        return true
    end

    self._cooldowns[key] = now

    return false
end

return CooldownService
