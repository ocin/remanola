	["Scream 4 Distortion"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/scream4distortion/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["UDVButton 1-4_2-4"]={template="UDEffect", inverted=true},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FGain"},
		},
		["Cut"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Knob V4"]={template="FFreq"},
			["Knob V5"]={template="FFreq"},
			["Knob V6"]={template="FFreq"},
		},
		["Body"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FEffect"},
			["UDVButton 1-7_2-7"]={template="UDEffect", inverted=true},
		},
	},
