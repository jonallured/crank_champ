import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/crank"
import "CoreLibs/qrcode"

import "NormalScreen"
import "QrCodeScreen"

local gfx <const> = playdate.graphics

local normalScreen = NormalScreen()
local qrCodeScreen = QrCodeScreen()

function init()
	local menu = playdate.getSystemMenu()
	menu:addMenuItem("normal", function()
		qrCodeScreen:clear()
		normalScreen:render()
	end)
	menu:addMenuItem("code", function()
		normalScreen:clear()
		qrCodeScreen:render()
	end)
	normalScreen:render()
end

function playdate.update()
	gfx.sprite.update()
	playdate.timer.updateTimers()
end

init()