			local ceng = tonumber(string.match(get_current_page(), "Eng (%d)"))
			if(ceng ~= nil) then
				g_select["EngineSelect"] = ceng-1
			end

			local clfo = tonumber(string.match(get_current_page(), "LFO (%d)"))
			if(clfo ~= nil) then
				g_select["LFOSelect"] = clfo-1
			end

			cenv = tonumber(string.match(get_current_page(), "Env (%d)"))
			if(cenv ~= nil) then
				g_select["EnvSelect"] = cenv-1
			end

			if(string.match(get_current_page(), "Phaser")) then
				g_select["EffectSelect"] = 4
			elseif(string.match(get_current_page(), "Dist")) then
				g_select["EffectSelect"] = 2
			elseif(string.match(get_current_page(), "Eq")) then
				g_select["EffectSelect"] = 6
			elseif(string.match(get_current_page(), "Delay")) then
				g_select["EffectSelect"] = 1
			elseif(string.match(get_current_page(), "Comp")) then
				g_select["EffectSelect"] = 3
			elseif(string.match(get_current_page(), "Reverb")) then
				g_select["EffectSelect"] = 0
			end
