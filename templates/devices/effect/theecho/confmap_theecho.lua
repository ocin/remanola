	["The Echo"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/theecho/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["UDVButton 1-2_2-2"]={template="UDEffect"},
			["Button 1-3"]={template="BYellowOnOff"},
			["Fader 4"]={template="FEffect"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
		},
		["Delay"]={
			["Fader 2"]={template="FFreq"},
			["UDVButton 7-2_8-2"]={template="UDFreq"},
			["Fader 3"]={template="FFreq"},
			["Button 1-4"]={template="BYellowOnOff"},
			["Button 4-4"]={template="BYellowOnOff"},
			["Button 8-5"]={template="BYellowOnOff"},
			["Knob V6"]={template="FEffect"},
		},
		["Feedback"]={
			["Fader 2"]={template="FEffect"},
			["Knob V3"]={template="FEffect"},
			["Button 1-5"]={template="BYellowOnOff"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FAmount"},
		},
		["Color"]={
			["Fader 2"]={template="FAmount"},
			["UDVButton 1-3_2-3"]={template="UDEffect"},
			["Button 1-5"]={template="BYellowOnOff"},
			["Fader 6"]={template="FFreq"},
			["Fader 7"]={template="FEffect"},
		},
		["Modulation"]={
			["Knob V2"]={template="FEnv"},
			["Fader 3"]={template="FEffect"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FLFO"},
		},
	},
