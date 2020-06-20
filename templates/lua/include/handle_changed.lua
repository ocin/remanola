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
		{% import "devicelist.j2" as d %}
		{% for device in d.devices %}
		{% include "devices/" + device.type + "/" + device.name + "/hooks/handle_changed_pagename.lua" ignore missing %}
		{% endfor %}
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
