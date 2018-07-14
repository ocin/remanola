	["MClass Maximizer"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/mclassmaximizer/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["Knob V3"]={template="FGain"},
			["Button 1-6"]={template="BRedOnOff"},
		},
		["Limiter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 4-2"]={template="BRedOnOff"},
			["Meter 3"]={template="InvMeter"},
			["UDVButton 1-4_2-4"]={template="UDEffect", inverted=true},
			["UDVButton 1-5_2-5"]={template="UDEffect", inverted=true},
			["Knob V6"]={template="FGain"},
		},
		["SoftClip"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
		},
	},
