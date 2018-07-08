function init_buttons()
	for buttonname,buttonmidi in pairs(buttons) do
		table.insert(items, {name = buttonname, input = "button", output="value", modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}})
		table.insert(inputs, {pattern=buttonmidi .. " ?<???x>", name=buttonname})
	end
end

function init_udbuttons()
	for row=1,8 do
		for column=1,8,2 do
			table.insert(items, {name = "UDHButton "..row.."-"..column.."_"..row.."-"..tostring(column+1), input = "delta", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}})
		end
	end

	for row=1,8,2 do
		for column=1,8 do
			table.insert(items, {name = "UDVButton "..row.."-"..column.."_"..tostring(row+1).."-"..column, input = "delta", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}})
		end
	end
end

function init_sel()
	for sel=1,4 do
		for val=0,127 do
			table.insert(items, {name = "Sel"..sel.."_"..val, input= "button", output = "value", min = 0, max = 1})
		end
	end
end

function init_itemsindex()
	for index,item in ipairs(items) do
		itemsindex[item.name] = index
		itemsmodeindex[item.name] = {}
		if(item.modes ~= nil) then
			for mindex,mode in ipairs(item.modes) do
				itemsmodeindex[item.name][mode] = mindex
			end
		end
	end
end

function init_miditobutton()
	for button,midi in pairs(buttons) do
		midi_to_button[midi] = button
	end
end

