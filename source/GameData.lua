class('GameData').extends()

function GameData:init()
	self.ticks = 0
end

function GameData:crankCount()
	return "crank count: " .. self.ticks
end