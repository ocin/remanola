	["ECF-42 Filter"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/ecf-42filter/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEnv"},
			["Fader 6"]={template="FPerf"},
			["UDVButton 1-7_2-7"]={template="UDFreq", inverted=true},
		},
		["Filter Envelope"]={
			["Fader 1"]={template="FEnv"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
		},
	},
