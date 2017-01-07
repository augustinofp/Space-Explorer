
local t = {days, hours, minutes, seconds}


local function create_timer(t)


	display.setDefault("background", 0.2, 0.2, 0.4 )

	--define necessary local variables
	local secondsLeft 
	local clockText

	--setup initial display depending on length of timer

	if t[1] == 0 then --if the timer is less than 1 day 
		if t[2] == 0 then --if the timer is less than 1 hour 

			if t[3] == 0 then -- if the timer is less than 1 minute - in seconds
				secondsLeft = t[4]
				clockText = display.newText(string.format("0:%d", secondsleft), display.contentCenterX, 80, native.systemFontBold, 80)
				clockText:setFillColor( 0.7, 0.7, 1 )

			else --timer is in minutes, and seconds, less than hour
				secondsLeft = t[3]*60 + t[4]
				clockText = display.newText(string.format("%d:%d", t[3], t[4]), display.contentCenterX, 80, native.systemFontBold, 80)
				clockText:setFillColor( 0.7, 0.7, 1 )
			end

		else --if timer greater than hour, less than day in hour/minutes/seconds
			secondsLeft = t[2]*3600 + t[3]*60 + t[4]
			clockText = display.newText(string.format("%d:%d:%d", t[2], t[3], t[4]), display.contentCenterX, 80, native.systemFontBold, 80)
			clockText:setFillColor( 0.7, 0.7, 1 )
		end
	
	else --timer is greater than 1 day, in days/hours/minutes/seconds
		secondsLeft = t[1]*86164 + t[2]*3600 + t[3]*60 + t[4]
		clockText = display.newText(string.format("%d:%d:%d:%d", t[1], t[2], t[3], t[4]), display.contentCenterX, 80, native.systemFontBold, 80)
		clockText:setFillColor( 0.7, 0.7, 1 )
	end
				
	

	local function updateTime()
		
		local timeDisplay

		-- decrement the number of seconds
		secondsLeft = secondsLeft - 1
	
		-- time is tracked in seconds.  We need to convert it to minutes and seconds
		local days = math.floor(secondsLeft / 86164)
		local hours = math.floor( (secondsLeft - t[1]*86164) / 3600 )
		local minutes = math.floor((secondsLeft - t[1]*86164 - t[2]*3600) / 60)
		local seconds = math.floor((secondsLeft - t[1]*86164 - t[2]*3600 - t[3]*60))
	
		-- make it a string using string format.  
		if days == 0 then
			if hours == 0 then
				timeDisplay = string.format( "%02d:%02d", minutes, seconds )
				
			else 
				timeDisplay = string.format( "%02d:%02d:%02d", hours, minutes, seconds )
			end

		else 
			timeDisplay = string.format( "%02d:%02d:%02d:%02d", days, hours, minutes, seconds )
		end

		clockText.text = timeDisplay
		
		end

	-- run the timer
	local countDownTimer = timer.performWithDelay( 1000, updateTime, secondsLeft )

end


