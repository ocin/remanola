	["Pulsar"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/utility/pulsar/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Main"]={
			["Button 8-5"]={template="BRedOnOff"},
			["Knob V3"]={template="FMisc"},
			["Knob V4"]={template="FMisc"},
			["Knob V7"]={template="FMisc"},
		},
		["LFO *"]={
			["Button 7-1"]={template="BRedOnOff"},
			["Button 8-1"]={template="BRedOnOff"},
			["UDVButton 7-2_8-2"]={template="UDFreq"},
			["Fader 2"]={template="FFreq"},
			["Fader 4"]={template="FAmount"},
		},
		["Env"]={
			["Button 1-1"]={template="BRedOnOff"},
			["Button 1-2"]={template="BRedOnOff"},
			["Knob V5"]={template="FAmount"},
			["Knob V6"]={template="FFreq"},
			["Knob V7"]={template="FAmount"},
			["Knob V8"]={template="FFreq"},
		},
	},
