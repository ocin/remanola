local function hex_encode_text(text)
	local hexstring = ""

	for i = 1, #text do
		hexstring = hexstring..string.format("%02x ", string.byte(text:sub(i,i)))
	end

	return hexstring
end

-- Merge table2 into table1
function mergetables(table1, table2)
	for k,v in pairs(table2) do 
		table1[k] = v 
	end
end

function isaftertouch(button)
	return(button ~= nil and button.x == 0xa0)
end

function isbutton(button)
	return(button ~= nil and (button.x == 0x90 or button.x == 0xb0))
end
