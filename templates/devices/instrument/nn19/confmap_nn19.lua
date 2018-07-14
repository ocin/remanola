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
			["Fader 8"]={template="FVol"},
		},
		["Perf"]={
			["Fader 1"]={template="FPerf"},
			["UDVButton 1-2_2-2"]={template="UDPerf"},
			["Fader 3"]={template="FEffect"},
			["UDVButton 1-4_2-4"]={template="UDEffect", inverted=true},
			["Button 1-5"]={template="BRedOnOff"},
			["UDVButton 1-6_2-6"]={template="UDPerf", inverted=true},
			["UDVButton 1-7_2-7"]={template="UDPerf"},
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["Amp"]={
			["Fader 1"]={template="FVol"},
			["Fader 3"]={template="FVol"},
			["Fader 4"]={template="FVol"},
			["Fader 5"]={template="FVol"},
			["Fader 6"]={template="FVol"},
		},
		["Controller"]={
			["Knob V2"]={template="FFreq"},
			["Knob V3"]={template="FLFO"},
			["Knob V4"]={template="FVol"},
			["UDVButton 1-5_2-5"]={template="UDPerf", inverted=true},
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["Mod Wheel"]={
			["Knob V2"]={template="FFreq"},
			["Knob V3"]={template="FEffect"},
			["Knob V4"]={template="FFreq"},
			["Knob V5"]={template="FVol"},
			["Knob V6"]={template="FLFO"},
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["Velocity"]={
			["Knob V2"]={template="FFreq"},
			["Knob V3"]={template="FFreq"},
			["Knob V4"]={template="FVol"},
			["Knob V5"]={template="FVol"},
			["Knob V6"]={template="FOsc"},
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["Osc"]={
			["Fader 1"]={template="FOsc"},
			["Button 1-2"]={template="BRedOnOff"},
			["Knob V3"]={template="FEnv"},
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
			["Fader 6"]={template="FPerf"},
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
			["Fader 7"]={template="FEnv"},
{% if lptype == "pro" %}
{% include "devices/instrument/nn19/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["LFO"]={
			["UDVButton 1-2_2-2"]={template="UDLFO", inverted=true},
			["Button 1-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FFreq"},
			["UDVButton 7-4_8-4"]={template="UDFreq"},
			["Fader 5"]={template="FLFO"},
			["UDVButton 1-6_2-6"]={template="UDLFO", inverted=true},
		},
	},
