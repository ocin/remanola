function handle_input_sel(event)
	for selnum=1,g_selcount do
		if(g_sel[selnum] ~= nil) then
			local msg = { time_stamp = event.time_stamp, item = itemsindex["Sel"..selnum.."_"..g_sel[selnum]], value = 1 }
			remote.handle_input(msg)
			g_sel[selnum] = nil
			g_updateall = true
		end
	end
end

function handle_input_mfader(event)
	local updatetime = remote.get_time_ms()
	local timediff = updatetime - g_mfaderlastupdate
	for buttonname, velocity in pairs(g_mfaderbuttons) do
		if(velocity > 0) then
			local itemname = get_item_by_button(buttonname)
			local maxvalue = get_item_bvmap(itemname)[2]
			-- This is number of seconds to go from 0 to 127 at minimum velocity
			local divider=100
			local change = (velocity*timediff*maxvalue)/(divider*1000)
			local value
			if(change < 1) then
				return
			end
			local cvalue = remote.get_item_value(itemsindex[itemname])
			if(velocity >= 0x7f) then
				if(is_up_mfader(buttonname, itemname)) then
					value = maxvalue
				else
					value = 0
				end
			elseif(is_up_mfader(buttonname, itemname)) then
				value = cvalue + change
			else
				value = cvalue - change
			end
			if(value > maxvalue) then
				value = maxvalue
			elseif(value < 0) then
				value = 0
			end
			if(value == maxvalue or value == 0) then
				g_mfaderlastupdate = nil
				g_mfaderbuttons[buttonname] = nil
			end
			local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
			remote.handle_input(msg)
		end
	end
	g_mfaderlastupdate = updatetime
end

function handle_input_repeatud(event)
	local updatetime = remote.get_time_ms()
	local timediff = updatetime - g_repeatudlastupdate

	local firstwait = 500 -- 1s
	local wait = 200 -- 0.2s/step after 0.5
	local finalwait = 5 -- 0.01s/step after 0.2*10 + 0.5 = 2.5s

	for buttonname, count in pairs(g_repeatudbuttons) do
		if((count == 1 and timediff > firstwait) or (count > 1 and timediff > wait) or (count > 8 and timediff > finalwait)) then
			g_repeatudbuttons[buttonname] = count + 1
			local itemname = get_item_by_button(buttonname)
			local value
			if(is_up_udupbutton(buttonname, itemname)) then
				value = 1
			else
				value = -1
			end
			local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
			remote.handle_input(msg)
			g_repeatudlastupdate = updatetime
		end
	end
end

function handle_input_velofader(event)
	local updatetime = remote.get_time_ms()
	local timediff = updatetime - g_velofaderlastupdate
	for buttonname, velocity in pairs(g_velofaderbuttons) do
		if(velocity > 0) then
			local itemname = get_item_by_button(buttonname)
			local row = get_button_row(buttonname)
			local col = get_button_col(buttonname)
			local targetvalue = get_item_bvmap(itemname)[row]
			local maxvalue = get_item_bvmap(itemname)[1]
			local value = 0
			if(string.find(itemname, "Knob H%d")) then
				targetvalue = get_item_bvmap(itemname)[9-col]
			end
			if(string.find(itemname, "Drawbar %d")) then
				targetvalue = get_item_bvmap(itemname)[9-row]
			end
			local cvalue = remote.get_item_value(itemsindex[itemname])
			-- This is number of seconds to go from 0 to 127 at minimum velocity
			local divider=100
			local change = (velocity*timediff*maxvalue)/(divider*1000)
			if(change < 1) then
				return
			end
			if(velocity >= 0x7f) then
				value = targetvalue
				g_velofaderbuttons[buttonname] = nil
			elseif(cvalue < targetvalue) then
				value = cvalue + change
				if(value >= targetvalue) then
					value = targetvalue
					g_velofaderbuttons[buttonname] = nil
				end
			elseif(cvalue > targetvalue) then
				value = cvalue - change
				if(value <= targetvalue) then
					value = targetvalue
					g_velofaderbuttons[buttonname] = nil
				end
			end
			if(cvalue == targetvalue) then
				value = cvalue
			end
			local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
			remote.handle_input(msg)
		end
	end
	g_velofaderlastupdate = updatetime
end

function handle_input_select(event)
	for itemname,value in pairs(g_select) do
		local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
		remote.handle_input(msg)
		g_select[itemname] = nil
	end
end

function handle_input_scrollend(event)
	local msg_scrollend = remote.match_midi(MIDI_IN_SCROLLEND, event)
	if(msg_scrollend ~= nil) then
		g_scrolling = false
		g_updateall = true
		return true
	end
end

function handle_input_devices(event, button)
	{% import "devicelist.j2" as d %}
	{% for device in d.devices %}
	{% include "devices/" + device.type + "/" + device.name + "/hooks/handle_input_devices.lua" ignore missing %}
	{% endfor %}
end

function handle_input_keyboard_at(event, button)
	local velocity = get_veloctity(button.z)
	if(get_current_page() == "Keyboard" and get_current_kbdpage() == "Kbd") then
		local buttonname = get_button_name(button)
		local keynote = button_to_keynote[buttonname]
		if(keynote ~= nil) then
			remote.handle_input({ time_stamp = event.time_stamp, item = itemsindex['Aftertouch'], value = velocity })
			return true
		end
	end
end

function handle_input_keyboard(event, button)
	local velocity = get_veloctity(button.z)
	if(get_current_page() == "Keyboard" and get_current_kbdpage() == "Kbd") then
		local buttonname = get_button_name(button)
		local keynote = button_to_keynote[buttonname]
		if(keynote ~= nil) then
			remote.handle_input({ time_stamp = event.time_stamp, item = 1, value = 1, note = (keynote+12*g_basekey), velocity = velocity })
			return true
		end
	elseif(get_current_page() == "Keyboard" and get_current_kbdpage() == "Drum") then
		local buttonname = get_button_name(button)
		local padnote = button_to_fullpadnote[buttonname]
		if(padnote ~= nil) then
			remote.handle_input({ time_stamp = event.time_stamp, item = 1, value = 1, note = padnote, velocity = velocity })
			return true
		end
	end
end

function handle_input_item(event, button)
	local buttonname = get_button_name(button)
	local row = get_button_row(buttonname)
	local col = get_button_col(buttonname)
	local itemname = get_item_by_button(buttonname)
	if(button.z > 0) then
		g_buttondown[buttonname] = button.z
		if(buttonname ~= itemname) then
			local itemtype = get_item_type(itemname)
			if(itemtype == "Fader" or itemtype == "BigFader" or itemtype == "Drawbar") then
				if(fader_already_down(buttonname) ~= nil) then
					local value
					local defaultvalue = get_item_conf_map_field(g_colorscheme, get_current_page(), itemname, "defaultvalue")
					g_buttondown[buttonname] = nil
					g_buttondown[fader_get_otherbutton(buttonname)] = nil
					g_velofaderbuttons[buttonname] = nil
					g_velofaderbuttons[fader_get_otherbutton(buttonname)] = nil
					if(defaultvalue ~= nil) then
						value = defaultvalue
					else
						value = 64
					end
					local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
					remote.handle_input(msg)
				else
					if(fader_nearby_down(buttonname) ~= nil) then
						local value = get_item_bvmap(itemname)[row]
						if(string.find(itemname, "Drawbar %d")) then
							value = get_item_bvmap(itemname)[9-row]
						end
						local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
						remote.handle_input(msg)
					else
						g_velofaderbuttons[buttonname] = button.z
					end
				end
				return(true)
			elseif(itemtype == "Knob") then
				local oldvalue = remote.get_item_value(itemsindex[itemname])
				local value

				if(string.find(itemname, "Knob H%d")) then
					if((oldvalue > 64 and col == 4) or (oldvalue < 64 and col == 5)) then
						value = 64
						local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
						remote.handle_input(msg)
						return(true)
					end
				else
					if((oldvalue > 64 and row == 5) or (oldvalue < 64 and row == 4)) then
						value = 64
						local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
						remote.handle_input(msg)
						return(true)
					end
				end
				if(fader_nearby_down(buttonname) ~= nil) then
					value = get_item_bvmap(itemname)[row]
					local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
					remote.handle_input(msg)
				else
					g_velofaderbuttons[buttonname] = button.z
				end
				return(true)
			elseif(itemtype == "UDVButton" or itemtype == "UDHButton") then
				local value
				local defaultvalue = get_item_conf_map_field(g_colorscheme, get_current_page(), itemname, "defaultvalue")
				if(ud_already_down(buttonname, itemname) and defaultvalue ~= -1) then
					g_repeatudbuttons[buttonname] = nil
					g_repeatudbuttons[ud_get_otherbutton(buttonname, itemname)] = nil
					if(defaultvalue ~= nil) then
						value = defaultvalue
					else
						value = 64
					end
					if(defaultvalue ~= -1) then
						local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = -127 }
						remote.handle_input(msg)
						msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
						remote.handle_input(msg)
					end
					return(true)
				else
					g_repeatudbuttons[buttonname] = 1
					g_repeatudlastupdate = remote.get_time_ms()
					if(is_up_udupbutton(buttonname, itemname)) then
						value = 1
					else
						value = -1
					end
				end
				local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
				remote.handle_input(msg)
				return(true)
			elseif(itemtype == "MFader") then
				if(mfader_already_down(buttonname, itemname)) then
					local value
					local defaultvalue = get_item_conf_map_field(g_colorscheme, get_current_page(), itemname, "defaultvalue")
					g_buttondown[buttonname] = nil
					g_buttondown[mfader_get_otherbutton(buttonname, itemname)] = nil
					g_mfaderbuttons[buttonname] = nil
					g_mfaderbuttons[mfader_get_otherbutton(buttonname, itemname)] = nil
					if(defaultvalue ~= nil) then
						value = defaultvalue
					else
						value = 64
					end
					local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = value }
					remote.handle_input(msg)
				else
					g_mfaderbuttons[buttonname] = button.z
				end
			end
		end
	else
		g_buttondown[buttonname] = nil
		g_velofaderbuttons[buttonname] = nil
		g_mfaderbuttons[buttonname] = nil
		g_repeatudbuttons[buttonname] = nil
		g_updateall = true
		local itemtype = get_item_type(itemname)
		if(itemtype == "Knob") then
			if(get_item_conf_map_field(g_colorscheme, get_current_page(), itemname, "resetonrel")) then
				local msg = { time_stamp = event.time_stamp, item = itemsindex[itemname], value = 64 }
				remote.handle_input(msg)
				return true
			end
		end
	end
end

function handle_input_aftertouch(button)
	local buttonname = get_button_name(button)
	local itemname = get_item_by_button(buttonname)

	if(buttonname ~= itemname) then
		local itemtype = get_item_type(itemname)
		if(itemtype == "Fader" or itemtype == "BigFader" or itemtype == "Drawbar" or itemtype == "Knob") then
			if(g_buttondown[buttonname] ~= nil) then
				if(button.z > 0) then
					for bn, v in pairs(g_velofaderbuttons) do
						if(v ~= nil and buttonname == bn) then
							g_velofaderbuttons[buttonname] = button.z
						end
					end
				end
			end
			return(true)
		end
		if(itemtype == "MFader") then
			if(g_buttondown[buttonname] ~= nil) then
				if(button.z > 0) then
					for bn, v in pairs(g_mfaderbuttons) do
						if(v ~= nil and buttonname == bn) then
							g_mfaderbuttons[buttonname] = button.z
						end
					end
				end
			end
			return(true)
		end
	end
end

function handle_input_helpmode(button)
	if(button.z == 0) then
		g_helpmode = false
		g_stopflashing = true
		g_scrollcolor = S_RED
		g_updateall = true
		local buttonname = get_button_name(button)
		local itemname = get_item_by_button(buttonname)

		if(itemname == "Button C1" or itemname == "Button C2") then
			g_scrolltext = g_scopetext
		elseif(itemname == "Button C3" or itemname == "Button C4") then
			g_scrolltext = remote.get_item_text_value(itemsindex["PatchName"])
		elseif(itemname == "Button C7") then
			g_scrolltext = "Page: "..get_current_page()
		-- elseif(itemname == "Button D8") then
			-- g_scrolltext = get_current_docpage()
		elseif(itemname == "Button C8") then
			g_valuemode = true
			g_startflashing = true
		else
			g_scrolltext = remote.get_item_name(itemsindex[itemname])
		end
		if(g_scrolltext == "") then
			g_scrolltext = get_item_conf_map_field(g_colorscheme, get_current_page(), itemname, "helptext")
			if(g_scrolltext == nil) then
				g_scrolltext = "Unknown: "..itemname
			end
		end
		return true
	end
end

function handle_input_valuemode(button)
	if(button.z == 0) then
		g_valuemode = false
		g_stopflashing = true
		g_scrollcolor = S_YELLOW
		g_updateall = true
		local buttonname = get_button_name(button)
		local itemname = get_item_by_button(buttonname)
		if(itemname == "Button C1" or itemname == "Button C2") then
			g_scrolltext = remote.get_item_text_value(itemsindex["DeviceName"])
		elseif(itemname == "Button C7") then
			g_scrolltext = "SubPage: "..get_current_subpage()
		elseif(itemname == "Button C8") then
			return true
		else
			local value = tostring(remote.get_item_value(itemsindex[itemname]))
			local textvalue = remote.get_item_text_value(itemsindex[itemname])
			g_scrolltext = value..", "..textvalue
		end
		if(g_scrolltext == "") then
			g_scrolltext = "Unknown"
		end
		return true
	end
end

function handle_input_starthelpmode(button)
	local buttonname = get_button_name(button)
	if(buttonname == 'Button C8') then
		g_helpmode = true
		g_startflashing = true
		g_updateall = true
		return true
	end
end

function handle_input_setveltomax(event, button)
	-- Change all remaining button input to velocity 127
	if(button.z > 0 ) then
		local midi = string.format("%02x %02x", button.x, button.y)
		local item = itemsindex[midi_to_button[midi]]
		local msg = { time_stamp = event.time_stamp, item = item, value = 1, velocity = 127 }
		remote.handle_input(msg)
		return true
	end
end
