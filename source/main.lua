import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/crank"
import "CoreLibs/qrcode"

local gfx <const> = playdate.graphics

local sprite = nil

function renderNormalScreen()
	if sprite then sprite:remove() end
	
	sprite = gfx.sprite.spriteWithText("normal screen", 100, 100)
	sprite:moveTo(100, 100)
	sprite:add()
end

function renderQrCodeScreen()
	if sprite then sprite:remove() end
	
	sprite = gfx.sprite.spriteWithText("qr code screen", 100, 100)
	sprite:moveTo(100, 100)
	sprite:add()
end

function init()
	local menu = playdate.getSystemMenu()
	menu:addMenuItem("normal", renderNormalScreen)
	menu:addMenuItem("code", renderQrCodeScreen)
	renderNormalScreen()
end

function playdate.update()
	gfx.sprite.update()
	playdate.timer.updateTimers()
end

init()