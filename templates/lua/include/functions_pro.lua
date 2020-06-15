function gen_scroll_string(string, color, speed)
	return(string.format("%s %02x %02x %02x %s F7", MIDI_OUT_SCROLL, color, 0, speed, hex_encode_text(string)))
end

function get_veloctity(velocity)
	return(velocity)
end

function get_rgb_midi(color)
	r,g,b = string.match(color, "(..)(..)(..)")
	return(string.format("%02x %02x %02x", tonumber(r,16)/4, tonumber(g,16)/4, tonumber(b,16)/4))
end

function dim_color(colorlow, colorhigh, dimlevel)
	rl,gl,bl = string.match(colorlow, "(..)(..)(..)")
	rh,gh,bh = string.match(colorhigh, "(..)(..)(..)")
	r = tonumber(rl,16) + (tonumber(rh,16) - tonumber(rl,16)) * dimlevel
	g = tonumber(gl,16) + (tonumber(gh,16) - tonumber(gl,16)) * dimlevel
	b = tonumber(bl,16) + (tonumber(bh,16) - tonumber(bl,16)) * dimlevel
	return(string.format("%02x%02x%02x", r, g, b))
end

function gen_color_midi(button, color)
	local buttonmidi = string.match(button, ".. (..)")
	return(string.format("f0 00 20 29 02 10 0b %s %s f7", buttonmidi, get_rgb_midi(color)))
end
