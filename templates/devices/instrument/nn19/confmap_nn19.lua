	["NN-19"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
			["Button 1-4"]={template="BPerformancePage"},
		},
		["Main"]={
			["Fader 1"]={template="FMisc"},
			["UDVButton 1-2_2-2"]={template="UDMisc"},
			["Fader 3"]={template="FAmount"},
			["UDVButton 1-4_2-4"]={template="UDAmount", inverted=true},
			["Button 1-5"]={template="BRedOnOff"},
			["UDVButton 1-6_2-6"]={template="UDMisc", inverted=true},
			["UDVButton 1-7_2-7"]={template="UDMisc"},
			["Fader 8"]={template="FGain"},
		},
		["Amp"]={
			["Fader 1"]={template="FGain"},
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
		},
		["Controller"]={
			["Knob V2"]={template="FFreq"},
			["Knob V3"]={template="FMisc"},
			["Knob V4"]={template="FGain"},
			["UDVButton 1-5_2-5"]={template="UDMisc", inverted=true},
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["Mod Wheel"]={
			["Knob V2"]={template="FFreq"},
			["Knob V3"]={template="FEffect"},
			["Knob V4"]={template="FFreq"},
			["Knob V5"]={template="FGain"},
			["Knob V6"]={template="FMisc"},
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["Velocity"]={
			["Knob V2"]={template="FFreq"},
			["Knob V3"]={template="FFreq"},
			["Knob V4"]={template="FGain"},
			["Knob V5"]={template="FGain"},
			["Knob V6"]={template="FAmount"},
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["Osc"]={
			["Fader 1"]={template="FAmount"},
			["Button 1-2"]={template="BRedOnOff"},
			["Knob V3"]={template="FMisc"},
			["UDVButton 1-5_2-5"]={template="UDFreq"},
			["UDVButton 1-6_2-6"]={template="UDFreq"},
			["UDVButton 1-7_2-7"]={template="UDFreq"},
			["Button 1-8"]={template="BRedOnOff"},
		},
		["Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["UDVButton 1-5_2-5"]={template="UDFreq", inverted=true},
			["Fader 6"]={template="FMisc"},
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Filter Envelope"]={
			["Fader 2"]={template="FFreq"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Button 1-6"]={template="BRedOnOff"},
			["Fader 7"]={template="FAmount"},
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["LFO"]={
			["UDVButton 1-2_2-2"]={template="UDMisc", inverted=true},
			["Button 1-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FFreq"},
			["UDVButton 7-4_8-4"]={template="UDFreq"},
			["Fader 5"]={template="FMisc"},
			["UDVButton 1-6_2-6"]={template="UDMisc", inverted=true},
		},
	},
