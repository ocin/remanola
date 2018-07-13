	["MClass Equalizer"]={
		["Default"]={
{% if lptype == "mini" %}
{% include "devices/effect/mclassequalizer/mini/confmap_mainmenu_common.lua" %}
{% else %}
{% include "devices/effect/mclassequalizer/pro/confmap_mainmenu.lua" %}
{% endif %}
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FFreq"},
			["Knob V5"]={template="FGain"},
			["Fader 6"]={template="FMisc"},
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["Button 1-3"]={template="BRedOnOff"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 1-6"]={template="BRedOnOff"},
			["Button 1-7"]={template="BRedOnOff"},
		},
	},
