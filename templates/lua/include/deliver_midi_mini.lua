function deliver_midi_buttons(ret_events)
	if(g_lightshow == 0 and not g_flashing) then
		local curdisp
		local curupdate

		local swapbuffers = false

		for buttonname,buttonmidi in pairs(buttons) do
			local color
			local itemname = get_item_by_button(buttonname)

			if((g_updateditems[itemname] ~= nil) or g_updateall) then
				color = get_button_color(g_colorscheme, itemname, buttonname)
				if(color ~= nil) then
					table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttonmidi, color)))
				end
				if(not swapbuffers) then
					swapbuffers = true
				end
			end
		end

		if(swapbuffers) then
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
			swapbuffers = false

			g_updateditems = {}
			g_updateall = false
		end
	end
end

function deliver_midi_startflashing(ret_events)
	if(g_startflashing) then
		local helpcolor = RED
		g_flashlength = 250
		if(g_valuemode) then
			helpcolor = AMBER
			g_flashlength = 100
		end
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0,DBUPDATE1,DBCOPY))))
		for buttonname,buttonmidi in pairs(buttons) do
			table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttonmidi, 0)))
		end
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button C8"], bit.bor(helpcolor, COPY))))
		g_flashing = true
		g_startflashing = false
		g_flashstate = 0
		g_flashtime = remote.get_time_ms()
	end
end

function deliver_midi_flashing(ret_events)
	if(g_flashing) then
		if(g_flashtime + g_flashlength < remote.get_time_ms()) then
			g_flashtime = remote.get_time_ms()

			if(g_flashstate == 1) then
				g_flashstate = 0
				table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0))))
			else
				g_flashstate = 1
				table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP1))))
			end
		end
	end
end

function deliver_midi_stopflashing(ret_events)
	if(g_startflashing) then
		local helpcolor = RED
		g_flashlength = 250
		if(g_valuemode) then
			helpcolor = AMBER
			g_flashlength = 100
		end
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0,DBUPDATE1,DBCOPY))))
		for buttonname,buttonmidi in pairs(buttons) do
			table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttonmidi, 0)))
		end
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button C8"], bit.bor(helpcolor, COPY))))
		g_flashing = true
		g_startflashing = false
		g_flashstate = 0
		g_flashtime = remote.get_time_ms()
	end
end

function deliver_midi_brightness(ret_events)
	if(g_brightness ~= g_brightness_new) then
		g_brightness = g_brightness_new
		table.insert(ret_events, remote.make_midi(MIDI_OUT_BRIGHTNESS.." "..brightness[g_brightness]))
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
      if(get_current_docpage() == "Transport") then
              if(remote.get_item_value(itemsindex["Button D1"]) > 0) then
                      if(g_startbar) then
                              g_barupdatetime = remote.get_time_ms()
                              g_startbar = false
                              g_barupdate = true
                              table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(RED, COPY))))
                      elseif(g_startbeat) then
                              g_beatupdatetime = remote.get_time_ms()
                              g_startbeat = false
                              g_beatupdate = true
                              table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(WAMBER, COPY))))
                      end

                      if(g_barupdate) then
                              if(g_barupdatetime + 200 < remote.get_time_ms()) then
                                      g_barupdate = false
                                      table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(GREEN, COPY))))
                              end
                      elseif(g_beatupdate) then
                              if(g_beatupdatetime + 200 < remote.get_time_ms()) then
                                      g_beatupdate = false
                                      table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(GREEN, COPY))))
                              end
                      end
              else
                      g_startbar = false
                      g_startbeat = false
                      g_barupdate = false
                      g_beatupdate = false
              end
      else
              g_startbar = false
              g_startbeat = false
              g_barupdate = false
              g_beatupdate = false
      end
end

