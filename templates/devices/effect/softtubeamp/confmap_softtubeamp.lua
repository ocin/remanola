	["Softtube Amp"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/softtubeamp/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["UDVButton 1-2_2-2"]={template="UDEffect"},
			["UDVButton 5-2_6-2"]={template="UDEffect"},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FGain"},
			["Fader 7"]={template="FGain"},
			["Fader 8"]={template="FGain"},
		},
		["Eq"]={
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
		},
	},
