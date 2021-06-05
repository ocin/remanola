		if(g_scopetext == "Quartet") then
			if(string.match(get_current_page(), "Chorus")) then
				g_select["EffectSelect4"] = 0
			elseif(string.match(get_current_page(), "BBD")) then
				g_select["EffectSelect4"] = 1
			elseif(string.match(get_current_page(), "FFT")) then
				g_select["EffectSelect4"] = 2
			elseif(string.match(get_current_page(), "Grain")) then
				g_select["EffectSelect4"] = 3
			end
		end
