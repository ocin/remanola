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
			["Knob V4"]={template="FGain"},
			["Knob V5"]={template="FMisc"},
			["Fader 8"]={template="FGain"},
		},
		["Delay Buffer"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 5-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["Button 1-4"]={template="BRedOnOff"},
			["Knob V4"]={template="FMisc"},
			["Knob V5"]={template="FMisc"},
		},
		["Shifter *"]={
{% if lptype == "pro" %}
{% include "devices/effect/polardualpitchshifter/pro/confmap_submenu_shifter.lua" %}
{% endif %}
			["Button 1-1"]={template="BRedOnOff"},
			["Knob V2"]={template="FFreq"},
			["Knob V3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Knob V6"]={template="FMisc"},
			["Knob V7"]={template="FMisc"},
		},
		["Shifter * Vol"]={
{% if lptype == "pro" %}
{% include "devices/effect/polardualpitchshifter/pro/confmap_submenu_shifter.lua" %}
{% endif %}
			["Knob V2"]={template="FGain"},
			["Knob V3"]={template="FMisc"},
			["Fader 6"]={template="FGain"},
		},
		["Envelope"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FMisc"},
			["Fader 4"]={template="FMisc"},
			["Fader 5"]={template="FMisc"},
			["Fader 6"]={template="FMisc"},
			["Button 1-7"]={template="BRedOnOff"},
		},
		["LFO"]={
			["Fader 2"]={template="FFreq"},
			["UDVButton 7-2_8-2"]={template="UDFreq"},
			["Fader 3"]={template="FMisc"},
			["UDVButton 7-4_8-4"]={template="UDEffect"},
			["Button 1-5"]={template="BRedOnOff"},
		},
		["Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 7-3_8-3"]={template="UDFreq", inverted=true},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FMisc"},
			["Knob V7"]={template="FMisc"},
			["Knob V8"]={template="FMisc"},
		},
	},
