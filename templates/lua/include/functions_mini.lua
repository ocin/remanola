function gen_scroll_string(string, color, speed)
	return(string.format("%s %02x %02x %s F7", MIDI_OUT_SCROLL, color, speed, hex_encode_text(string)))
end

function get_veloctity(velocity)
	if(velocity > 0) then
		velocity = g_kbdvel
	end
	return(velocity)
end

function lightshow_bars(buttonname, cyclelength, orientation)
	local color

	if(g_updatetime + cyclelength < remote.get_time_ms()) then
		g_lightshowcycle = g_lightshowcycle + 1
		if(g_lightshowcycle > 8) then
			g_lightshowcycle = 1
		end
		g_updatetime = remote.get_time_ms()
	end

	if(string.match(buttonname, "Button C%d") or string.match(buttonname, "Button %a")) then
		color = NOCOLOR
	else
		local row
		local col
		row, col = string.match(buttonname, "Button (%d)%-(%d)")
		local dim
		if(orientation == 1) then
			dim = row
		else
			dim = col
		end
		local cloop = tonumber(dim) - g_lightshowcycle
		if(cloop < 1) then
			cloop = cloop + 8
		end
		color = gradient[cloop]
	end
	return color
end

function lightshow_center(buttonname, cyclelength)
	local color

	if(g_updatetime + cyclelength < remote.get_time_ms()) then
		g_lightshowcycle = g_lightshowcycle + 1
		if(g_lightshowcycle > 4) then
			g_lightshowcycle = 1
			g_lightshowloop = g_lightshowloop + 1
			if(g_lightshowloop > 8) then
				g_lightshowloop = 1
			end
		end
		g_updatetime = remote.get_time_ms()
	end

	if(string.match(buttonname, "Button C%d") or string.match(buttonname, "Button %a")) then
		color = NOCOLOR
	else
		local row
		local col
		row, col = string.match(buttonname, "Button (%d)%-(%d)")

		local x
		local y

		if(tonumber(row) >= 5) then
			x = tonumber(row) - 4
		else
			x = 5-tonumber(row)
		end
		if(tonumber(col) >= 5) then
			y = tonumber(col) - 4
		else
			y = 5-tonumber(col)
		end
		if(x <= g_lightshowcycle and y <= g_lightshowcycle) then
			color = gradient[g_lightshowloop]
		else
			color = NOCOLOR
		end
	end
	return color
end
