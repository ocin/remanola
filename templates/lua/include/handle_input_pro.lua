function handle_input_buttonendscroll(event, button)
	if(g_scrolling) then
		g_endscroll = true
		return false
	end
end
