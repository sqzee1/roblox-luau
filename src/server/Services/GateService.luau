local GateService = {}

export type GateService = typeof(GateService)

local isfinite = math.isfinite
local floor = math.floor

function GateService.validate(
    self: GateService,
    value: number,
    isInteger: boolean?,
    minVal: number?,
    maxVal: number?
): boolean
    if not isfinite(value) then
        return false
    end

    if isInteger and floor(value) ~= value then
        return false
    end

    if minVal and value < minVal then
        return false
    end
    if maxVal and value > maxVal then
        return false
    end

    return true
end

function GateService.scan(self: GateService, value: any, depth: number): boolean
    if depth <= 0 then
        return true
    end

    local t = typeof(value)

    if t == "number" then
        return isfinite(value)
    end

    if t == "Vector2" then
        return isfinite(value.X) and isfinite(value.Y)
    end

    if t == "Vector3" then
        return isfinite(value.X) and isfinite(value.Y) and isfinite(value.Z)
    end

    if t == "CFrame" then
        local pos = value.Position
        if not isfinite(pos.X) or not isfinite(pos.Y) or not isfinite(pos.Z) then
            return false
        end
        local rx, ry, rz = value:ToEulerAnglesXYZ()
        return isfinite(rx) and isfinite(ry) and isfinite(rz)
    end

    if t == "UDim" then
        return isfinite(value.Scale) and isfinite(value.Offset)
    end

    if t == "UDim2" then
        return isfinite(value.X.Scale)
            and isfinite(value.X.Offset)
            and isfinite(value.Y.Scale)
            and isfinite(value.Y.Offset)
    end

    if t == "Color3" then
        return isfinite(value.R) and isfinite(value.G) and isfinite(value.B)
    end

    if t == "NumberRange" then
        return isfinite(value.Min) and isfinite(value.Max)
    end

    if t == "Rect" then
        return isfinite(value.Min.X)
            and isfinite(value.Min.Y)
            and isfinite(value.Max.X)
            and isfinite(value.Max.Y)
    end

    if t == "Ray" then
        local o = value.Origin
        local d = value.Direction
        return isfinite(o.X)
            and isfinite(o.Y)
            and isfinite(o.Z)
            and isfinite(d.X)
            and isfinite(d.Y)
            and isfinite(d.Z)
    end

    if t == "table" then
        local nextDepth = depth - 1
        for _, v in value do
            if not self:scan(v, nextDepth) then
                return false
            end
        end
        return true
    end
    return true
end

return GateService
