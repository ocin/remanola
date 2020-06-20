function gen_scroll_string(string, color, speed)
	return(string.format("%s %02x %02x %s F7", MIDI_OUT_SCROLL, color, speed, hex_encode_text(string)))
end

function get_veloctity(velocity)
	if(velocity > 0) then
		velocity = g_kbdvel
	end
	return(velocity)
end
