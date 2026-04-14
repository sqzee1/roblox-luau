local function map<T, U>(t: { T }, callback: (item: T, index: number) -> U): { U }
	local result = {} :: { U }
	for i, item in t do
		table.insert(result, callback(item, i))
	end
	return result
end

local function filter<T>(t: { T }, callback: (item: T, index: number) -> boolean): { T }
	local result = {} :: { T }
	for i, item in t do
		if callback(item, i) then
			table.insert(result, item)
		end
	end
	return result
end

local function find<T>(t: { T }, callback: (item: T, index: number) -> boolean): T?
	for i, item in t do
		if callback(item, i) then
			return item
		end
	end
	return nil
end

local function reduce<T, U>(t: { T }, callback: (acc: U, item: T, index: number) -> U, initial: U): U
	local acc = initial
	for i, item in t do
		acc = callback(acc, item, i)
	end
	return acc
end

local function some<T>(t: { T }, callback: (item: T, index: number) -> boolean): boolean
	for i, item in t do
		if callback(item, i) then
			return true
		end
	end
	return false
end

local function every<T>(t: { T }, callback: (item: T, index: number) -> boolean): boolean
	for i, item in t do
		if not callback(item, i) then
			return false
		end
	end
	return true
end

return {
	map = map,
	filter = filter,
	find = find,
	reduce = reduce,
	some = some,
	every = every,
}
