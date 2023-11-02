import "CoreLibs/crank"

isNormalMode = true

local menu = playdate.getSystemMenu()

local menuItem, error = menu:addMenuItem("normal", function()
	isNormalMode = true
end)

local menuItem, error = menu:addMenuItem("code", function()
	isNormalMode = false
end)

ticks = 0

function playdate.update()
	playdate.graphics.clear()
	
	if isNormalMode then
		local x = 10
		local y = 10
		
		local newTicks = math.abs(playdate.getCrankTicks(1))
		ticks += newTicks
		
		local message = "cranks " .. ticks
		playdate.graphics.drawText(message, x, y)
	else
		playdate.graphics.drawText("qr code", 0, 0)
	end
end