import "CoreLibs/crank"

ticks = 0

function playdate.update()
	playdate.graphics.clear()
	local x = 10
	local y = 10
	
	local newTicks = math.abs(playdate.getCrankTicks(1))
	ticks += newTicks
	
	local message = "cranks " .. ticks
	playdate.graphics.drawText(message, x, y)
end