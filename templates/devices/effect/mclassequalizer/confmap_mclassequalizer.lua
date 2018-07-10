	["MClass Equalizer"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/mclassequalizer/pro/confmap_mainmenu.lua" %}
{% endif %}
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FFreq"},
			["Knob V5"]={template="FGain"},
			["Fader 6"]={template="FMisc"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 5-8"]={template="BEffectPage"},
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
