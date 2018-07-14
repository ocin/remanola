	["PH-90 Phaser"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/ph-90phaser/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FEffect"},
		},
		["LFO"]={
			["Fader 5"]={template="FFreq"},
			["Button 1-6"]={template="BRedOnOff"},
			["Fader 7"]={template="FLFO"},
		},
	},
