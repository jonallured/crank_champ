import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"
import "CoreLibs/crank"
import "CoreLibs/qrcode"
import "CoreLibs/keyboard"

import "GameData"
import "UserData"
import "UserScreen"
import "NormalScreen"
import "QrCodeScreen"

local gfx <const> = playdate.graphics

local userData = UserData()
local userScreen = UserScreen(userData)
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
	if userData:verify() then
		normalScreen:render()
	else
		userScreen:render()
	end
end

function playdate.cranked()
	local newTicks = playdate.getCrankTicks(1) or 0
	if newTicks == 0 then return end
	
	gameData.ticks += newTicks
	normalScreen:render()
end

function playdate.keyboard.textChangedCallback()
	userData.code = playdate.keyboard.text
	userScreen:render()
end

function playdate.keyboard.keyboardWillHideCallback(accepted)
	if accepted then
		userData:save()
		userScreen:clear()
		normalScreen:render()
	else
		print("idk")
	end
end

function playdate.update()
	gfx.sprite.update()
	playdate.timer.updateTimers()
end

init()