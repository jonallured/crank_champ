local gfx <const> = playdate.graphics

class('NormalScreen').extends()

function NormalScreen:init(gameData)
	self.gameData = gameData
end

function NormalScreen:render()
	self:clear()
	
	local sprite = gfx.sprite.spriteWithText(self.gameData:crankCount(), 100, 100)
	sprite:moveTo(100, 100)
	sprite:add()
	
	self.sprite = sprite
end

function NormalScreen:clear()
	if self.sprite then self.sprite:remove() end
end