	["Dual Arpeggio"]={
		["Default"]={
{% include "devices/player/dualarpeggio/"+lptype+"/confmap_mainmenu.lua" %}
			-- On
			["Button 1-1"]={template="BGreenOnOff"},
			-- Hold
			["Button 1-5"]={template="BRedOnOff"},
		},
		["Arp *"]={
			-- Arp On
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 1-3_2-3"]={template="UDPerf"},
			["UDVButton 1-5_2-5"]={template="UDPerf"},
			["UDVButton 3-1_4-1"]={template="UDPerf"},
			["UDVButton 3-3_4-3"]={template="UDPerf"},
			["UDVButton 3-5_4-5"]={template="UDPerf"},
			["Button 3-6"]={template="BGreenOnOff"},
			["Button 5-1"]={template="BGreenOnOff"},
			["UDVButton 5-2_6-2"]={template="UDPerf"},
			["Button 5-4"]={template="BGreenOnOff"},
			["Button 5-6"]={template="BGreenOnOff"},
			["UDVButton 7-1_8-1"]={template="UDPerf"},
			["UDVButton 7-3_8-3"]={template="UDPerf"},
			["UDVButton 7-5_8-5"]={template="UDPerf"},
		},
	},
