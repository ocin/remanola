	["Parsec"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Main"]={
			["Knob V6"]={template="FVol"},
			["Fader 7"]={template="FEffect"},
			["Fader 8"]={template="FVol"},
		},
		["Perf"]={
			["UDVButton 7-1_8-1"]={template="UDPerf"},
			["UDVButton 7-3_8-3"]={template="UDPerf"},
			["UDVButton 7-5_8-5"]={template="UDPerf"},
			["Fader 6"]={template="FPerf"},
		},
		["Index"]={
			["Button 8-1"]={template="BPerformancePageHigh"},
			["Button 8-2"]={template="BPerformancePageHigh"},
			["Button 8-3"]={template="BPerformancePageHigh"},
			["Button 8-4"]={template="BPerformancePageHigh"},
			["Button 8-5"]={template="BPerformancePageHigh"},
			["Button 8-6"]={template="BPerformancePageHigh"},
			["Button 8-7"]={template="BPerformancePageHigh"},
			["Button 8-8"]={template="BPerformancePageHigh"},
		},
		["Amp Envelope"]={
			["Fader 2"]={template="FVol"},
			["Fader 4"]={template="FVol"},
			["Fader 5"]={template="FVol"},
			["Fader 6"]={template="FVol"},
			["Fader 7"]={template="FVol"},
		},
		["Generator *"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDOsc", inverted=true},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOsc"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
			["UDVButton 3-4_4-4"]={template="UDFreq2"},
			["UDVButton 5-4_6-4"]={template="UDFreq"},
			["Fader 5"]={template="FPerf"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FFreq"},
			["Fader 8"]={template="FPerf"},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_osc.lua" %}
{% endif %}
		},
		["Sound Engine *"]={
			["UDVButton 1-2_2-2"]={template="UDEffect", inverted=true},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["UDVButton 1-5_2-5"]={template="UDEffect", inverted=true},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Reverb"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
			["Fader 8"]={template="FEffect"},
		},
		["Delay"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FFreq"},
			["UDVButton 7-4_8-4"]={template="UDFreq"},
			["Fader 5"]={template="FEffect"},
			["Fader 8"]={template="FEffect"},
		},
		["LFO *"]={
			["UDVButton 1-2_2-2"]={template="UDLFO"},
			["Fader 3"]={template="FEffect"},
			["Button 1-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FFreq"},
			["UDVButton 7-4_8-4"]={template="UDFreq"},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["Env 1"]={
			["Fader 3"]={template="FEnv"},
			["Fader 4"]={template="FEnv"},
			["Fader 5"]={template="FEnv"},
			["Fader 6"]={template="FEnv"},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["Env 2"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEnv"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FEnv"},
			["Fader 7"]={template="FEnv"},
			["Fader 8"]={template="FEnv"},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["Mod Matrix *"]={
			["Button 1-1"]={template="BPerformancePage"},
			["Button 2-1"]={template="BPerformancePage"},
			["Button 3-1"]={template="BPerformancePage"},
			["Button 4-1"]={template="BPerformancePage"},
			["Button 5-1"]={template="BPerformancePage"},
			["Button 6-1"]={template="BPerformancePage"},
			["Button 7-1"]={template="BPerformancePage"},
			["Button 8-1"]={template="BPerformancePage"},
			["UDVButton 1-2_2-2"]={template="UDLFO", inverted=true},
			["Knob V3"]={template="FLFO"},
			["UDVButton 1-4_2-4"]={template="UDEffect", inverted=true},
			["Knob V5"]={template="FEffect"},
			["UDVButton 1-6_2-6"]={template="UDEffect", inverted=true},
			["Knob V7"]={template="FEffect"},
			["UDVButton 1-8_2-8"]={template="UDPerf", inverted=true},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
	},
