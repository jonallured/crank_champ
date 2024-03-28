local gfx <const> = playdate.graphics

class('UserScreen').extends()

function UserScreen:init(userData)
	self.userData = userData
end

function UserScreen:render()
	self:clear()
	playdate.keyboard.show(self.userData.code)
	
	local messageSprite = gfx.sprite.spriteWithText("enter your user code", 180, 100)
	messageSprite:moveTo(100, 30)
	messageSprite:add()
	
	self.messageSprite = messageSprite
	
	if self.userData.code == "" then return end
	
	local userCodeSprite = gfx.sprite.spriteWithText(self.userData.code, 180, 100)
	userCodeSprite:moveTo(100, 60)
	userCodeSprite:add()
	
	self.userCodeSprite = userCodeSprite
end

function UserScreen:clear()
	if self.messageSprite then self.messageSprite:remove() end
	if self.userCodeSprite then self.userCodeSprite:remove() end
end