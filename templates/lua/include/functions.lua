function get_item_bvmap(itemname)
	local itemtype = string.match(itemname, "(.+%w)%s*%d")

	local currentpage = get_current_page()
	local scope = g_colorscheme

	local itemtype = get_item_conf_map_field(scope, currentpage, itemname, "bvmap")

	if(item_bvmap[itemtype] == nil) then
		itemtype = "Default"
	end

	return(item_bvmap[itemtype])
end

function get_item_conf_map_field(context, page, itemname, field)
	local defaultitemname = string.gsub(itemname, " .+", " *")

	if(field == nil) then
		error("Field is nil")
	end

	if(string.match(get_current_page(), "Internal")) then
		context = "Default"
	end
	
	if(item_conf_map[context] == nil) then
		context = "Default"
	end

	if(string.match(itemname, "Button [A-H]$")) then
		page = get_current_docpage()
		context = "Default"
	end

	local subpage = get_current_subpage()

	local field_value = check_all_conf_map(context, page, subpage, itemname, field)
	if(field_value == nil) then
		field_value = check_all_conf_map(context, page, subpage, defaultitemname, field)
	end
	if(field_value == nil and subpage ~= "Unknown") then
		field_value = check_all_conf_map(context, page, "Unknown", itemname, field)
		if(field_value == nil) then
			field_value = check_all_conf_map(context, page, "Unknown", defaultitemname, field)
		end
	end

	return(field_value)
end

function check_all_conf_map(context, page, subpage, itemname, field)
	local field_value = check_item_conf_map(context, page, subpage, itemname, field)
	if(field_value == nil) then
		field_value = check_item_conf_map(context, "Default", subpage, itemname, field)
	end
	if(field_value == nil) then
		field_value = check_item_conf_map("Default", page, subpage, itemname, field)
	end
	if(field_value == nil) then
		field_value = check_item_conf_map("Default", "Default", subpage, itemname, field)
	end

	return(field_value)
end

function check_item_conf_map(context, page, subpage, itemname, field)
	if(subpage ~= "Unknown") then
		if(item_conf_map[context] and item_conf_map[context][page] and item_conf_map[context][page][subpage] and item_conf_map[context][page][subpage][itemname] and item_conf_map[context][page][subpage][itemname][field]) then
			return(item_conf_map[context][page][subpage][itemname][field])
		end
	else
		if(item_conf_map[context] and item_conf_map[context][page] and item_conf_map[context][page][itemname] and item_conf_map[context][page][itemname][field]) then
			return(item_conf_map[context][page][itemname][field])
		end
	end
	return(nil)
end

function get_button_color(context, itemname, buttonname, value)
	local color
	local buttonindex = 0
	local buttonvalue = 0

	local enabled = remote.is_item_enabled(itemsindex[itemname])
	local value = remote.get_item_state(itemsindex[itemname]).value

	-- Colors
	local activecolor = get_item_conf_map_field(context, get_current_page(), itemname, "activecolor")
	local enabledcolor = get_item_conf_map_field(context, get_current_page(), itemname, "enabledcolor")
	local disabledcolor = get_item_conf_map_field(context, get_current_page(), itemname, "disabledcolor")
	local dactivecolor = get_item_conf_map_field(context, get_current_page(), itemname, "dactivecolor")
	local denabledcolor = get_item_conf_map_field(context, get_current_page(), itemname, "denabledcolor")
	local maxcolor = get_item_conf_map_field(context, get_current_page(), itemname, "maxcolor")
	--Config
	local defaultvalue = get_item_conf_map_field(context, get_current_page(), itemname, "defaultvalue")

	local citem_conf_map_template = color_templates[get_item_conf_map_field(context, get_current_page(), itemname, "template")]

	if(citem_conf_map_template ~= nil) then
		if(citem_conf_map_template.activecolor ~= nil) then
			activecolor = citem_conf_map_template.activecolor
		end
		if(citem_conf_map_template.enabledcolor ~= nil) then
			enabledcolor = citem_conf_map_template.enabledcolor
		end
		if(citem_conf_map_template.disabledcolor ~= nil) then
			disabledcolor = citem_conf_map_template.disabledcolor
		end
		if(citem_conf_map_template.dactivecolor ~= nil) then
			dactivecolor = citem_conf_map_template.dactivecolor
		end
		if(citem_conf_map_template.denabledcolor ~= nil) then
			denabledcolor = citem_conf_map_template.denabledcolor
		end
		if(citem_conf_map_template.maxcolor ~= nil) then
			maxcolor = citem_conf_map_template.maxcolor
		end
		if(citem_conf_map_template.defaultvalue ~= nil) then
			defaultvalue = citem_conf_map_template.defaultvalue
		end
	end

	if(activecolor == nil) then
		error(string.format("activecolor is nil, device: %s page: %s item: %s", context, get_current_page(), itemname))
	end

	if(denabledcolor == nil) then
		denabledcolor = enabledcolor
	end
	if(dactivecolor == nil) then
		dactivecolor = activecolor
	end

	local value = remote.get_item_value(itemsindex[itemname])
	local textvalue = tonumber(remote.get_item_text_value(itemsindex[itemname]))
	local text = remote.get_item_text_value(itemsindex[itemname])

	{% import "devicelist.j2" as d %}
	{% for device in d.devices %}
	{% include "devices/" + device.type + "/" + device.name + "/hooks/get_button_color.lua" ignore missing %}
	{% endfor %}

	if(string.find(itemname, "UDHButton %d%-%d_%d%-%d") or string.find(itemname, "UDVButton %d%-%d_%d%-%d")) then
		if(enabled) then
			if(g_buttondown[buttonname] ~= nil) then
				color = activecolor
			else
				color = enabledcolor
			end
		else
			color = disabledcolor
		end
	elseif(string.find(itemname, "Button %d%-%d") or string.find(itemname, "Button C%d") or string.find(itemname, "Button %a")) then
		if(enabled) then
			if(value == 1) then
				color = activecolor
			else
				color = enabledcolor
			end
		else
			color = disabledcolor
		end
	else
		if(string.find(itemname, "Drawbar %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "Meter %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "BigFader %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "MFader %d%-%d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex%2+1]
		elseif(string.find(itemname, "Fader %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "Knob V%d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "Knob H%d")) then
			buttonindex = 9-tonumber(string.sub(buttonname, -1,-1))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		end

		if(string.find(itemname, "MFader %d%-%d")) then	
			prevbuttonvalue = 0
			if((buttonindex%2) == 1) then
				prevbuttonvalue = get_item_bvmap(itemname)[(buttonindex+1)%2+1] 
			end
				
			if(value >= buttonvalue) then
				color = activecolor
			elseif(value > prevbuttonvalue) then
				color = dim_color(enabledcolor, activecolor, (value - prevbuttonvalue)/(buttonvalue - prevbuttonvalue))
			else 
				color = enabledcolor
			end
		elseif((string.find(itemname, "Fader %d")) or (string.find(itemname, "BigFader %d")) or (string.find(itemname, "Meter %d"))) then	
			nextbuttonvalue = 0
			if(buttonindex ~= 8) then
				nextbuttonvalue = get_item_bvmap(itemname)[buttonindex+1] 
			end
				
			if(value >= buttonvalue) then
				if(string.find(itemname, "Meter %d") and buttonindex == 0) then
					color = maxcolor
				else 
					if((string.find(itemname, "BigFader %d") or string.find(itemname, "Fader %d")) and buttonvalue == defaultvalue) then
						color = dactivecolor
					else
						color = activecolor
					end
				end
			elseif((value > nextbuttonvalue) and (value < buttonvalue)) then
				color = dim_color(enabledcolor, activecolor, (value - nextbuttonvalue)/(buttonvalue - nextbuttonvalue))
			else 
				if((string.find(itemname, "BigFader %d") or string.find(itemname, "Fader %d")) and buttonvalue == defaultvalue) then
					color = denabledcolor
				else
					color = enabledcolor
				end
			end
		elseif(string.find(itemname, "Knob H%d") or string.find(itemname, "Knob V%d")) then
			if(value > 64) then
				if(buttonindex <= 4) then
					nextbuttonvalue = 127
					if(buttonindex < 8) then
						nextbuttonvalue = get_item_bvmap(itemname)[buttonindex+1] 
					end

					if(value >= buttonvalue) then
						color = activecolor
					elseif((value > nextbuttonvalue) and (value < buttonvalue)) then
						color = dim_color(enabledcolor, activecolor, (value - nextbuttonvalue)/(buttonvalue - nextbuttonvalue))
					else 
						color = enabledcolor
					end
				else
					color = enabledcolor
				end
			elseif(value < 64) then
				if(buttonindex >= 5) then
					prevbuttonvalue = 0
					if(buttonindex ~= 0) then
						prevbuttonvalue = get_item_bvmap(itemname)[buttonindex-1] 
					end

					if(value <= buttonvalue) then
						color = activecolor
					elseif((value < prevbuttonvalue) and (value > buttonvalue)) then
						color = dim_color(enabledcolor, activecolor, (prevbuttonvalue - value)/(prevbuttonvalue - buttonvalue))
					else 
						color = enabledcolor
					end
				else
					color = enabledcolor
				end
			else
				if(buttonindex == 4 or buttonindex == 5) then
					color = activecolor
				else
					color = enabledcolor
				end
			end
		else
			prevbuttonvalue = 0
			if(buttonindex ~= 0) then
				prevbuttonvalue = get_item_bvmap(itemname)[buttonindex-1] 
			end
				
			if(value >= buttonvalue) then
				color = activecolor
			elseif((value > prevbuttonvalue) and (value < buttonvalue)) then
				color = dim_color(enabledcolor, activecolor, (value - prevbuttonvalue)/(buttonvalue - prevbuttonvalue))
			else 
				color = enabledcolor
			end
		end
	end

	return color
end

function get_item_by_button(buttonname) 
	for i=1,8 do
		local fadername = "Fader "..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button %d%-"..tostring(i))) then
				return fadername
			end
		end
	end
	for i=1,8 do
		local fadername = "BigFader "..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button %d%-"..tostring(i))) then
				return fadername
			end
		end
	end
	for i=1,8 do
		local fadername = "Drawbar "..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button %d%-"..tostring(i))) then
				return fadername
			end
		end
	end
	for i=1,8 do
		local fadername = "Meter "..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button %d%-"..tostring(i))) then
				return fadername
			end
		end
	end
	for i=1,8 do
		local fadername = "Knob H"..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button "..tostring(i).."%-%d")) then
				return fadername
			end
		end
	end
for i=1,8 do
		local fadername = "Knob V"..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button %d%-"..tostring(i))) then
				return fadername
			end
		end
	end
	for row=1,8 do
		for column=1,8,2 do
			local udhbuttonname = "UDHButton "..row.."-"..column.."_"..row.."-"..tostring(column+1)
			if(remote.is_item_enabled(itemsindex[udhbuttonname])) then
				if(string.find(buttonname, "Button "..row.."%-"..column)) then
					return udhbuttonname
				elseif(string.find(buttonname, "Button "..row.."%-"..tostring(column+1))) then
					return udhbuttonname
				end
			end
		end
	end
	for row=1,8,2 do
		for column=1,8 do
			local udvbuttonname = "UDVButton "..row.."-"..column.."_"..tostring(row+1).."-"..column
			if(remote.is_item_enabled(itemsindex[udvbuttonname])) then
				if(string.find(buttonname, "Button "..row.."%-"..column)) then
					return udvbuttonname
				elseif(string.find(buttonname, "Button "..tostring(row+1).."%-"..column)) then
					return udvbuttonname
				end
			end
		end
	end
	for row=1,8,2 do
		for column=1,8 do
			local mfadername = "MFader "..row.."-"..column
			if(remote.is_item_enabled(itemsindex[mfadername])) then
				if(string.find(buttonname, "Button "..row.."%-"..column)) then
					return mfadername
				elseif(string.find(buttonname, "Button "..tostring(row+1).."%-"..column)) then
					return mfadername
				end
			end
		end
	end
	return buttonname
end

function get_current_page()
	local pagename = "Unknown"

	if(remote.is_item_enabled(itemsindex["PageName"])) then
		pagename = remote.get_item_text_value(itemsindex["PageName"])
	end

	return pagename
end

function get_current_kbdpage()
	local kbdpagename = "Unknown"

	if(remote.is_item_enabled(itemsindex["KbdPageName"])) then
		kbdpagename = remote.get_item_text_value(itemsindex["KbdPageName"])
	end

	return kbdpagename
end

function get_current_subpage()
	local subpagename = "Unknown"

	if(get_current_page() == "Keyboard") then
		return(get_current_kbdpage())
	end

	if(remote.is_item_enabled(itemsindex["SubPageName"])) then
		subpagename = remote.get_item_text_value(itemsindex["SubPageName"])
	end

	return subpagename
end

function get_current_docpage()
	local pagename = "Unknown"

	if(remote.is_item_enabled(itemsindex["DocPageName"])) then
		pagename = remote.get_item_text_value(itemsindex["DocPageName"])
	end

	return pagename
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

function get_button_name(button)
	x = button.x
	if(button.x == 0xa0) then
		x = 0x90
	end
	local midistring = string.format("%02x %02x", x, button.y)
	buttonname =midi_to_button[midistring]
	if(buttonname == nil) then
		error("No button found for midistring: "..midistring)
	end
	return(buttonname)
end

function get_knob_type(itemname)
	return(string.match(itemname, ".+ (.).+"))
end

function get_item_type(itemname)
	return(string.match(itemname, "(.+) .+"))
end

function get_button_row(buttonname)
	return(tonumber(string.match(buttonname, "Button (%d)%-%d")))
end

function get_button_col(buttonname)
	return(tonumber(string.match(buttonname, "Button %d%-(%d)")))
end

function is_up_udupbutton(buttonname, itemname)
	local upbutton

	udtype,first,second = string.match(itemname, "UD(.)Button (...)_(...)")

	if(udtype == 'V') then
		if(get_item_conf_map_field(g_colorscheme, get_current_page(), itemname, "inverted")) then
			upbutton = second
		else
			upbutton = first
		end
	else
		if(get_item_conf_map_field(g_colorscheme, get_current_page(), itemname, "inverted")) then
			upbutton = first
		else
			upbutton = second
		end
	end

	return(buttonname == "Button "..upbutton)
end

function is_up_mfader(buttonname, itemname)
	local mfader
	first = string.match(itemname, "MFader (...)")
	return(buttonname == "Button "..first)
end
