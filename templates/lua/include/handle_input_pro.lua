function handle_input_buttonendscroll(button)
	if(g_scrolling and button.z) then
		g_endscroll = true
		return false
	end
end
