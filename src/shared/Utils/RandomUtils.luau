local function getRandomItem<T>(t: { T }): T
	return t[math.random(1, #t)]
end

local function getRandomItems<T>(t: { T }, count: number): { T }
	local items = table.clone(t)
	local result = {}
	local fixedCount = math.min(count, #items)

	for _ = 1, fixedCount do
		local index = math.random(1, #items)
		table.insert(result, items[index])
		table.remove(items, index)
	end

	return result
end

local function rollChance(percent: number): boolean
	return math.random() <= (percent / 100)
end

return {
	getRandomItem = getRandomItem,
	getRandomItems = getRandomItems,
	rollChance = rollChance,
}
