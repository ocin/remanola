function get_item_bvmap(itemname)
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

function get_button_color(context, itemname, buttonname)
	local color
	local buttonindex = 0
	local buttonvalue = 0

	local enabled = remote.is_item_enabled(itemsindex[itemname])

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

	{% import "devicelist.j2" as d %}
	{% for device in d.devices %}
	{% include "devices/" + device.type + "/" + device.name + "/hooks/get_button_color.lua" ignore missing %}
	{% endfor %}

	if(string.find(itemname, "ARadioButton")) then
		local abuttonnum = tonumber(string.sub(buttonname, -1,-1))
		if(get_item_conf_map_field(g_colorscheme, get_current_page(), itemname, "inverted")) then
			abuttonnum = tonumber(string.match(itemname, "ARadioButton(%d)"))-abuttonnum+1
		end
		if(abuttonnum-1 == value) then
			color = activecolor
		else
			color = enabledcolor
		end
	elseif(string.find(itemname, "EFSButton")) then
		buttonindex = tonumber(string.sub(buttonname, -3,-3))
		if(enabled) then
			if(buttonindex == 3-value) then
				color = efsactive[buttonindex]
			else
				color = efsinactive[buttonindex]
			end
		end
	elseif(string.find(itemname, "UDHButton %d%-%d_%d%-%d") or string.find(itemname, "UDVButton %d%-%d_%d%-%d")) then
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
			buttonindex = 9-tonumber(string.sub(buttonname, -3,-3))
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
			local prevbuttonvalue = 0
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
		elseif((string.find(itemname, "Fader %d")) or (string.find(itemname, "BigFader %d")) or (string.find(itemname, "Meter %d")) or (string.find(itemname, "Drawbar %d"))) then
			local nextbuttonvalue = 0
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
					local nextbuttonvalue = 127
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
					local prevbuttonvalue = 0
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
			local prevbuttonvalue = 0
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
	if(remote.is_item_enabled(itemsindex["ARadioButton2"]) and string.find(buttonname, "Button A")) then
		local num = get_a_button_num(buttonname)
		if(num <= 2) then
			return "ARadioButton2"
		end
	end
	if(remote.is_item_enabled(itemsindex["ARadioButton3"]) and string.find(buttonname, "Button A")) then
		local num = get_a_button_num(buttonname)
		if(num <= 3) then
			return "ARadioButton3"
		end
	end
	if(remote.is_item_enabled(itemsindex["ARadioButton4"]) and string.find(buttonname, "Button A")) then
		local num = get_a_button_num(buttonname)
		if(num <= 4) then
			return "ARadioButton4"
		end
	end
	if(remote.is_item_enabled(itemsindex["EFSButton"])) then
		local row = get_button_row(buttonname)
		local col = get_button_col(buttonname)
		if((col == 1) and (row <= 3)) then
			return "EFSButton"
		end
	end
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

function get_button_name(button)
	local x = button.x
	if(button.x == 0xa0) then
		x = 0x90
	end
	local midistring = string.format("%02x %02x", x, button.y)
	local buttonname = midi_to_button[midistring]
	if(buttonname == nil) then
		error("No button found for midistring: "..midistring)
	end
	return(buttonname)
end

-- function get_knob_type(itemname)
-- 	return(string.match(itemname, ".+ (.).+"))
-- end

function get_item_type(itemname)
	return(string.match(itemname, "(.+) .+"))
end

function get_button_row(buttonname)
	return(tonumber(string.match(buttonname, "Button (%d)%-%d")))
end

function get_button_col(buttonname)
	return(tonumber(string.match(buttonname, "Button %d%-(%d)")))
end

function get_a_button_num(buttonname)
	return(tonumber(string.match(buttonname, "Button A(%d)")))
end

function is_up_udupbutton(buttonname, itemname)
	local upbutton

	local udtype,first,second = string.match(itemname, "UD(.)Button (...)_(...)")

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

function fader_nearby_down(buttonname)
	local row = tonumber(string.match(buttonname, "Button (%d)%-%d"))
	local col = tonumber(string.match(buttonname, "Button %d%-(%d)"))
	local upbutton = "Button "..(row+1).."-"..col
	local downbutton = "Button "..(row-1).."-"..col

	return(g_buttondown[upbutton] or g_buttondown[downbutton])
end

function fader_get_otherbutton(buttonname)
	local row = tonumber(string.match(buttonname, "Button (%d)%-%d"))
	local col = tonumber(string.match(buttonname, "Button %d%-(%d)"))
	local otherrow = 1
	if(row == 1) then
		otherrow = 8
	end
	return("Button "..otherrow.."-"..col)
end

function fader_already_down(buttonname)
	local row = tonumber(string.match(buttonname, "Button (%d)%-%d"))
	local otherbutton = fader_get_otherbutton(buttonname)

	if((row == 1) or (row == 8)) then
		return(g_buttondown[otherbutton])
	end
	return(nil)
end

function is_up_mfader(buttonname, itemname)
	local first = string.match(itemname, "MFader (...)")
	return(buttonname == "Button "..first)
end

function mfader_get_otherbutton(buttonname, itemname)
	local otherbutton
	local firstbutton = string.match(itemname, "MFader (...)")
	local row = string.match(itemname, "MFader (%d)%-%d")
	local col = string.match(itemname, "MFader %d%-(%d)")
	if(buttonname == "Button "..firstbutton) then
		otherbutton = "Button "..tostring(row+1).."-"..col
	else
		otherbutton = "Button "..firstbutton
	end
	return(otherbutton)
end

function mfader_already_down(buttonname, itemname)
	return(g_buttondown[mfader_get_otherbutton(buttonname, itemname)])
end

function ud_get_otherbutton(buttonname, itemname)
	local otherbutton
	local firstbutton, secondbutton = string.match(itemname, "UD.Button (...)_(...)")
	if(buttonname == "Button "..firstbutton) then
		otherbutton = "Button "..secondbutton
	else
		otherbutton = "Button "..firstbutton
	end
	return(otherbutton)
end

function ud_already_down(buttonname, itemname)
	return(g_buttondown[ud_get_otherbutton(buttonname, itemname)])
end
