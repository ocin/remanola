	["Polar Dual Pitch Shifter"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/polardualpitchshifter/pro/confmap_mainmenu.lua" %}
{% else %}
{% include "devices/effect/polardualpitchshifter/mini/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["UDVButton 1-3_2-3"]={template="UDEffect", inverted=true},
			["UDVButton 5-3_6-3"]={template="UDEffect", inverted=true},
			["Button 8-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
		},
		["Dry Signal"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["Knob V4"]={template="FPan"},
			["Knob V5"]={template="FLFO"},
			["Fader 8"]={template="FGain"},
		},
		["Delay Buffer"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 5-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["Button 1-4"]={template="BRedOnOff"},
			["Knob V5"]={template="FLFO"},
			["Knob V6"]={template="FEnv"},
		},
		["Shifter *"]={
{% if lptype == "pro" %}
{% include "devices/effect/polardualpitchshifter/pro/confmap_submenu_shifter.lua" %}
{% endif %}
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 7-2_8-2"]={template="UDFreq"},
			["Knob V3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Knob V6"]={template="FLFO"},
			["Knob V7"]={template="FEnv"},
		},
		["Shifter * Vol"]={
{% if lptype == "pro" %}
{% include "devices/effect/polardualpitchshifter/pro/confmap_submenu_shifter.lua" %}
{% endif %}
			["Knob V2"]={template="FPan"},
			["Knob V3"]={template="FLFO"},
			["Fader 6"]={template="FVol"},
		},
		["Envelope"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEnv"},
			["Fader 4"]={template="FEnv"},
			["Fader 5"]={template="FEnv"},
			["Fader 6"]={template="FEnv"},
			["Button 1-7"]={template="BRedOnOff"},
		},
		["LFO"]={
			["Fader 2"]={template="FFreq"},
			["UDVButton 7-2_8-2"]={template="UDFreq"},
			["Button 8-3"]={template="BRedOnOff"},
			["Fader 5"]={template="FLFO"},
			["UDVButton 7-6_8-6"]={template="UDLFO"},
		},
		["Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 7-3_8-3"]={template="UDFreq", inverted=true},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FPerf"},
			["Knob V7"]={template="FLFO"},
			["Knob V8"]={template="FEnv"},
		},
	},
