	if(g_scopetext == "Redrum" and string.match(get_current_page(), "Main") and (string.match(itemname, "Button [78]%-%d"))) then
		if(g_playingbutton == itemname and (tonumber(remote.get_item_text_value(itemsindex["Button 6-1"])) == 1)) then
			return(REDRUM_HIT)
		else 
			if(textvalue == 1) then
				return(REDRUM_SOFT)
			elseif(textvalue == 2) then
				return(REDRUM_MEDIUM)
			elseif(textvalue == 3) then
				return(REDRUM_HARD)
			else
				return(REDRUM_NOHIT)
			end
		end
	end
	if(g_scopetext == "Redrum" and string.match(get_current_page(), "Main") and (string.match(itemname, "Button 6%-5"))) then
		if(textvalue == 1) then
			return(REDRUM_SOFT)
		elseif(textvalue == 2) then
			return(REDRUM_MEDIUM)
		elseif(textvalue == 3) then
			return(REDRUM_HARD)
		else
			return(REDRUM_NOHIT)
		end
	end
