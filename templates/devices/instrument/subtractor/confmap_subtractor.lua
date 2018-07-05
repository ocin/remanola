	["Subtractor"]={
		["Default"]={
{% include "devices/instrument/subtractor/"+lptype+"/confmap_mainmenu.lua" %}
		},
		["Index"]={
			["Button 1-3"]={template="BPerformancePage"},
			["Button 1-4"]={template="BPerformancePage"},
		},
		["Main"]={
			["Button 8-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FMisc"},
			["Fader 8"]={template="FGain"},
		},
		["Osc *"]={
			["Knob V2"]={template="FAmount"},
			["UDVButton 1-3_2-3"]={template="UDAmount", inverted=true},
			["UDVButton 3-3_4-3"]={template="UDAmount"},
			["UDVButton 3-4_4-4"]={template="UDFreq"},
			["UDVButton 3-5_4-5"]={template="UDFreq"},
			["UDVButton 3-6_4-6"]={template="UDFreq"},
			["Button 8-3"]={template="BRedOnOff"},
			["Button 8-6"]={template="BRedOnOff"},
			["Fader 7"]={template="FAmount"},
			["Knob V8"]={template="FGain"},
		},
		["Osc 2"]={
			["Button 8-1"]={template="BRedOnOff"},
		},
		["Noise"]={
			["Button 8-1"]={template="BRedOnOff"},
			["Fader 2"]={template="FFreq"},
			["Fader 3"]={template="FAmount"},
			["Fader 4"]={template="FGain"},
		},
		["Filter"]={
			["Fader 2"]={template="FFreq"},
			["Fader 3"]={template="FEffect"},
			["UDVButton 5-4_6-4"]={template="UDFreq",inverted=true},
			["Fader 5"]={template="FMisc"},
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
			["Fader 8"]={template="FAmount"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Amp Env"]={
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
		},
		["Mod Env"]={
			["Fader 2"]={template="FMisc"},
			["Fader 3"]={template="FMisc"},
			["Fader 4"]={template="FMisc"},
			["Fader 5"]={template="FMisc"},
			["Fader 6"]={template="FAmount"},
			["UDVButton 5-7_6-7"]={template="UDMisc", inverted=true},
			["Button 8-7"]={template="BRedOnOff"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["LFO 1"]={
			["UDVButton 3-2_4-2"]={template="UDMisc", inverted=true},
			["UDVButton 7-2_8-2"]={template="UDMisc", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FAmount"},
			["Button 8-5"]={template="BRedOnOff"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["LFO 2"]={
			["UDVButton 7-2_8-2"]={template="UDMisc", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FAmount"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FMisc"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["Velocity 1"]={
			["Knob V3"]={template="FGain"},
			["Knob V4"]={template="FAmount"},
			["Knob V5"]={template="FMisc"},
			["Knob V6"]={template="FAmount"},
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
			["Knob V6"]={template="FGain"},
			["Knob V7"]={template="FGain"},
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
			["Knob V5"]={template="FMisc"},
			["Knob V6"]={template="FAmount"},
			["Knob V7"]={template="FAmount"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["ExtMod"]={
			["UDVButton 7-2_8-2"]={template="UDPerf", inverted=true},
			["Knob V3"]={template="FFreq"},
			["Knob V4"]={template="FMisc"},
			["Knob V5"]={template="FGain"},
			["Knob V6"]={template="FAmount"},
{% if lptype == "pro" %}
{% include "devices/instrument/subtractor/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
	},
