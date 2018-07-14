	["Pulveriser"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/pulveriser/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["UDVButton 7-1_8-1"]={template="UDPerf"},
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FEnv"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FOsc"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FVol"},
		},
		["Filter"]={
			["UDVButton 1-2_2-2"]={template="UDFreq"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Knob V7"]={template="FLFO"},
			["Knob V8"]={template="FEnv"},
		},
		["Follower"]={
			["Button 8-1"]={template="BRedOnOff"},
			["Fader 2"]={template="FEffect"},
			["Fader 4"]={template="FEnv"},
			["Fader 5"]={template="FEnv"},
		},
		["Tremor"]={
			["Fader 2"]={template="FFreq"},
			["UDVButton 7-2_8-2"]={template="UDFreq"},
			["Button 1-3"]={template="BGreenOnOff"},
			["UDVButton 1-4_2-4"]={template="UDEffect"},
			["Button 1-5"]={template="BGreenOnOff"},
			["Fader 6"]={template="FEffect"},
			["Knob V8"]={template="FVol"},
		},
	},
