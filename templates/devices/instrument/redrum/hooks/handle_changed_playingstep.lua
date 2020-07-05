		if(g_scopetext == "Redrum") then
			local playingstep = tonumber(remote.get_item_text_value(itemsindex["PlayingStep"]))
			local editsteps = math.floor(remote.get_item_value(itemsindex["UDVButton 5-4_6-4"])/42)+1
			local cstep = (playingstep-1)%16
			local cpage = math.floor(((playingstep-1))/16)+1
			local crowstep = (cstep)%8+1
			local crow = math.floor((cstep)/8)+1+6

			if(editsteps == cpage) then
{% if lptype == "mini" %}
				g_updateditems[g_playingbutton] = true
{% endif %}
				g_playingbutton = "Button "..tostring(crow).."-"..tostring(crowstep)
{% if lptype == "mini" %}
				g_updateditems[g_playingbutton] = true
{% else %}
				g_updateall = true
{% endif %}
			else
				g_playingbutton = "Other page"
			end
		end
