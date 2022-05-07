		if(g_scopetext == "RV7000 Advanced Reverb") then
			if(string.match(get_current_page(), "Reverb")) then
				g_select["EditSelect"] = 0
			elseif(string.match(get_current_page(), "Eq")) then
				g_select["EditSelect"] = 1
			elseif(string.match(get_current_page(), "Gate")) then
				g_select["EditSelect"] = 2
			end
		end
