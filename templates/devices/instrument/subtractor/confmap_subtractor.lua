	["Subtractor"]={
		["Default"]={
{% include "devices/instrument/subtractor/"+lptype+"/confmap_mainmenu.lua" %}
		},
		["Index"]={
			["Button 1-3"]={template="BPerformancePage"},
			["Button 1-4"]={template="BPerformancePage"},
		},
		["Main"]={
			["Fader 8"]={template="FGain"},
		},
		["Perf"]={
			["UDVButton 7-3_8-3"]={template="UDPerf", inverted=true},
			["Fader 4"]={template="FPerf"},
			["UDVButton 7-5_8-5"]={template="UDPerf"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["Osc *"]={
			["Knob V2"]={template="FOsc"},
			["UDVButton 1-3_2-3"]={template="UDOsc2", inverted=true},
			["UDVButton 3-3_4-3"]={template="UDOsc"},
			["UDVButton 3-4_4-4"]={template="UDFreq"},
			["UDVButton 3-5_4-5"]={template="UDFreq"},
			["UDVButton 3-6_4-6"]={template="UDFreq"},
			["Button 8-3"]={template="BRedOnOff"},
			["Button 8-6"]={template="BRedOnOff"},
			["Fader 7"]={template="FOsc"},
			["Knob V8"]={template="FVol"},
		},
		["Osc 2"]={
			["Button 8-1"]={template="BRedOnOff"},
		},
		["Noise"]={
			["Button 8-1"]={template="BRedOnOff"},
			["Fader 2"]={template="FFreq"},
			["Fader 3"]={template="FOsc"},
			["Fader 4"]={template="FVol"},
		},
		["Filter"]={
			["Fader 2"]={template="FFreq"},
			["Fader 3"]={template="FEffect"},
			["UDVButton 1-4_2-4"]={template="UDFreq",inverted=true},
			["Fader 5"]={template="FPerf"},
			["Button 8-6"]={template="BRedOnOff"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Filter 2"]={
			["Button 8-1"]={template="BRedOnOff"},
			["Fader 2"]={template="FFreq"},
			["Fader 3"]={template="FEffect"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Filter Env"]={
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
			["Button 8-7"]={template="BRedOnOff"},
			["Fader 8"]={template="FEnv"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Amp Env"]={
			["Fader 3"]={template="FVol"},
			["Fader 4"]={template="FVol"},
			["Fader 5"]={template="FVol"},
			["Fader 6"]={template="FVol"},
			["Fader 8"]={template="FVol"},
		},
		["Mod Env"]={
			["Fader 2"]={template="FEnv"},
			["Fader 3"]={template="FEnv"},
			["Fader 4"]={template="FEnv"},
			["Fader 5"]={template="FEnv"},
			["UDVButton 5-7_6-7"]={template="UDEnv", inverted=true},
			["Button 8-7"]={template="BRedOnOff"},
			["Fader 8"]={template="FEnv"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["LFO 1"]={
			["UDVButton 1-2_2-2"]={template="UDLFO", inverted=true},
			["UDVButton 1-3_2-3"]={template="UDLFO", inverted=true},
			["Button 8-4"]={template="BRedOnOff"},
			["Fader 5"]={template="FFreq"},
			["Fader 8"]={template="FLFO"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["LFO 2"]={
			["UDVButton 1-2_2-2"]={template="UDLFO", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FPerf"},
			["Fader 5"]={template="FEffect"},
			["Fader 8"]={template="FLFO"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["Velocity 1"]={
			["Knob V3"]={template="FVol"},
			["Knob V4"]={template="FOsc"},
			["Knob V5"]={template="FEnv"},
			["Knob V6"]={template="FOsc"},
{% if lptype == "mini" %}
			["Button 2-1"]={template="BPerformancePage"},
			["Button 3-1"]={template="BPerformancePage"},
{% else %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["Velocity 2"]={
			["Knob V3"]={template="FFreq"},
			["Knob V4"]={template="FFreq"},
			["Knob V5"]={template="FFreq"},
			["Knob V6"]={template="FVol"},
			["Knob V7"]={template="FVol"},
{% if lptype == "mini" %}
			["Button 2-1"]={template="BPerformancePage"},
			["Button 3-1"]={template="BPerformancePage"},
{% else %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["ModWheel Control"]={
			["Knob V3"]={template="FFreq"},
			["Knob V4"]={template="FEffect"},
			["Knob V5"]={template="FLFO"},
			["Knob V6"]={template="FOsc"},
			["Knob V7"]={template="FOsc"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["ExtMod"]={
			["UDVButton 7-2_8-2"]={template="UDPerf", inverted=true},
			["Knob V3"]={template="FFreq"},
			["Knob V4"]={template="FLFO"},
			["Knob V5"]={template="FVol"},
			["Knob V6"]={template="FOsc"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
	},
