function get_item_bvmap(itemname)
	local itemtype = string.match(itemname, "(.+%w)%s*%d")

	local currentpage = get_current_page()
	local scope = g_colorscheme

	local item_conf_map = get_item_conf_map(itemname, scope, currentpage)

	if(item_conf_map.bvmap ~= nil) then
		itemtype = item_conf_map.bvmap
	end

	if(item_bvmap[itemtype] == nil) then
		itemtype = "Default"
	end

	return(item_bvmap[itemtype])
end

function get_item_conf_map(itemname, context, page)
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

	if(page == "Keyboard" and (get_current_kbdpage() == "Kbd" or get_current_kbdpage() == "Drum") and item_conf_map["Default"][page][get_current_kbdpage()][itemname] ~= nil) then
		return(item_conf_map["Default"][page][get_current_kbdpage()][itemname])
	end

	if((item_conf_map[context][page] ~= nil) and (item_conf_map[context][page][get_current_subpage()] ~= nil) and (item_conf_map[context][page][get_current_subpage()][itemname] ~= nil)) then
		return(item_conf_map[context][page][get_current_subpage()][itemname])
	end

	if(item_conf_map[context][page] == nil or item_conf_map[context][page][itemname] == nil) then
		wildpage = string.gsub(page, "%d+", "*")
		-- Parsec and Malstrom uses A/B naming
		wildpage = string.gsub(wildpage, " A", " *")
		wildpage = string.gsub(wildpage, " B", " *")
		-- Revival uses alternate naming of sections
		wildpage = string.gsub(wildpage, "Attack", "*")
		wildpage = string.gsub(wildpage, "Primary", "*")
		wildpage = string.gsub(wildpage, "Secondary", "*")
		wildpage = string.gsub(wildpage, "Release", "*")
		if((item_conf_map[context][wildpage] ~= nil) and (item_conf_map[context][wildpage][get_current_subpage()] ~= nil) and (item_conf_map[context][wildpage][get_current_subpage()][itemname] ~= nil)) then
			return(item_conf_map[context][wildpage][get_current_subpage()][itemname])
		end
		if(item_conf_map[context][wildpage] == nil or item_conf_map[context][wildpage][itemname] == nil) then
			if(item_conf_map[context]["Default"] == nil) then
				context = "Default"
			end
			if(item_conf_map[context]["Default"][itemname] == nil) then
				if(item_conf_map["Default"][page] == nil or item_conf_map["Default"][page][itemname] == nil) then
					context = "Default"
					page = "Default"
				else
					context = "Default"
				end	
			else
				page = "Default"
			end
		else
			page = wildpage
		end
	end

	local citem_conf_map = item_conf_map[context][page][itemname]

	if(not citem_conf_map) then
		local defaultitemname = string.gsub(itemname, " .+", " *")
		citem_conf_map = item_conf_map[context][page][defaultitemname]
	end

	return(citem_conf_map)
end

function get_button_color(context, itemname, buttonname, value)
	local color
	local buttonindex
	local buttonvalue = 0

	local enabled = remote.is_item_enabled(itemsindex[itemname])
	local value = remote.get_item_state(itemsindex[itemname]).value

	local citem_conf_map = get_item_conf_map(itemname, context, get_current_page())

	if(citem_conf_map.template ~= nil) then
		citem_conf_map_template = color_templates[citem_conf_map.template]	
	end

	-- Colors
	local activecolor = citem_conf_map.activecolor
	local enabledcolor = citem_conf_map.enabledcolor
	local disabledcolor = citem_conf_map.disabledcolor
	local dactivecolor = citem_conf_map.dactivecolor
	local denabledcolor = citem_conf_map.denabledcolor
	local maxcolor = citem_conf_map.maxcolor
	--Config
	local defaultvalue = citem_conf_map.defaultvalue

	if(citem_conf_map_template ~= nil) then
		if(activecolor == nil) then
			activecolor = citem_conf_map_template.activecolor
		end
		if(enabledcolor == nil) then
			enabledcolor = citem_conf_map_template.enabledcolor
		end
		if(disabledcolor == nil) then
			disabledcolor = citem_conf_map_template.disabledcolor
		end
		if(dactivecolor == nil) then
			dactivecolor = citem_conf_map_template.dactivecolor
		end
		if(denabledcolor == nil) then
			denabledcolor = citem_conf_map_template.denabledcolor
		end
		if(maxcolor == nil) then
			maxcolor = citem_conf_map_template.maxcolor
		end
		if(defaultvalue == nil) then
			defaultvalue = citem_conf_map_template.defaultvalue
		end
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

	if(string.find(itemname, "UDHButton %d%-%d_%d%-%d") or string.find(itemname, "UDVButton %d%-%d_%d%-%d")) then
		if(enabled) then
			if(value) then
				color = activecolor
			else
				color = enabledcolor
			end
		else
			color = disabledcolor
		end
	elseif(string.find(itemname, "Button %d%-%d") or string.find(itemname, "Button C%d") or string.find(itemname, "Button %a")) then
		if(g_scopetext == "Redrum" and string.match(get_current_page(), "Main") and (string.match(itemname, "Button [78]%-%d"))) then
			if(g_playingbutton == itemname and (tonumber(remote.get_item_text_value(itemsindex["Button 6-1"])) == 1)) then
				color = REDRUM_HIT
			else 
				if(textvalue == 1) then
					color = REDRUM_SOFT
				elseif(textvalue == 2) then
					color = REDRUM_MEDIUM
				elseif(textvalue == 3) then
					color = REDRUM_HARD
				else
					color = REDRUM_NOHIT
				end
			end
		elseif(g_scopetext == "Redrum" and string.match(get_current_page(), "Main") and (string.match(itemname, "Button 6%-6"))) then
			if(textvalue == 1) then
				color = REDRUM_SOFT
			elseif(textvalue == 2) then
				color = REDRUM_MEDIUM
			elseif(textvalue == 3) then
				color = REDRUM_HARD
			else
				color = REDRUM_NOHIT
			end
		elseif(g_scopetext == "Thor" and string.match(get_current_page(), "Step Sequencer") and (string.match(itemname, "Button [12]%-%d"))) then
			if(g_playingbutton == itemname and (tonumber(remote.get_item_value(itemsindex["Button 8-1"])) == 1)) then
				color = THOR_SEQ_ACTIVE
			else 
				if(value == 1) then
					color = THOR_SEQ_STEPON
				else
					color = THOR_SEQ_STEPOFF
				end
			end
		else
			if(enabled) then
				if(value == 1) then
					color = activecolor
				else
					color = enabledcolor
				end
			else
				color = disabledcolor
			end
		end
	elseif(string.find(itemname, "Knob H%d")) then
		buttonindex = tonumber(string.sub(buttonname, -1,-1))
		if(value > 64) then
			if(buttonindex >= 5) then
				buttonvalue = get_item_bvmap(itemname)[buttonindex-1]
				if(value > buttonvalue) then
					color = activecolor
				else 
					color = enabledcolor
				end
			else
				color = enabledcolor
			end
		elseif(value < 64) then
			if(buttonindex <= 4) then
				buttonvalue = get_item_bvmap(itemname)[buttonindex]
				if(value <= buttonvalue) then
					color = activecolor
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
	elseif(string.find(itemname, "Knob V%d")) then
		buttonindex = tonumber(string.sub(buttonname, -3,-3))
		if(value > 64) then
			if(buttonindex <= 4) then
				buttonvalue = get_item_bvmap(itemname)[buttonindex+1]
				if(value > buttonvalue) then
					color = activecolor
				else 
					color = enabledcolor
				end
			else
				color = enabledcolor
			end
		elseif(value < 64) then
			if(buttonindex >= 5) then
				buttonvalue = get_item_bvmap(itemname)[buttonindex-1]
				if(value < buttonvalue) then
					color = activecolor
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
		if(string.find(itemname, "Drawbar %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "Meter %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "BigFader %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "Fader %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "MFader %d%-%d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))%2+1
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		end

		if(string.find(itemname, "MFader %d%-%d")) then	
			prevbuttonvalue = 0
			if buttonindex == 1 or buttonindex == 3 or buttonindex == 5 or buttonindex == 7 then
				prevbuttonvalue = get_item_bvmap(itemname)[buttonindex+1] 
			end
				
			if(value >= buttonvalue) then
				color = activecolor
			elseif(value > prevbuttonvalue) then
				color = dim_color(enabledcolor, activecolor, value/(buttonvalue - prevbuttonvalue))
			else 
				color = enabledcolor
			end
		else
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
			else 
				if((string.find(itemname, "BigFader %d") or string.find(itemname, "Fader %d")) and buttonvalue == defaultvalue) then
					color = denabledcolor
				else
					color = enabledcolor
				end
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
	local midistring = string.format("%02x %02x", button.x, button.y)
	return(midi_to_button[midistring])
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
		if(get_item_conf_map(itemname, g_colorscheme, get_current_page()).inverted) then
			upbutton = second
		else
			upbutton = first
		end
	else
		if(get_item_conf_map(itemname, g_colorscheme, get_current_page()).inverted) then
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
