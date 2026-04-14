local Map = {}
Map.__index = Map

type Map = setmetatable<{ _data: { [any]: any }, _keys: { any } }, typeof(Map)>

function Map.new()
	local self = setmetatable({
		_data = {} :: { [any]: any },
		_keys = {} :: { any },
	}, Map)

	return self
end

function Map.set(self: Map, key: any, value: any): ()
	if not Map.has(self, key) then
		table.insert(self._keys, key)
	end
	self._data[key] = value
end

function Map.get(self: Map, key: any): any?
	return self._data[key]
end

function Map.has(self: Map, key: any): boolean
	return self._data[key] ~= nil
end

function Map.size(self: Map): number
	return #self._keys
end

function Map.clear(self: Map): ()
	self._data = {}
	self._keys = {}
end

function Map.delete(self: Map, key: any): boolean
	if not Map.has(self, key) then
		return false
	end
	self._data[key] = nil
	for i, k in self._keys do
		if k == key then
			table.remove(self._keys, i)
			break
		end
	end
	return true
end

function Map.mostFrequent(self: Map): any?
	local valueFrequency: { [any]: number } = {}

	for _, value in self._data do
		if value ~= nil then
			valueFrequency[value] = (valueFrequency[value] or 0) + 1
		end
	end

	local topValue: any? = nil
	local highest = 0

	for value, count in valueFrequency do
		if count > highest then
			highest = count
			topValue = value
		end
	end

	return topValue
end

function Map.forEach(self: Map, callback: (value: any, key: any, map: any) -> ())
	for _, key in self._keys do
		callback(self._data[key], key, self)
	end
end

function Map.keys(self: Map): { any }
	local result = {}
	for _, k in self._keys do
		table.insert(result, k)
	end
	return result
end

function Map.values(self: Map): { any }
	local result = {}
	for _, k in self._keys do
		table.insert(result, self._data[k])
	end
	return result
end

function Map.entries(self: Map): { { any } }
	local result = {}
	for _, k in self._keys do
		table.insert(result, { k, self._data[k] })
	end
	return result
end

function Map.__iter(self: Map)
	local i = 0
	return function(): (any?, any?)
		i += 1
		local key = self._keys[i]
		if key ~= nil then
			return key, self._data[key]
		end
		return nil, nil
	end
end

function Map.__tostring(self: Map): string
	local parts = {}
	for _, k in self._keys do
		table.insert(parts, tostring(k) .. " => " .. tostring(self._data[k]))
	end
	return "Map { " .. table.concat(parts, ", ") .. " }"
end

return {
	new = Map.new,
}
