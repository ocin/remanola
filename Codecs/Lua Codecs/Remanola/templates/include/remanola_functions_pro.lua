function gen_color_midi(button, color)
	local buttonmidi = string.match(button, ".. (..)")
	return(string.format("f0 00 20 29 02 10 0b %s %02x %02x %02x f7", buttonmidi, colorpre[color].red, colorpre[color].green , colorpre[color].blue))
end
