		if(string.match(get_current_effectstate(), "Bypass")) then
			g_select["EffectState"] = 0
		elseif(string.match(get_current_effectstate(), "On")) then
			g_select["EffectState"] = 1
		elseif(string.match(get_current_effectstate(), "Off")) then
			g_select["EffectState"] = 2
		end
