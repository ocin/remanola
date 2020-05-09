	["Kong"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/instrument/kong/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
			-- Pads
			["Button 5-1"]={template="BOscPageHigh"},
			["Button 5-2"]={template="BOscPageHigh"},
			["Button 5-3"]={template="BOscPageHigh"},
			["Button 5-4"]={template="BOscPageHigh"},
			["Button 6-1"]={template="BOscPageHigh"},
			["Button 6-2"]={template="BOscPageHigh"},
			["Button 6-3"]={template="BOscPageHigh"},
			["Button 6-4"]={template="BOscPageHigh"},
			["Button 7-1"]={template="BOscPageHigh"},
			["Button 7-2"]={template="BOscPageHigh"},
			["Button 7-3"]={template="BOscPageHigh"},
			["Button 7-4"]={template="BOscPageHigh"},
			["Button 8-1"]={template="BOscPageHigh"},
			["Button 8-2"]={template="BOscPageHigh"},
			["Button 8-3"]={template="BOscPageHigh"},
			["Button 8-4"]={template="BOscPageHigh"},
			-- Pads
			["Button 5-5"]={template="BPerformancePageHigh"},
			["Button 5-6"]={template="BPerformancePageHigh"},
			["Button 5-7"]={template="BPerformancePageHigh"},
			["Button 5-8"]={template="BPerformancePageHigh"},
			["Button 6-5"]={template="BPerformancePageHigh"},
			["Button 6-6"]={template="BPerformancePageHigh"},
			["Button 6-7"]={template="BPerformancePageHigh"},
			["Button 6-8"]={template="BPerformancePageHigh"},
			["Button 7-5"]={template="BPerformancePageHigh"},
			["Button 7-6"]={template="BPerformancePageHigh"},
			["Button 7-7"]={template="BPerformancePageHigh"},
			["Button 7-8"]={template="BPerformancePageHigh"},
			["Button 8-5"]={template="BPerformancePageHigh"},
			["Button 8-6"]={template="BPerformancePageHigh"},
			["Button 8-7"]={template="BPerformancePageHigh"},
			["Button 8-8"]={template="BPerformancePageHigh"},
		},
		["Main"]={
			-- Pads
			["Button 5-1"]={template="BPad"},
			["Button 5-2"]={template="BPad"},
			["Button 5-3"]={template="BPad"},
			["Button 5-4"]={template="BPad"},
			["Button 6-1"]={template="BPad"},
			["Button 6-2"]={template="BPad"},
			["Button 6-3"]={template="BPad"},
			["Button 6-4"]={template="BPad"},
			["Button 7-1"]={template="BPad"},
			["Button 7-2"]={template="BPad"},
			["Button 7-3"]={template="BPad"},
			["Button 7-4"]={template="BPad"},
			["Button 8-1"]={template="BPad"},
			["Button 8-2"]={template="BPad"},
			["Button 8-3"]={template="BPad"},
			["Button 8-4"]={template="BPad"},
			["Fader 6"]={template="FVol"},
		},
		["Mutes & Solos"]={
			-- Mute
			["Button 1-1"]={template="BMute"},
			["Button 1-2"]={template="BMute"},
			["Button 1-3"]={template="BMute"},
			["Button 1-4"]={template="BMute"},
			["Button 2-1"]={template="BMute"},
			["Button 2-2"]={template="BMute"},
			["Button 2-3"]={template="BMute"},
			["Button 2-4"]={template="BMute"},
			["Button 3-1"]={template="BMute"},
			["Button 3-2"]={template="BMute"},
			["Button 3-3"]={template="BMute"},
			["Button 3-4"]={template="BMute"},
			["Button 4-1"]={template="BMute"},
			["Button 4-2"]={template="BMute"},
			["Button 4-3"]={template="BMute"},
			["Button 4-4"]={template="BMute"},
			-- Solo
			["Button 1-5"]={template="BSolo"},
			["Button 1-6"]={template="BSolo"},
			["Button 1-7"]={template="BSolo"},
			["Button 1-8"]={template="BSolo"},
			["Button 2-5"]={template="BSolo"},
			["Button 2-6"]={template="BSolo"},
			["Button 2-7"]={template="BSolo"},
			["Button 2-8"]={template="BSolo"},
			["Button 3-5"]={template="BSolo"},
			["Button 3-6"]={template="BSolo"},
			["Button 3-7"]={template="BSolo"},
			["Button 3-8"]={template="BSolo"},
			["Button 4-5"]={template="BSolo"},
			["Button 4-6"]={template="BSolo"},
			["Button 4-7"]={template="BSolo"},
			["Button 4-8"]={template="BSolo"},
		},
		["Drum *"]={
{% if lptype == "pro" %}
{% include "devices/instrument/kong/pro/confmap_submenu_drum.lua" %}
{% else %}
{% include "devices/instrument/kong/mini/confmap_mainmenu_drum.lua" %}
{% endif %}
			-- SubPages
			["Button 1-1"]={template="BOscPage"},
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BEffectPage"},
			["Button 4-1"]={template="BEffectPage"},
			["DrumMain"]={
				-- Offset
				["UDVButton 1-2_2-2"]={template="UDOsc"},
				["UDVButton 3-2_4-2"]={template="UDFreq"},
				-- Sends
				["UDVButton 1-3_2-3"]={template="UDEffect"},
				["UDVButton 3-3_4-3"]={template="UDEffect"},
				["UDVButton 3-4_4-4"]={template="UDEffect"},
				["Knob V5"]={template="FOsc"},
				["Knob V6"]={template="FPan"},
				["Fader 7"]={template="FVol"},
				-- Outputs
				["UDVButton 5-8_6-8"]={template="UDVol"},
				-- Pitch Bend Range
				["UDVButton 7-8_8-8"]={template="UDPerf"},
			},
			["DrumModule"]={
				["Button 1-2"]={template="BYellowOnOff"},
				["Fader 5"]={template="FFreq"},
				["Knob V6"]={template="FOsc"},
				["Fader 7"]={template="FOsc"},
				["Fader 8"]={template="FVol"},
			},
			["DrumFX1"]={
				["Button 1-2"]={template="BYellowOnOff"},
				["Button 1-4"]={template="BYellowOnOff"},
				["Button 2-4"]={template="BYellowOnOff"},
				["Button 3-4"]={template="BYellowOnOff"},
				["Button 4-4"]={template="BYellowOnOff"},
				["Fader 6"]={template="FEffect"},
				["Fader 7"]={template="FEffect"},
			},
			["DrumFX2"]={
				["Button 1-2"]={template="BYellowOnOff"},
				["Button 1-4"]={template="BYellowOnOff"},
				["Button 2-4"]={template="BYellowOnOff"},
				["Button 3-4"]={template="BYellowOnOff"},
				["Button 4-4"]={template="BYellowOnOff"},
				["Fader 6"]={template="FEffect"},
				["Fader 7"]={template="FEffect"},
			},
		},
		["Pad *"]={
			["UDVButton 1-2_2-2"]={template="UDOsc"},
			["UDVButton 3-2_4-2"]={template="UDPerf", inverted=true},
			-- Pad Groups
			["Button 1-6"]={template="BYellowOnOff"},
			["Button 1-7"]={template="BYellowOnOff"},
			["Button 1-8"]={template="BYellowOnOff"},
			["Button 2-6"]={template="BYellowOnOff"},
			["Button 2-7"]={template="BYellowOnOff"},
			["Button 2-8"]={template="BYellowOnOff"},
			["Button 3-6"]={template="BYellowOnOff"},
			["Button 3-7"]={template="BYellowOnOff"},
			["Button 3-8"]={template="BYellowOnOff"},
{% if lptype == "pro" %}
{% include "devices/instrument/kong/pro/confmap_submenu_pad.lua" %}
{% else %}
{% include "devices/instrument/kong/mini/confmap_mainmenu_pad.lua" %}
{% endif %}
		},
		["Bus FX"]={
			["Button 1-2"]={template="BYellowOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Fader 6"]={template="FVol"},
{% if lptype == "mini" %}
{% include "devices/instrument/kong/mini/confmap_mainmenu_effects.lua" %}
{% endif %}
		},
		["Master FX"]={
			["Button 1-2"]={template="BYellowOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
{% if lptype == "mini" %}
{% include "devices/instrument/kong/mini/confmap_mainmenu_effects.lua" %}
{% endif %}
		},
	},
