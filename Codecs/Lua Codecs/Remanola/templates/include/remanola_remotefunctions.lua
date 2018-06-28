function remote_init()
	for buttonname,buttonmidi in pairs(buttons) do
		table.insert(items, {name = buttonname, input = "button", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}})
		table.insert(inputs, {pattern=buttonmidi .. " ?<???x>", name=buttonname})
	end

	for row=1,8 do
		for column=1,8,2 do
			table.insert(items, {name = "UDHButton "..row.."-"..column.."_"..row.."-"..tostring(column+1), input = "delta", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}})
		end
	end

	for sel=1,4 do
		for val=0,127 do
			table.insert(items, {name = "Sel"..sel.."_"..val, input= "button", output = "value", min = 0, max = 1})
		end
	end

	for row=1,8,2 do
		for column=1,8 do
			table.insert(items, {name = "UDVButton "..row.."-"..column.."_"..tostring(row+1).."-"..column, input = "delta", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}})
		end
	end

	for index,item in ipairs(items) do
		itemsindex[item.name] = index
		itemsmodeindex[item.name] = {}
		if(item.modes ~= nil) then
			for mindex,mode in ipairs(item.modes) do
				itemsmodeindex[item.name][mode] = mindex
			end
		end
	end

	remote.define_items(items)
	remote.define_auto_inputs(inputs)
end

function remote_release_from_use()
	local ret_events={}

	return ret_events;
end

function remote_prepare_for_use()
	local ret_events={}

	table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0,DBUPDATE1,DBCOPY))))

	return ret_events;
end

function remote_set_state(changed_items)
	for i,citemindex in ipairs(changed_items)do
		local citemname = items[citemindex].name

		g_updateditems[citemname] = true

		if(citemname ~= nil) then
			if(remote.get_item_mode(citemindex) == itemsmodeindex[citemname]["SEL1"]) then
				g_sel1 = remote.get_item_value(citemindex)
			elseif(remote.get_item_mode(citemindex) == itemsmodeindex[citemname]["SEL2"]) then
				g_sel2 = remote.get_item_value(citemindex)
			elseif(remote.get_item_mode(citemindex) == itemsmodeindex[citemname]["SEL3"]) then
				g_sel3 = remote.get_item_value(citemindex)
			elseif(remote.get_item_mode(citemindex) == itemsmodeindex[citemname]["SEL4"]) then
				g_sel4 = remote.get_item_value(citemindex)
			end
			if(string.match(citemname, "DeviceScope")) then
				-- g_scrolltext = remote.get_item_text_value(itemsindex["DeviceScope"])
				g_updateall = true
       				if(remote.is_item_enabled(itemsindex["DeviceScope"])) then
               				local newscope = remote.get_item_text_value(itemsindex["DeviceScope"])
					g_scopetext = newscope
					g_colorscheme = g_scopetext
       				else
               				local newscope = ""
					g_scopetext = newscope
       				end
			elseif(string.match(citemname, "BarPosition")) then
				g_startbar = true
			elseif(string.match(citemname, "BeatPosition")) then
				if(not g_barupdate and not g_startbar) then
					g_startbeat = true
				end
			elseif(string.match(citemname, "PlayingStep")) then
				if(g_scopetext == "Redrum") then
               				local playingstep = tonumber(remote.get_item_text_value(itemsindex["PlayingStep"]))
					local editsteps = math.floor(remote.get_item_value(itemsindex["UDVButton 5-8_6-8"])/42)+1
					local cstep = (playingstep-1)%16
					local cpage = math.floor(((playingstep-1))/16)+1
					local crowstep = (cstep)%8+1
					local crow = math.floor((cstep)/8)+1

					if(editsteps == cpage) then
						-- Old playing button
						g_updateditems[g_playingbutton] = true
						g_playingbutton = "Button "..tostring(crow).."-"..tostring(crowstep)
						-- New playing button
						g_updateditems[g_playingbutton] = true
					else
						g_playingbutton = "Other page"	
					end
				elseif(g_scopetext == "Thor") then
               				local playingstep = tonumber(remote.get_item_text_value(itemsindex["PlayingStep"]))
					local crowstep = (playingstep)%8+1
					local crow = math.floor((playingstep)/8)+1

					-- Old playing button
					g_updateditems[g_playingbutton] = true
					g_playingbutton = "Button "..tostring(crow).."-"..tostring(crowstep)
					-- New playing button
					g_updateditems[g_playingbutton] = true
				end
			elseif(string.match(citemname, "PageName")) then
				g_updateall = true
				if(g_scopetext == "Europa" or g_scopetext == "Grain") then
					g_enginenumnew = tonumber(string.match(get_current_page(), "Eng (%d)"))
					g_lfonumnew = tonumber(string.match(get_current_page(), "LFO (%d)"))
					g_envnumnew = tonumber(string.match(get_current_page(), "Env (%d)"))
					if(string.match(get_current_page(), "Phaser")) then
						g_effectnumnew = 5
					elseif(string.match(get_current_page(), "Dist")) then
						g_effectnumnew = 3
					elseif(string.match(get_current_page(), "Eq")) then
						g_effectnumnew = 6
					elseif(string.match(get_current_page(), "Delay")) then
						g_effectnumnew = 2
					elseif(string.match(get_current_page(), "Comp")) then
						g_effectnumnew = 4
					elseif(string.match(get_current_page(), "Reverb")) then
						g_effectnumnew = 1
					end
				elseif(g_scopetext == "RV7000 Advanced Reverb") then
					if(string.match(get_current_page(), "Reverb")) then
						g_editnumnew = 0
					elseif(string.match(get_current_page(), "Eq")) then
						g_editnumnew = 1
					elseif(string.match(get_current_page(), "Gate")) then
						g_editnumnew = 2
					end
				end
			elseif(string.match(citemname, "SubPageName")) then
				g_updateall = true
			elseif(string.match(citemname, "KbdVel")) then
               			local newkbdvel = tonumber(remote.get_item_text_value(itemsindex["KbdVel"]))
				if(newkbdvel ~= nil) then
               				g_kbdvel = newkbdvel
				end
			elseif(string.match(citemname, "BaseKey")) then
               			local newbasekey = tonumber(remote.get_item_text_value(itemsindex["BaseKey"]))
				if(newbasekey ~= nil) then
               				g_basekey = newbasekey
				end
			end
		end
	end
end

function remote_deliver_midi(maxbytes, port)
	local ret_events = {}
	local send_event={}

	if(g_lightshow == 0 and not g_flashing) then
		local curdisp
		local curupdate

		local swapbuffers = false

		for buttonname,buttonmidi in pairs(buttons) do
			local color
			local itemname = get_item_by_button(buttonname)

			if((g_updateditems[itemname] ~= nil) or g_updateall) then
				color = get_button_color(g_colorscheme, itemname, buttonname)
				table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttonmidi, color)))
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
				-- table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons['Button H'], bit.bor(GREEN, COPY))))
			else
				newdisp = DBDISP0
				newupdate = DBUPDATE1
				g_currentbuffer = 0
				-- table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons['Button H'], bit.bor(RED, COPY))))
			end

			table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(newdisp,newupdate,DBCOPY))))
			swapbuffers = false

			g_updateditems = {}
			g_updateall = false
		end
	end

	if(g_brightness ~= g_brightness_new) then
		g_brightness = g_brightness_new
		table.insert(ret_events, remote.make_midi(MIDI_OUT_BRIGHTNESS.." "..brightness[g_brightness]))
	end

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

	if(g_stopflashing) then
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0,DBUPDATE1,DBCOPY))))
		g_currentbuffer = 0
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button C8"], bit.bor(GREEN, COPY))))
		g_flashing = false
		g_stopflashing = false
		g_flashstate = 0
		g_updateall = true
	end

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

	if(g_scrolltext ~= nil) then
		table.insert(ret_events, remote.make_midi(gen_scroll_string(g_scrolltext, g_scrollcolor, g_scrollspeed)))
		g_scrolling = true
		g_scrolltime = remote.get_time_ms()
		g_scrolltext = nil
		g_scrollcolor = g_scrollcolor_default
		g_scrollspeed = g_scrollspeed_default
	end

	if(g_endscroll) then
		table.insert(ret_events, remote.make_midi(MIDI_OUT_ENDSCROLL))
		g_endscroll = false
		g_scrolling = false
		g_updateall = true
	end

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

	if(get_current_docpage() == "Transport") then
		if(remote.get_item_value(itemsindex["Button A"]) > 0) then
			if(g_startbar) then
				g_barupdatetime = remote.get_time_ms()
				g_startbar = false	
				g_barupdate = true
				table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button A"], bit.bor(RED, COPY))))
			elseif(g_startbeat) then
				g_beatupdatetime = remote.get_time_ms()
				g_startbeat = false	
				g_beatupdate = true
				table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button A"], bit.bor(WAMBER, COPY))))
			end
		
			if(g_barupdate) then
				if(g_barupdatetime + 200 < remote.get_time_ms()) then
					g_barupdate = false
					table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button A"], bit.bor(GREEN, COPY))))
				end
			elseif(g_beatupdate) then
				if(g_beatupdatetime + 200 < remote.get_time_ms()) then
					g_beatupdate = false
					table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button A"], bit.bor(GREEN, COPY))))
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

	-- If sel* is updated trigger midi event by sending get version sysex
	if(g_sel1 ~= -1 or g_sel2 ~= -1 or g_sel3 ~= -1 or g_sel4 ~= -1) then
		table.insert(ret_events, remote.make_midi(MIDI_OUT_GETVERSION))
	end

	return ret_events
end

function remote_process_midi(event)
        local pad = "none"
        local pad_note = 0
        local pad_item = 0

	if(g_sel1 ~= -1) then
		local msg = { time_stamp = event.time_stamp, item = itemsindex["Sel1_"..g_sel1], value = 1 }
		remote.handle_input(msg)
		g_sel1 = -1
		g_updateall = true
	end

	if(g_sel2 ~= -1) then
		local msg = { time_stamp = event.time_stamp, item = itemsindex["Sel2_"..g_sel2], value = 1 }
		remote.handle_input(msg)
		g_sel2 = -1
		g_updateall = true
	end

	if(g_sel3 ~= -1) then
		local msg = { time_stamp = event.time_stamp, item = itemsindex["Sel3_"..g_sel3], value = 1 }
		remote.handle_input(msg)
		g_sel3 = -1
		g_updateall = true
	end

	if(g_sel4 ~= -1) then
		local msg = { time_stamp = event.time_stamp, item = itemsindex["Sel4_"..g_sel4], value = 1 }
		remote.handle_input(msg)
		g_sel4 = -1
		g_updateall = true
	end

	if(g_enginenumnew ~= nil and g_enginenumnew ~= g_enginenum) then
		g_enginenum = g_enginenumnew
		g_enginenumnew = nil
		local msg = { time_stamp = event.time_stamp, item = itemsindex["EngineSelect"], value = g_enginenum-1 }
		remote.handle_input(msg)
	end

	if(g_effectnumnew ~= nil and g_effectnumnew ~= g_effectnum) then
		g_effectnum = g_effectnumnew
		g_effectnumnew = nil
		local msg = { time_stamp = event.time_stamp, item = itemsindex["EffectSelect"], value = g_effectnum-1 }
		remote.handle_input(msg)
	end

	if(g_editnumnew ~= nil and g_editnumnew ~= remote.get_item_value(itemsindex["EditSelect"])) then
		local msg = { time_stamp = event.time_stamp, item = itemsindex["EditSelect"], value = g_editnumnew }
		g_editnumnew = nil
		remote.handle_input(msg)
	end

	if(g_lfonumnew ~= nil and g_lfonumnew ~= g_lfonum) then
		g_lfonum = g_lfonumnew
		g_lfonumnew = nil
		local msg = { time_stamp = event.time_stamp, item = itemsindex["LFOSelect"], value = g_lfonum-1 }
		remote.handle_input(msg)
	end

	if(g_envnumnew ~= nil and g_envnumnew ~= g_envnum) then
		g_envnum = g_envnumnew
		g_envnumnew = nil
		local msg = { time_stamp = event.time_stamp, item = itemsindex["EnvSelect"], value = g_envnum-1 }
		remote.handle_input(msg)
	end

	local msg_scrollend = remote.match_midi(MIDI_IN_SCROLLEND, event)
	if(msg_scrollend ~= nil) then
		g_scrolling = false
		g_updateall = true
		return true
	end

	if(g_scrolling) then
		for buttonname,buttonmidi in pairs(buttons) do
			local button = remote.match_midi(buttonmidi.." 7f", event)
			if(button ~= nil) then
				return true
			end
			local button = remote.match_midi(buttonmidi.." 00", event)
			if(button ~= nil) then
				if(g_scrolltime + 1000 < remote.get_time_ms()) then
					g_endscroll = true
				end
				return true
			end
		end
	end

	if(g_lightshow > 0) then
		for buttonname,buttonmidi in pairs(buttons) do
			local button = remote.match_midi(buttonmidi.." 7f", event)
			if(button ~= nil) then
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

	if(not g_helpmode and not g_valuemode) then
        	if(g_scopetext == "Kong" and string.match(get_current_page(), "Main")) then
			for button,padnote in pairs(button_to_padnote) do
                		pad = remote.match_midi("<100x>? "..tostring(button).." zz", event)
                		if(pad ~= nil) then
                        		remote.handle_input({ time_stamp = event.time_stamp, item = 1, value = pad.x, note = padnote, velocity = pad.z })
					return true
				end
			end
		end
        	if(string.match(get_current_page(), "Keyboard")) then
			for button,note in pairs(button_to_keynote) do
                		key = remote.match_midi(buttons[button].." zz", event)
                		if(key ~= nil) then
					local velocity = g_kbdvel
					if(key.z == 0) then
						velocity = 0
					end
                        		remote.handle_input({ time_stamp = event.time_stamp, item = 1, value = 1, note = (note+12*g_basekey), velocity = velocity })
					return true
				end
			end
		end
	
        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["Fader "..i])) then
				button = remote.match_midi("90 x"..tostring(i-1).." 7f", event)
				if(button ~= nil) then
					local msg = { time_stamp = event.time_stamp, item = itemsindex["Fader "..i], value = get_item_bvmap("Fader "..i)[button.x+1] }
					remote.handle_input(msg)
					return true
				end
			end
		end
	
        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["BigFader "..i])) then
				button = remote.match_midi("90 x"..tostring(i-1).." 7f", event)
				if(button ~= nil) then
					local msg = { time_stamp = event.time_stamp, item = itemsindex["BigFader "..i], value = get_item_bvmap("BigFader "..i)[button.x+1] }
					remote.handle_input(msg)
					return true
				end
			end
		end
	
        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["Drawbar "..i])) then
				button = remote.match_midi("90 x"..tostring(i-1).." 7f", event)
				if(button ~= nil) then
					local msg = { time_stamp = event.time_stamp, item = itemsindex["Drawbar "..i], value = get_item_bvmap("Drawbar "..i)[button.x+1] }
					remote.handle_input(msg)
					return true
				end
			end
		end
	
        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["Knob H"..i])) then
				button = remote.match_midi("90 "..tostring(i-1).."x 7f", event)
				if(button ~= nil) then
					local oldvalue = remote.get_item_value(itemsindex["Knob H"..i])
					local value = get_item_bvmap("Knob H"..i)[button.x+1]
					if((oldvalue < 64 and button.x+1 == 5) or (oldvalue > 64 and button.x+1 == 4)) then
						value = 64
					end
					local msg = { time_stamp = event.time_stamp, item = itemsindex["Knob H"..i], value = value }
					remote.handle_input(msg)
					return true
				end
			end
		end

        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["Knob V"..i])) then
				button = remote.match_midi("90 x"..tostring(i-1).." 7f", event)
				if(button ~= nil) then
					local oldvalue = remote.get_item_value(itemsindex["Knob V"..i])
					local value = get_item_bvmap("Knob V"..i)[button.x+1]
					if((oldvalue > 64 and button.x+1 == 5) or (oldvalue < 64 and button.x+1 == 4)) then
						value = 64
					end
					local msg = { time_stamp = event.time_stamp, item = itemsindex["Knob V"..i], value = value }
					remote.handle_input(msg)
					return true
				end

				if(get_item_conf_map("Knob V"..i,g_colorscheme, get_current_page()).resetonrel) then
					button = remote.match_midi("90 x"..tostring(i-1).." 00", event)
					if(button ~= nil) then
						local msg = { time_stamp = event.time_stamp, item = itemsindex["Knob V"..i], value = 64 }
						remote.handle_input(msg)
						return true
					end
				end
			end
		end

		for row=1,8 do
			for column=1,8,2 do
				local udhbuttonname = "UDHButton "..row.."-"..column.."_"..row.."-"..tostring(column+1)
				local button_down_name = "Button "..row.."-"..column
				local button_up_name = "Button "..row.."-"..column+1
				if(remote.is_item_enabled(itemsindex[udhbuttonname])) then
					local button_down = remote.match_midi(buttons[button_down_name].." 7f", event)
					if(button_down ~= nil) then
						local value = -1
						local msg = { time_stamp = event.time_stamp, item = itemsindex[udhbuttonname], value = value }
						remote.handle_input(msg)
						return true
					end
					local button_up = remote.match_midi(buttons[button_up_name].." 7f", event)
					if(button_up ~= nil) then
						local value = 1
						local msg = { time_stamp = event.time_stamp, item = itemsindex[udhbuttonname], value = value }
						remote.handle_input(msg)
						return true
					end
				end
			end
		end
	
		for row=1,8,2 do
			for column=1,8 do
				local udvbuttonname = "UDVButton "..row.."-"..column.."_"..tostring(row+1).."-"..column
				local button_up_name = "Button "..row.."-"..column
				local button_down_name = "Button "..tostring(row+1).."-"..column
				if(remote.is_item_enabled(itemsindex[udvbuttonname])) then
					local button_down = remote.match_midi(buttons[button_down_name].." 7f", event)
					if(button_down ~= nil) then
						local value = -1
						if(get_item_conf_map(udvbuttonname, g_colorscheme, get_current_page()).inverted) then
							value = 1
						end
						local msg = { time_stamp = event.time_stamp, item = itemsindex[udvbuttonname], value = value }
						remote.handle_input(msg)
						return true
					end
					local button_up = remote.match_midi(buttons[button_up_name].." 7f", event)
					if(button_up ~= nil) then
						local value = 1
						if(get_item_conf_map(udvbuttonname, g_colorscheme, get_current_page()).inverted) then
							value = -1
						end
						local msg = { time_stamp = event.time_stamp, item = itemsindex[udvbuttonname], value = value }
						remote.handle_input(msg)
						return true
					end
				end
			end
		end
	end
	
	if(g_helpmode) then
		for buttonname,buttonmidi in pairs(buttons) do
			local color
			local button = remote.match_midi(buttonmidi.." 7f", event)

			if(button ~= nil) then
				g_helpmode = false
				g_stopflashing = true
				g_scrollcolor = RED
				local itemname = get_item_by_button(buttonname)

				if(itemname == "Button C1" or itemname == "Button C2") then
					g_scrolltext = g_scopetext
				elseif(itemname == "Button C3" or itemname == "Button C4") then
					g_scrolltext = remote.get_item_text_value(itemsindex["PatchName"])
				elseif(itemname == "Button C7") then
					g_scrolltext = get_current_page()
				elseif(itemname == "Button H") then
					g_scrolltext = get_current_docpage()
				elseif(itemname == "Button C8") then
					g_valuemode = true
					g_startflashing = true
				else
					g_scrolltext = remote.get_item_name(itemsindex[itemname])
				end
				if(g_scrolltext == "") then
					g_scrolltext = get_item_conf_map(itemname, g_colorscheme, get_current_page()).helptext
					if(g_scrolltext == nil) then
						g_scrolltext = "Unknown"
					end
				end
				return true
			end
		end
	end

	if(g_valuemode) then
		for buttonname,buttonmidi in pairs(buttons) do
			local color
			local button = remote.match_midi(buttonmidi.." 7f", event)

			if(button ~= nil) then
				g_valuemode = false
				g_stopflashing = true
				g_scrollcolor = YELLOW
				local itemname = get_item_by_button(buttonname)

				if(itemname == "Button C1" or itemname == "Button C2") then
					g_scrolltext = remote.get_item_text_value(itemsindex["DeviceName"])
				elseif(itemname == "Button C8") then
					return true
				else
					g_scrolltext = tostring(remote.get_item_value(itemsindex[itemname]))
				end

				if(g_scrolltext == "") then
					g_scrolltext = "Unknown"
				end
				return true
			end
		end
	end

	if(string.match(get_current_page(), "Internal")) then
		local button_brightnessup = remote.match_midi(buttons["Button 7-8"].." 7f", event)
		local button_brightnessdown = remote.match_midi(buttons["Button 8-8"].." 7f", event)
		if(button_brightnessup ~= nil) then
			if(g_brightness_new < 5) then
				g_brightness_new = g_brightness_new+1
			end
			return true
		elseif(button_brightnessdown ~= nil) then
			if(g_brightness_new > 1) then
				g_brightness_new = g_brightness_new-1
			end
			return true
		end
		local button_lightshow1 = remote.match_midi(buttons["Button 1-6"].." 7f", event)
		if(button_lightshow1 ~= nil) then
			g_lightshow = 1
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			return true
		end
		local button_lightshow2 = remote.match_midi(buttons["Button 1-7"].." 7f", event)
		if(button_lightshow2 ~= nil) then
			g_lightshow = 2
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			return true
		end
		local button_lightshow3 = remote.match_midi(buttons["Button 1-8"].." 7f", event)
		if(button_lightshow3 ~= nil) then
			g_lightshow = 3
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			return true
		end
		local button_lightshow4 = remote.match_midi(buttons["Button 2-8"].." 7f", event)
		if(button_lightshow4 ~= nil) then
			g_lightshow = 4
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			g_lightshowloop = 1
			return true
		end
	end

	local button_helpmode = remote.match_midi(buttons["Button C8"].." 7f", event)
	if(button_helpmode ~= nil) then
		g_helpmode = true
		g_startflashing = true
		return true
	end

	if(g_helpmode or g_valuemode) then
		return true
	end

	return false
end

function remote_probe(manufacturer,model,prober)
	local controlRequest="F0 7E 7F 06 01 F7"
	local controlResponse="F0 7E 00 06 02 00 20 29 36 00 ?? ?? ?? ?? ?? ??  F7"

	return {
                request=controlRequest,
                response=controlResponse
        }
end
