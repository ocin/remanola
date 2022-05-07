	local esstr = string.match(citemname, "PW ES (.*)")
	if(esstr ~= nil) then
		g_select["PWSelect"] = g_esmap[esstr]
	end
