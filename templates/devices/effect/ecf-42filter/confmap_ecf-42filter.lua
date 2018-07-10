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
			["Fader 5"]={template="FAmount"},
			["Fader 6"]={template="FMisc"},
			["UDVButton 1-7_2-7"]={template="UDFreq", inverted=true},
		},
	},
