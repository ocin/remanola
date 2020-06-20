	if(g_scopetext == "Kong" and get_current_page() == "Main") then
		local buttonname = get_button_name(button)
		local padnote = button_to_padnote[buttonname]
		if(padnote ~= nil) then
			remote.handle_input({ time_stamp = event.time_stamp, item = 1, value = 1, note = padnote, velocity = button.z })
			return true
		end
	end
