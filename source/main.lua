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
import "SpriteScreen"

local gfx <const> = playdate.graphics

local userData = UserData()
local userScreen = UserScreen(userData)
local gameData = GameData()
local normalScreen = NormalScreen(gameData)
local qrCodeScreen = QrCodeScreen(gameData, userData)
local spriteScreen = SpriteScreen()

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
	menu:addMenuItem("sprites", function()
		normalScreen:clear()
		qrCodeScreen:clear()
		spriteScreen:init()
	end)

	if userData:verify() then
		-- normalScreen:render()
	else
		userScreen:render()
	end
end

-- function playdate.cranked()
-- 	local newTicks = playdate.getCrankTicks(1) or 0
-- 	if newTicks == 0 then return end

-- 	gameData.ticks += newTicks
-- 	normalScreen:render()
-- end

-- function playdate.cranked()
-- 	local position = playdate.getCrankPosition() or 0

-- 	spriteScreen:update(position)
-- end

-- sjh look here
function playdate.cranked()
	local newTicks = playdate.getCrankTicks(5) or 0
	if newTicks == 0 then return end

	gameData.ticks += newTicks

	spriteScreen:update(gameData.ticks % 5)
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
