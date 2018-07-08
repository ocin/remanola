	["PX7"]={
		["Default"]={
{% include "devices/instrument/px7/"+lptype+"/confmap_mainmenu.lua" %}
		},
		["Main"]={
			["UDVButton 1-2_2-2"]={template="FAmount"},
			["Fader 3"]={template="FMisc"},
			["Fader 8"]={template="FGain"},
		},
		["Op*"]={
			["Button 8-2"]={template="BGreenOnOff"},
			["UDVButton 7-3_8-3"]={template="UDFreq"},
			["UDVButton 7-4_8-4"]={template="UDFreq"},
			["UDVButton 7-5_8-5"]={template="UDFreq"},
			["Knob V7"]={template="FGain"},
			["Fader 8"]={template="FGain"},
		},
		["LFO"]={
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FFreq"},
			["UDVButton 7-3_8-3"]={template="UDFreq"},
			["Fader 4"]={template="FMisc"},
			["UDVButton 1-5_2-5"]={template="UDMisc", inverted=true},
		},
	},
