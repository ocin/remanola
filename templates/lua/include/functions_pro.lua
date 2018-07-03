function get_rgb_midi(color)
	r,g,b = string.match(color, "(..)(..)(..)")
	return(string.format("%02x %02x %02x", tonumber(r,16)/4, tonumber(g,16)/4, tonumber(b,16)/4))
end

function gen_color_midi(button, color)
	local buttonmidi = string.match(button, ".. (..)")
	return(string.format("f0 00 20 29 02 10 0b %s %s f7", buttonmidi, get_rgb_midi(color)))
end
