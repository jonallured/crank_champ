local gfx <const> = playdate.graphics

class('QrCodeScreen').extends()

function QrCodeScreen:init(gameData, userData)
	self.gameData = gameData
	self.userData = userData
end

function QrCodeScreen:render()
	self:clear()
	self.gameData:save()
	
	local loadingSprite = gfx.sprite.spriteWithText("loading...", 100, 100)
	loadingSprite:moveTo(100, 100)
	loadingSprite:add()
	
	self.loadingSprite = loadingSprite
	
	local url = string.format(
		"https://app.jonallured.com/crank_users/%s/crank_counts/new?ticks=%i",
		self.userData.code,
		self.gameData.ticks
	)
	
	gfx.generateQRCode(url, nil, function(image, error)
		self:clear()
		
		local qrCodeSprite = gfx.sprite.new(image)
		qrCodeSprite:moveTo(100, 100)
		qrCodeSprite:add()
		self.qrCodeSprite = qrCodeSprite
	end)
end

function QrCodeScreen:clear()
	if self.loadingSprite then self.loadingSprite:remove() end
	if self.qrCodeSprite then self.qrCodeSprite:remove() end
end