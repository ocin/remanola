function deliver_midi_buttons(ret_events)
	if(g_lightshow == 0 and not g_flashing and not g_scrolling) then
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

					if(string.match(itemname, "Button C5") and (g_debugupdate ~= 0)) then
						if(g_debugupdate == 1) then
							g_debugupdate = 2
							color = RED
						else
							g_debugupdate = 1
							color = BLUE
						end
					end

					if(color == nil) then
						error(string.format("Undefined color, device: %s page: %s item: %s", g_colorscheme, get_current_page(), itemname))
					end

					gridmidimsg = gridmidimsg.." "..get_rgb_midi(color)
				end
			end
			gridmidimsg = gridmidimsg.." f7"
			table.insert(ret_events, remote.make_midi(gridmidimsg))
			deliver_midi_sideled(ret_events)
			g_updateall = false
		end
	end
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
