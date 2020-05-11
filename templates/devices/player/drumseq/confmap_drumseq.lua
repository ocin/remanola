	["Drum Sequencer"]={
		["Default"]={
{% include "devices/player/drumseq/"+lptype+"/confmap_mainmenu.lua" %}
			-- On/Off
			["Button 1-1"]={template="BGreenOnOff"},
			["Button 1-3"]={template="BBRedOnOff"},
			["Button 1-4"]={template="BBGreenOnOff"},
			["UDVButton 1-3_2-3"]={template="UDPerf"},
			["Knob H3"]={template="FPerf"},
			["Knob H4"]={template="FPerf"},
			["Button 8-1"]={template="BPerfOnOff"},
		},
	},
