		if(g_scopetext == "Thor") then
			local playingstep = tonumber(remote.get_item_text_value(itemsindex["PlayingStep"]))
			local crowstep = (playingstep)%8+1
			local crow = math.floor((playingstep)/8)+1

{% if lptype == "mini" %}
			g_updateditems[g_playingbutton] = true
{% endif %}
			g_playingbutton = "Button "..tostring(crow).."-"..tostring(crowstep)
{% if lptype == "mini" %}
			g_updateditems[g_playingbutton] = true
{% else %}
			g_updateall = true
{% endif %}
		end
