	["Kong"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/instrument/kong/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
			-- Pads
			["Button 5-1"]={template="BOscPage"},
			["Button 5-2"]={template="BOscPage"},
			["Button 5-3"]={template="BOscPage"},
			["Button 5-4"]={template="BOscPage"},
			["Button 6-1"]={template="BOscPage"},
			["Button 6-2"]={template="BOscPage"},
			["Button 6-3"]={template="BOscPage"},
			["Button 6-4"]={template="BOscPage"},
			["Button 7-1"]={template="BOscPage"},
			["Button 7-2"]={template="BOscPage"},
			["Button 7-3"]={template="BOscPage"},
			["Button 7-4"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},
			["Button 8-2"]={template="BOscPage"},
			["Button 8-3"]={template="BOscPage"},
			["Button 8-4"]={template="BOscPage"},
			-- Pads
			["Button 5-5"]={template="BPerformancePage"},
			["Button 5-6"]={template="BPerformancePage"},
			["Button 5-7"]={template="BPerformancePage"},
			["Button 5-8"]={template="BPerformancePage"},
			["Button 6-5"]={template="BPerformancePage"},
			["Button 6-6"]={template="BPerformancePage"},
			["Button 6-7"]={template="BPerformancePage"},
			["Button 6-8"]={template="BPerformancePage"},
			["Button 7-5"]={template="BPerformancePage"},
			["Button 7-6"]={template="BPerformancePage"},
			["Button 7-7"]={template="BPerformancePage"},
			["Button 7-8"]={template="BPerformancePage"},
			["Button 8-5"]={template="BPerformancePage"},
			["Button 8-6"]={template="BPerformancePage"},
			["Button 8-7"]={template="BPerformancePage"},
			["Button 8-8"]={template="BPerformancePage"},
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
			["Fader 6"]={template="FGain"},
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
				["UDVButton 1-2_2-2"]={template="UDAmount"},
				["UDVButton 3-2_4-2"]={template="UDFreq"},
				-- Sends
				["UDVButton 1-3_2-3"]={template="UDEffect"},
				["UDVButton 3-3_4-3"]={template="UDEffect"},
				["UDVButton 3-4_4-4"]={template="UDEffect"},
				-- Outputs
				["UDVButton 5-5_6-5"]={template="UDGain"},
				-- Pitch Bend Range
				["UDVButton 7-5_8-5"]={template="UDMisc"},
				["Knob V6"]={template="FAmount"},
				["Knob V7"]={template="FGain"},
				["Fader 8"]={template="FGain"},
			},
			["DrumModule"]={
				["Button 1-2"]={template="BYellowOnOff"},
				["Fader 5"]={template="FFreq"},
				["Knob V6"]={template="FAmount"},
				["Fader 7"]={template="FAmount"},
				["Fader 8"]={template="FGain"},
			},
			["DrumFX1"]={
				["Button 1-2"]={template="BYellowOnOff"},
				["Button 1-4"]={template="BYellowOnOff"},
				["Button 2-4"]={template="BYellowOnOff"},
				["Button 3-4"]={template="BYellowOnOff"},
				["Button 4-4"]={template="BYellowOnOff"},
				["Fader 5"]={template="FEffect"},
				["Fader 6"]={template="FEffect"},
			},
			["DrumFX2"]={
				["Button 1-2"]={template="BYellowOnOff"},
				["Button 1-4"]={template="BYellowOnOff"},
				["Button 2-4"]={template="BYellowOnOff"},
				["Button 3-4"]={template="BYellowOnOff"},
				["Button 4-4"]={template="BYellowOnOff"},
				["Fader 5"]={template="FEffect"},
				["Fader 6"]={template="FEffect"},
			},
		},
		["Pad *"]={
			["UDVButton 1-2_2-2"]={template="UDAmount"},
			["UDVButton 3-2_4-2"]={template="UDAmount", inverted=true},
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
			["Fader 6"]={template="FGain"},
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
