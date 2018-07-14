	["Synchronous"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/synchronous/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["Fader 3"]={template="FGain"},
			["Button 8-4"]={template="BRedOnOff"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FGain"},
		},
		["Dist"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 3-2_4-2"]={template="UDEffect"},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
		},
		["Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 3-2_4-2"]={template="UDEffect"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
		},
		["Delay"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 3-2"]={template="BRedOnOff"},
			["Button 4-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FFreq"},
			["UDVButton 7-4_8-4"]={template="UDFreq"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 8-5"]={template="BRedOnOff"},
			["Fader 6"]={template="FEffect"},
			["Button 8-7"]={template="BRedOnOff"},
			["Knob V8"]={template="FEffect"},
		},
		["Reverb"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FFreq"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
			["Button 8-8"]={template="BRedOnOff"},
		},
	},
