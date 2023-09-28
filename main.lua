import "CoreLibs/crank"

ticks = 0

function playdate.update()
	playdate.graphics.clear()
	local x = 0
	local y = 0
	
	local newTicks = playdate.getCrankTicks(1)
	ticks += newTicks
	
	local message = "ticks " .. ticks
	playdate.graphics.drawText(message, x, y)
end