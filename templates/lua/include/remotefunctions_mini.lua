function remote_probe(manufacturer,model,prober)
	local controlRequest=MIDI_OUT_DEVICEINQ
	local controlResponse=string.format("%s %x 00 ?? ?? ?? ?? ?? ??  f7", MIDI_IN_DEVICEINQ_HEAD, DEVICE_ID)

	return {
                request=controlRequest,
                response=controlResponse
        }
end
