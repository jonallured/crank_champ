local gfx <const> = playdate.graphics

class('QrCodeScreen').extends()

function QrCodeScreen:render()
	self:clear()	
	
	local sprite = gfx.sprite.spriteWithText("qr code screen", 100, 100)
	sprite:moveTo(100, 100)
	sprite:add()
	
	self.sprite = sprite
end

function QrCodeScreen:clear()
	if self.sprite then self.sprite:remove() end
end