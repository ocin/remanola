function deliver_midi_buttons(ret_events)
	local gridmidimsg = "f0 00 20 29 02 10 0f 00"
	for row=9,0,-1 do
		for column=0,9 do
			local buttonname
			if(row == 0) then
				buttonname = "Button C"..tostring(column)
			elseif(row == 9) then
				buttonname = "Button A"..tostring(column)
			elseif(column == 0) then
				buttonname = "Button B"..tostring(row)
			elseif(column == 9) then
				buttonname = "Button D"..tostring(row)
			else
				buttonname = "Button "..tostring(row).."-"..tostring(column)
			end
			local itemname = get_item_by_button(buttonname)
			local color = get_button_color(g_colorscheme, itemname, buttonname)
			if(string.match(itemname, "Button C8") and g_helpmode) then
				color = RED
			elseif(string.match(itemname, "Button C8") and g_valuemode) then
				color = YELLOW
			end

			gridmidimsg = gridmidimsg.." "..get_rgb_midi(color)
		end
	end
	gridmidimsg = gridmidimsg.." f7"
	table.insert(ret_events, remote.make_midi(gridmidimsg))
end

function deliver_midi_sideled(ret_events)
	-- Side LED
	local sidecolor = get_rgb_midi(get_button_color(g_colorscheme, "Side LED", "Side LED"))
	if(g_helpmode) then
		sidecolor = get_rgb_midi(RED)
	elseif(g_valuemode) then
		sidecolor = get_rgb_midi(YELLOW)
	end
	table.insert(ret_events, remote.make_midi(string.format("f0 00 20 29 02 10 0b 63 %s f7", sidecolor)))
end

function deliver_midi_startflashing(ret_events)
	if(g_startflashing) then
		local flashmidi = "f0 00 20 29 02 10 23"
		local flashcolor = S_NOCOLOR
		for buttonname,buttonmidi in pairs(buttons) do
			local shortmidi = string.match(buttonmidi, ".. (..)")
			if(not string.match(buttonname, "Button C8") and not string.match(buttonname, "Button [AC][09]")) then
				flashmidi = string.format("%s %s %02x", flashmidi, shortmidi, flashcolor)
			end
		end
		flashmidi = flashmidi.." f7"
		table.insert(ret_events, remote.make_midi(flashmidi))
		g_startflashing = false
		g_flashing = true
	end
end

function deliver_midi_brightness(ret_events)
	if(g_brightness ~= g_brightness_new) then
		g_brightness = g_brightness_new
		table.insert(ret_events, remote.make_midi(MIDI_OUT_BRIGHTNESS.." "..brightness[g_brightness]))
	end
end

function deliver_midi_scrolltext(ret_events)
	if(g_scrolltext ~= nil) then
		table.insert(ret_events, remote.make_midi(gen_scroll_string(g_scrolltext, g_scrollcolor, g_scrollspeed)))
		g_scrolling = true
		g_scrolltime = remote.get_time_ms()
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

function deliver_midi_lightshow(ret_events)
	if(g_lightshow > 0) then
		for buttonname,buttonmidi in pairs(buttons) do
			local color

			if(g_lightshow == 1) then
				color = lightshow_bars(buttonname, 50, 1)
			elseif(g_lightshow == 2) then
				color = lightshow_bars(buttonname, 50, 0)
			elseif(g_lightshow == 3) then
				color = lightshow_bars(buttonname, 500, 0)
			elseif(g_lightshow == 4) then
				color = lightshow_center(buttonname, 50)
			end

			table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttonmidi, color)))
		end

		if(g_currentbuffer == 0) then
			newdisp = DBDISP1
			newupdate = DBUPDATE0
			g_currentbuffer = 1
		else
			newdisp = DBDISP0
			newupdate = DBUPDATE1
			g_currentbuffer = 0
		end

		table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(newdisp,newupdate,DBCOPY))))
	end
end

function deliver_midi_transport(ret_events)
--      if(get_current_docpage() == "Transport") then
--              if(remote.get_item_value(itemsindex["Button D1"]) > 0) then
--                      if(g_startbar) then
--                              g_barupdatetime = remote.get_time_ms()
--                              g_startbar = false
--                              g_barupdate = true
--                              table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(RED, COPY))))
--                      elseif(g_startbeat) then
--                              g_beatupdatetime = remote.get_time_ms()
--                              g_startbeat = false
--                              g_beatupdate = true
--                              table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(WAMBER, COPY))))
--                      end
--
--                      if(g_barupdate) then
--                              if(g_barupdatetime + 200 < remote.get_time_ms()) then
--                                      g_barupdate = false
--                                      table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(GREEN, COPY))))
--                              end
--                      elseif(g_beatupdate) then
--                              if(g_beatupdatetime + 200 < remote.get_time_ms()) then
--                                      g_beatupdate = false
--                                      table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(GREEN, COPY))))
--                              end
--                      end
--              else
--                      g_startbar = false
--                      g_startbeat = false
--                      g_barupdate = false
--                      g_beatupdate = false
--              end
--      else
--              g_startbar = false
--              g_startbeat = false
--              g_barupdate = false
--              g_beatupdate = false
--      end
end

function deliver_midi_sel(ret_events)
	-- If sel* is updated trigger midi event by sending get version sysex
	for s=1,g_selcount do
		if(g_sel[s] ~= nil) then
			table.insert(ret_events, remote.make_midi(MIDI_OUT_GETVERSION))
		end
	end
end
