function deliver_midi_scrolltext(ret_events)
	if(g_scrolltext ~= nil) then
		table.insert(ret_events, remote.make_midi(gen_scroll_string(g_scrolltext, g_scrollcolor, g_scrollspeed)))
		g_scrolling = true
		-- g_scrolltime = remote.get_time_ms()
		g_scrolltext = nil
		g_scrollcolor = g_scrollcolor_default
		g_scrollspeed = g_scrollspeed_default
	end
end

function deliver_midi_endscroll(ret_events)
	if(g_endscroll) then
		table.insert(ret_events, remote.make_midi(MIDI_OUT_ENDSCROLL))
		g_endscroll = false
		g_scrolling = false
		g_updateall = true
	end
end

function deliver_midi_sel(ret_events)
	-- If sel* is updated trigger midi event by sending get version sysex
	for s=1,g_selcount do
		if(g_sel[s] ~= nil) then
			table.insert(ret_events, remote.make_midi(MIDI_OUT_GETVERSION))
		end
	end
end

function deliver_midi_mfader(ret_events)
	for buttonname, velocity in pairs(g_mfaderbuttons) do
		if(buttonname ~= nil and  velocity ~= nil) then
			table.insert(ret_events, remote.make_midi(MIDI_OUT_GETVERSION))
			return
		end
	end
end

function deliver_midi_velofader(ret_events)
	for buttonname, velocity in pairs(g_velofaderbuttons) do
		if(buttonname ~= nil and  velocity ~= nil) then
			table.insert(ret_events, remote.make_midi(MIDI_OUT_GETVERSION))
			return
		end
	end
end

function deliver_midi_repeatud(ret_events)
	for buttonname, velocity in pairs(g_repeatudbuttons) do
		if(buttonname ~= nil and velocity ~= nil) then
			table.insert(ret_events, remote.make_midi(MIDI_OUT_GETVERSION))
			return
		end
	end
end
