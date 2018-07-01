function remote_init()
	for buttonname,buttonmidi in pairs(buttons) do
		table.insert(items, {name = buttonname, input = "button", output="value", modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}})
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

	for button,midi in pairs(buttons) do
		midi_to_button[midi] = button
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
	if(lptype == 'pro') then
		table.insert(ret_events, remote.make_midi(MIDI_OUT_PRO_PROGLAYOUT))
		table.insert(ret_events, remote.make_midi("f0 00 20 29 02 10 2b 00 00 05 46 f7"))
	else
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0,DBUPDATE1,DBCOPY))))
	end

	return ret_events;
end

function remote_set_state(changed_items)
	for i,citemindex in ipairs(changed_items)do
		local citemname = items[citemindex].name

		g_updateall = true

		if(citemname ~= nil) then
			for s=1,g_selcount do
				if(remote.get_item_mode(citemindex) == itemsmodeindex[citemname]["SEL"..s]) then
					g_sel[s] = tonumber(remote.get_item_value(citemindex))
				end
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
						g_playingbutton = "Button "..tostring(crow).."-"..tostring(crowstep)
						g_updateall = true
					else
						g_playingbutton = "Other page"	
					end
				elseif(g_scopetext == "Thor") then
               				local playingstep = tonumber(remote.get_item_text_value(itemsindex["PlayingStep"]))
					local crowstep = (playingstep)%8+1
					local crow = math.floor((playingstep)/8)+1

					g_playingbutton = "Button "..tostring(crow).."-"..tostring(crowstep)
					g_updateall = true
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

	if(g_stopflashing) then
		g_stopflashing = false
		g_flashing = false
		g_updateall = true
	end

	if(g_lightshow == 0 and not g_flashing) then
		if(g_updateall) then
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
			local sidecolor = get_rgb_midi(get_button_color(g_colorscheme, "Side LED", "Side LED"))
			if(g_helpmode) then
				sidecolor = get_rgb_midi(RED)
			elseif(g_valuemode) then
				sidecolor = get_rgb_midi(YELLOW)
			end
			table.insert(ret_events, remote.make_midi(string.format("f0 00 20 29 02 10 0b 63 %s f7", sidecolor)))
			g_updateall = false
		end
	end

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

	if(g_brightness ~= g_brightness_new) then
		g_brightness = g_brightness_new
		table.insert(ret_events, remote.make_midi(MIDI_OUT_BRIGHTNESS.." "..brightness[g_brightness]))
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

--	if(get_current_docpage() == "Transport") then
--		if(remote.get_item_value(itemsindex["Button D1"]) > 0) then
--			if(g_startbar) then
--				g_barupdatetime = remote.get_time_ms()
--				g_startbar = false	
--				g_barupdate = true
--				table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(RED, COPY))))
--			elseif(g_startbeat) then
--				g_beatupdatetime = remote.get_time_ms()
--				g_startbeat = false	
--				g_beatupdate = true
--				table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(WAMBER, COPY))))
--			end
--		
--			if(g_barupdate) then
--				if(g_barupdatetime + 200 < remote.get_time_ms()) then
--					g_barupdate = false
--					table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(GREEN, COPY))))
--				end
--			elseif(g_beatupdate) then
--				if(g_beatupdatetime + 200 < remote.get_time_ms()) then
--					g_beatupdate = false
--					table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button D1"], bit.bor(GREEN, COPY))))
--				end
--			end
--		else
--			g_startbar = false
--			g_startbeat = false
--			g_barupdate = false
--			g_beatupdate = false
--		end
--	else
--		g_startbar = false
--		g_startbeat = false
--		g_barupdate = false
--		g_beatupdate = false
--	end

	-- If sel* is updated trigger midi event by sending get version sysex
	for s=1,g_selcount do
		if(g_sel[s] ~= nil) then
			table.insert(ret_events, remote.make_midi(MIDI_OUT_GETVERSION))
		end
	end

	return ret_events
end

function remote_process_midi(event)
        local pad = "none"
        local pad_note = 0
        local pad_item = 0

	for s=1,g_selcount do
		handle_input_sel(event,s)
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
		g_editnumnew = nil
		local msg = { time_stamp = event.time_stamp, item = itemsindex["EditSelect"], value = g_editnumnew }
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

	if(g_lightshow > 0) then
		if(handle_input_lightshow(event)) then
			return(true)
		end
	end

	local button = remote.match_midi("xx yy zz", event)

	if(not g_helpmode and not g_valuemode and button ~= nil and (button.x == 0x90 or button.x == 0xb0)) then
		if(handle_input_kong(event, button)) then
			return(true)
		end

		if(handle_input_keyboard(event, button)) then
			return(true)
		end

		if(handle_input_item(event, button)) then
			return(true)
		end
	end
	
	if(g_helpmode and (button.x == 0x90 or button.x == 0xb0)) then
		if(handle_input_helpmode(event, button)) then
			return(true)
		end
	end

	if(g_valuemode and (button.x == 0x90 or button.x == 0xb0)) then
		if(handle_input_valuemodet(event, button)) then
			return(true)
		end
	end

	if(string.match(get_current_page(), "Internal")) then
		if(handle_input_internalpage(event, button)) then
			return(true)
		end
	end

	local button_helpmode = remote.match_midi(buttons["Button C8"].." 00", event)
	if(button_helpmode ~= nil) then
		g_helpmode = true
		g_startflashing = true
		g_updateall = true
		return true
	end

	if(g_helpmode or g_valuemode) then
		return true
	end

	-- Change all remaining button input to velocity 127
	button = remote.match_midi("90 xx zz", event)
	if(button ~= nil and button.z > 0) then
		local midi = string.format("90 %02x", button.x)
		local item = itemsindex[midi_to_button[midi]]
		local msg = { time_stamp = event.time_stamp, item = item, value = 1, velocity = 127 }
		remote.handle_input(msg)
		return true
	end

	return false
end

function remote_probe(manufacturer,model,prober)
	local controlRequest="F0 7E 7F 06 01 F7"
	local controlResponse=string.format("F0 7E 00 06 02 00 20 29 %x 00 ?? ?? ?? ?? ?? ??  F7", DEVICE_ID)

	return {
                request=controlRequest,
                response=controlResponse
        }
end
