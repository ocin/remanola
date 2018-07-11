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
			["UDVButton 7-1_8-1"]={template="UDMisc"},
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FMisc"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FMisc"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FGain"},
		},
		["Filter"]={
			["UDVButton 1-2_2-2"]={template="UDFreq"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Knob V7"]={template="FMisc"},
			["Knob V8"]={template="FMisc"},
		},
		["Follower"]={
			["Button 8-1"]={template="BRedOnOff"},
			["Fader 2"]={template="FEffect"},
			["Fader 4"]={template="FMisc"},
			["Fader 5"]={template="FMisc"},
		},
		["Tremor"]={
			["Fader 2"]={template="FFreq"},
			["UDVButton 7-2_8-2"]={template="UDFreq"},
			["Button 1-3"]={template="BGreenOnOff"},
			["UDVButton 1-4_2-4"]={template="UDEffect"},
			["Button 1-5"]={template="BGreenOnOff"},
			["Fader 6"]={template="FMisc"},
			["Knob V8"]={template="FMisc"},
		},
	},
