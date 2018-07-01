CLEAR=tonumber("001000",2)
COPY=tonumber("000100",2)

DBCOPY    = tonumber("0110000",2)
DBFLASH   = tonumber("0101000",2)
DBUPDATE0 = tonumber("0100000",2)
DBUPDATE1 = tonumber("0100100",2)
DBDISP0   = tonumber("0100000",2)
DBDISP1   = tonumber("0100001",2)

-- Mini
--MIDI_OUT_SCROLL = "f0 00 20 29 09"
--MIDI_OUT_ENDSCROLL = MIDI_OUT_SCROLL.." 00 f7"
MIDI_OUT_SCROLL = "f0 00 20 29 02 10 14"
MIDI_OUT_ENDSCROLL = MIDI_OUT_SCROLL.." f7"
MIDI_OUT_DOUBLEBUFF = "b0 00"
MIDI_OUT_BRIGHTNESS = "b0 1e"
MIDI_OUT_GETVERSION = "f0 00 20 29 00 70 f7"
-- Mini
--MIDI_IN_SCROLLEND = "b0 00 03"
MIDI_IN_SCROLLEND = "f0 00 20 29 02 10 14 f7"

MIDI_OUT_PRO_PROGLAYOUT = "f0 00 20 29 02 10 2c 03 F7"
