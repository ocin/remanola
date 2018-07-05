function handle_input_buttonendscroll(event, button)
	if(g_scrolling) then
		if(button.z == 0) then
			if(g_scrolltime + 1000 < remote.get_time_ms()) then
				g_endscroll = true
			end
		end
		return true
	end
end
