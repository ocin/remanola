	if(g_scopetext == "Thor" and string.match(get_current_page(), "Step Sequencer") and (string.match(itemname, "Button [12]%-%d"))) then
		if(g_playingbutton == itemname and (tonumber(remote.get_item_value(itemsindex["Button 8-1"])) == 1)) then
			return(THOR_SEQ_ACTIVE)
		else 
			if(value == 1) then
				return(THOR_SEQ_STEPON)
			else
				return(THOR_SEQ_STEPOFF)
			end
		end
	end
