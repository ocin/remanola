function handle_input_buttonendscroll(button)
	if(g_scrolling) then
		if(button.z == 0) then
			if(g_scrolltime + 100 < remote.get_time_ms()) then
				g_endscroll = true
			end
		end
		return true
	end
end

function handle_input_internalpage(event, button)
	if(string.match(get_current_page(), "Internal")) then
		local button_brightnessup = remote.match_midi(buttons["Button 7-8"].." zz", event)
		local button_brightnessdown = remote.match_midi(buttons["Button 8-8"].." zz", event)
		if(button_brightnessup ~= nil and button_brightnessup.z > 0) then
			if(g_brightness_new < 5) then
				g_brightness_new = g_brightness_new+1
			end
			return true
		elseif(button_brightnessdown ~= nil and button_brightnessdown.z > 0) then
			if(g_brightness_new > 1) then
				g_brightness_new = g_brightness_new-1
			end
			return true
		end
		local button_lightshow1 = remote.match_midi(buttons["Button 1-6"].." zz", event)
		if(button_lightshow1 ~= nil and button_lightshow1.z > 0) then
			g_lightshow = 1
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			return true
		end
		local button_lightshow2 = remote.match_midi(buttons["Button 1-7"].." zz", event)
		if(button_lightshow2 ~= nil and button_lightshow2.z > 0) then
			g_lightshow = 2
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			return true
		end
		local button_lightshow3 = remote.match_midi(buttons["Button 1-8"].." zz", event)
		if(button_lightshow3 ~= nil and button_lightshow3.z > 0) then
			g_lightshow = 3
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			return true
		end
		local button_lightshow4 = remote.match_midi(buttons["Button 2-8"].." zz", event)
		if(button_lightshow4 ~= nil and button_lightshow4.z > 0) then
			g_lightshow = 4
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			g_lightshowloop = 1
			return true
		end
	end
end

function handle_input_lightshow(event)
	for buttonname,buttonmidi in pairs(buttons) do
		local button = remote.match_midi(buttonmidi.." zz", event)
		if(button ~= nil and button.z > 0) then
			return true
		end
		local button = remote.match_midi(buttonmidi.." 00", event)
		if(button ~= nil) then
			if(g_lightshowtime + 500 < remote.get_time_ms()) then
				g_lightshow = 0
				g_updateall = true
			end
			return true
		end
	end
end
