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