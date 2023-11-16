import "CoreLibs/crank"
import "CoreLibs/qrcode"
import "CoreLibs/timer"

isNormalMode = false

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
		playdate.graphics.generateQRCode("butts", nil, function(image, error)
			image:draw(10, 10)
		end)
		playdate.timer.updateTimers()
		playdate.graphics.drawText("qr code", 0, 0)
	end
end