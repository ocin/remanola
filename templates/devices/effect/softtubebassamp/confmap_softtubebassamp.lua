	["Softtube Bass Amp"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/softtubebassamp/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["UDVButton 1-2_2-2"]={template="UDEffect"},
			["UDVButton 5-2_6-2"]={template="UDEffect"},
			["Fader 3"]={template="FEffect"},
			["Fader 8"]={template="FVol"},
		},
		["Eq"]={
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["UDVButton 7-5_8-5"]={template="UDFreq"},
			["Button 8-6"]={template="BRedOnOff"},
			["Fader 7"]={template="FGain"},
		},
	},
