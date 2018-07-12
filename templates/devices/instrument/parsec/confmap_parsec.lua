	["Parsec"]={
		["Default"]={
			["Knob V6"]={template="FGain"},
			["Fader 7"]={template="FMisc"},
			["Fader 8"]={template="FGain"},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
			["Button 8-1"]={template="BPerformancePage"},
			["Button 8-2"]={template="BPerformancePage"},
			["Button 8-3"]={template="BPerformancePage"},
			["Button 8-4"]={template="BPerformancePage"},
			["Button 8-5"]={template="BPerformancePage"},
			["Button 8-6"]={template="BPerformancePage"},
			["Button 8-7"]={template="BPerformancePage"},
			["Button 8-8"]={template="BPerformancePage"},
		},
		["Amp Envelope"]={
			["Fader 2"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
			["Fader 7"]={template="FGain"},
		},
		["Generator *"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDAmount", inverted=true},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FAmount"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
			["UDVButton 3-4_4-4"]={template="UDFreq2"},
			["UDVButton 5-4_6-4"]={template="UDFreq"},
			["Fader 5"]={template="FMisc"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FFreq"},
			["Fader 8"]={template="FMisc"},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_osc.lua" %}
{% endif %}
		},
		["Sound Engine *"]={
			["UDVButton 1-2_2-2"]={template="UDFreq", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["UDVButton 1-5_2-5"]={template="UDFreq", inverted=true},
			["Fader 6"]={template="FFreq"},
			["Fader 7"]={template="FEffect"},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Reverb"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FAmount"},
			["Fader 7"]={template="FGain"},
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
			["UDVButton 1-2_2-2"]={template="UDMisc"},
			["Fader 3"]={template="FEffect"},
			["Button 1-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FFreq"},
			["UDVButton 7-4_8-4"]={template="UDFreq"},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["Env 1"]={
			["Fader 3"]={template="FMisc"},
			["Fader 4"]={template="FMisc"},
			["Fader 5"]={template="FMisc"},
			["Fader 6"]={template="FMisc"},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["Env 2"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FMisc"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FMisc"},
			["Fader 6"]={template="FMisc"},
			["Fader 6"]={template="FMisc"},
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
			["UDVButton 1-2_2-2"]={template="UDAmount", inverted=true},
			["Knob V3"]={template="FAmount"},
			["UDVButton 1-4_2-4"]={template="UDEffect", inverted=true},
			["Knob V5"]={template="FEffect"},
			["UDVButton 1-6_2-6"]={template="UDEffect", inverted=true},
			["Knob V7"]={template="FEffect"},
			["UDVButton 1-8_2-8"]={template="UDMisc", inverted=true},
{% if lptype == "pro" %}
{% include "devices/instrument/parsec/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
	},
