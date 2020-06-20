function handle_changed_sel(citemindex, citemname)
	for s=1,g_selcount do
		if(remote.get_item_mode(citemindex) == itemsmodeindex[citemname]["SEL"..s]) then
			g_sel[s] = tonumber(remote.get_item_value(citemindex))
		end
	end
end

function handle_changed_devicescope(citemindex, citemname)
	if(string.match(citemname, "DeviceScope")) then
		-- g_scrolltext = remote.get_item_text_value(itemsindex["DeviceScope"])
		g_updateall = true
       		if(remote.is_item_enabled(itemsindex["DeviceScope"])) then
             				local newscope = remote.get_item_text_value(itemsindex["DeviceScope"])
			g_scopetext = newscope
			g_colorscheme = g_scopetext
       		else
             				local newscope = ""
			g_scopetext = newscope
       		end
	end
end

function handle_changed_barposition(citemindex, citemname)
	if(string.match(citemname, "BarPosition")) then
		g_startbar = true
	end
end

function handle_changed_barposition(citemindex, citemname)
	if(string.match(citemname, "BeatPosition")) then
		if(not g_barupdate and not g_startbar) then
			g_startbeat = true
		end
	end
end

function handle_changed_playingstep(citemindex, citemname)
	if(string.match(citemname, "PlayingStep")) then
		{% import "devicelist.j2" as d %}
		{% for device in d.devices %}
		{% include "devices/" + device.type + "/" + device.name + "/hooks/handle_changed_playingstep.lua" ignore missing %}
		{% endfor %}
	end
end

function handle_changed_pagename(citemindex, citemname)
	if(string.match(citemname, "PageName")) then
		g_updateall = true
		if(g_scopetext == "Europa" or g_scopetext == "Grain") then
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
		elseif(g_scopetext == "RV7000 Advanced Reverb") then
			if(string.match(get_current_page(), "Reverb")) then
				g_select["EditSelect"] = 0
			elseif(string.match(get_current_page(), "Eq")) then
				g_select["EditSelect"] = 1
			elseif(string.match(get_current_page(), "Gate")) then
				g_select["EditSelect"] = 2
			end
		end
	end
end

function handle_changed_subpagename(citemindex, citemname)
	if(string.match(citemname, "SubPageName")) then
		g_updateall = true
	end
end

function handle_changed_kbdvel(citemindex, citemname)
	if(string.match(citemname, "KbdVel")) then
		local newkbdvel = tonumber(remote.get_item_text_value(itemsindex["KbdVel"]))
		if(newkbdvel ~= nil) then
			g_kbdvel = newkbdvel
		end
	end
end

function handle_changed_basekey(citemindex, citemname)
	if(string.match(citemname, "BaseKey")) then
             			local newbasekey = tonumber(remote.get_item_text_value(itemsindex["BaseKey"]))
		if(newbasekey ~= nil) then
             				g_basekey = newbasekey
		end
	end
end
