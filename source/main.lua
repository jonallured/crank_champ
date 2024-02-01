import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/crank"
import "CoreLibs/qrcode"

import "GameData"
import "NormalScreen"
import "QrCodeScreen"

local gfx <const> = playdate.graphics

local gameData = GameData()
local normalScreen = NormalScreen(gameData)
local qrCodeScreen = QrCodeScreen(gameData)

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

function playdate.cranked()
	local newTicks = playdate.getCrankTicks(1) or 0
	if newTicks == 0 then return end
	
	gameData.ticks += newTicks
	normalScreen:render()
end

function playdate.update()
	gfx.sprite.update()
	playdate.timer.updateTimers()
end

init()