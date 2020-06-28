	itemname = remote.get_item_name(citemindex)
	esstr = string.match(itemname, "PW ES (.*)")
	if(esstr ~= nil) then
		g_select["PWSelect"] = g_esmap[esstr]
	end
