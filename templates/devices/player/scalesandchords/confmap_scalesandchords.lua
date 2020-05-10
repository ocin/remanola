	["Scales & Chords"]={
		["Default"]={
{% include "devices/player/scalesandchords/"+lptype+"/confmap_mainmenu.lua" %}
			-- On/Off
			["Button 1-1"]={template="BGreenOnOff"},
			-- Filter Notes
			["Button 1-5"]={template="BPerfOnOff"},
		},
		["Scales"]={
			["UDVButton 1-1_2-1"]={template="UDPerf"},
			["UDVButton 1-5_2-5"]={template="UDPerf"},
		},
		["Chords"]={
			["Button 1-1"]={template="BPerfOnOff"},
			["UDVButton 3-1_4-1"]={template="UDPerf"},
			["UDVButton 3-3_4-3"]={template="UDPerf"},
			["Button 3-5"]={template="BPerfOnOff"},
			["Button 2-7"]={template="BPerfOnOff"},
			["Button 3-7"]={template="BPerfOnOff"},
			["Button 4-7"]={template="BPerfOnOff"},
			["Button 3-8"]={template="BGreenOnOff"},
		},
	},
