class('GameData').extends()

function GameData:init()
	local table = playdate.datastore.read()
	self.ticks = table and table["ticks"] or 0
end

function GameData:crankCount()
	return "crank count: " .. self.ticks
end

function GameData:save()
	local table = playdate.datastore.read()
	table["ticks"] = self.ticks
	playdate.datastore.write(table)
end