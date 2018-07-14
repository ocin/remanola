	["RPG-8"]={
		["Default"]={
{% if lptype == "mini" %}
{% include "devices/utility/rpg8/mini/confmap_mainmenu_common.lua" %}
{% else %}
{% include "devices/utility/rpg8/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Main"]={
			-- MIDI-CV Coverter
			["Fader 2"]={template="FPerf"},
			["Button 1-3"]={template="BRedOnOff"},
			["UDVButton 3-3_4-3"]={template="UDFreq"},
			-- Arpeggiator
			["Button 1-4"]={template="BRedOnOff"},
			["UDVButton 3-4_4-4"]={template="UDEffect"},
			["UDVButton 5-4_6-4"]={template="UDFreq"},
			["UDVButton 7-4_8-4"]={template="UDEffect"},
			-- Sync and Time
			["Button 8-5"]={template="BRedOnOff"},
			["UDVButton 7-6_8-6"]={template="UDFreq"},
			["Fader 6"]={template="FFreq"},
			["Button 8-7"]={template="BRedOnOff"},
			["Fader 8"]={template="FEffect"},
		},
		["Pattern"]={
			-- Pattern Step
			["Button 1-1"]={template="BRedOnOff"},
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 1-6"]={template="BRedOnOff"},
			["Button 1-7"]={template="BRedOnOff"},
			["Button 1-8"]={template="BRedOnOff"},
			["Button 2-1"]={template="BRedOnOff"},
			["Button 2-2"]={template="BRedOnOff"},
			["Button 2-3"]={template="BRedOnOff"},
			["Button 2-4"]={template="BRedOnOff"},
			["Button 2-5"]={template="BRedOnOff"},
			["Button 2-6"]={template="BRedOnOff"},
			["Button 2-7"]={template="BRedOnOff"},
			["Button 2-8"]={template="BRedOnOff"},
			-- Pattern Enable
			["Button 3-1"]={template="BRedOnOff"},
			-- Pattern Length Up
			["UDVButton 3-8_4-8"]={template="UDPerf"},
			-- Shuffle
			["Button 8-1"]={template="BRedOnOff"},
		},
	},
