function remote_init()
	init_buttons()
	init_udbuttons()
	init_sel()
	init_itemsindex()
	init_miditobutton()

	remote.define_items(items)
	remote.define_auto_inputs(inputs)
end

function remote_release_from_use()
	local ret_events={}

	return ret_events;
end

function remote_prepare_for_use()
	local ret_events={}

{% if lptype == "pro" %}
	table.insert(ret_events, remote.make_midi(MIDI_OUT_PROGLAYOUT))
{% else %}
	table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0,DBUPDATE1,DBCOPY))))
{% endif %}

	return ret_events;
end

function remote_set_state(changed_items)
	for i,citemindex in ipairs(changed_items)do
		local citemname = items[citemindex].name

{% if lptype == "pro" %}
		g_updateall = true
{% else %}
		g_updateditems[citemname] = true
{% endif %}

		if(citemname ~= nil) then
			handle_changed_sel(citemindex, citemname)
			handle_changed_devicescope(citemindex, citemname)
			handle_changed_barposition(citemindex, citemname)
			handle_changed_barposition(citemindex, citemname)
			handle_changed_playingstep(citemindex, citemname)
			handle_changed_pagename(citemindex, citemname)
			handle_changed_subpagename(citemindex, citemname)
			handle_changed_kbdvel(citemindex, citemname)
			handle_changed_basekey(citemindex, citemname)
		end
	end
end

function remote_deliver_midi(maxbytes, port)
	local ret_events = {}

	if(g_stopflashing) then
{% if lptype == "mini" %}
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0,DBUPDATE1,DBCOPY))))
		g_currentbuffer = 0
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button C8"], bit.bor(GREEN, COPY))))
{% endif %}
		g_stopflashing = false
		g_flashing = false
		g_updateall = true
	end

	deliver_midi_buttons(ret_events)
	deliver_midi_startflashing(ret_events)
	deliver_midi_scrolltext(ret_events)
	deliver_midi_endscroll(ret_events)
	deliver_midi_sel(ret_events)
{% if lptype == "mini" %}
	-- Mini specific
	deliver_midi_flashing(ret_events)
	deliver_midi_stopflashing(ret_events)
	deliver_midi_lightshow(ret_events)
	deliver_midi_transport(ret_events)
	deliver_midi_brightness(ret_events)
{% endif %}

	return ret_events
end

function remote_process_midi(event)
	handle_input_sel(event)

	handle_input_select(event)

	if(handle_input_scrollend(event)) then
		return(true)
	end

	if(g_lightshow > 0) then
		if(handle_input_lightshow(event)) then
			return(true)
		end
	end

	local button = remote.match_midi("xx yy zz", event)

	if(isbutton(button)) then
		if(g_helpmode) then
			if(handle_input_helpmode(event, button)) then
				return(true)
			end
		elseif(g_valuemode) then
			if(handle_input_valuemode(event, button)) then
				return(true)
			end
		else
{% if lptype == "mini" %}
			if(handle_input_buttonendscroll(event, button)) then
				return(true)
			end
{% endif %}
			if(handle_input_kong(event, button)) then
				return(true)
			end
	
			if(handle_input_keyboard(event, button)) then
				return(true)
			end
	
			if(handle_input_item(event, button)) then
				return(true)
			end

			if(handle_input_internalpage(event, button)) then
				return(true)
			end

			if(handle_input_setveltomax(event, button)) then
				return(true)
			end
	
			if(handle_input_starthelpmode(event, button)) then
				return(true)
			end

		end
	end

	if(g_helpmode or g_valuemode) then
		return true
	end

	return false
end

function remote_probe(manufacturer,model,prober)
	local controlRequest=MIDI_OUT_DEVICEINQ
	local controlResponse=string.format("%s %x 00 ?? ?? ?? ?? ?? ??  f7", MIDI_IN_DEVICEINQ_HEAD, DEVICE_ID)

	return {
                request=controlRequest,
                response=controlResponse
        }
end
