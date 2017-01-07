Ship = {
	location = {},
	hitLocations = {},
}

function Ship:new(o)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	return o
end

function Ship:isHit(shot)
	for i,v in ipairs(self.location) do
		if shot == v then
			table.insert(self.hitLocations, v)
			return true
		end
	end
	return false
end

function Ship:isSunk() 
	return #self.hitLocations == #self.location 
end

function Ship:length()
	return #self.location
end

battleship = Ship:new({location = {"A1", "B1", "C1", "D1"}})
print(battleship:length()) -- 4
print(battleship.length(battleship)) --4
print(battleship:isHit("B1")) --true
print(battleship:isHit("B4")) --false
print(battleship.hitLocations[1]) --B1
print(battleship:isSunk()) --false
print(battleship:isHit("A1")) --true
print(battleship:isHit("C1")) --true
print(battleship:isHit("D1")) --true
print(battleship:isSunk()) --true