	["Europa"]={
		["Default"]={
{% include "devices/instrument/europa/"+lptype+"/confmap_mainmenu.lua" %}
		},
		["Main"]={
			["Fader 8"]={template="FGain"},
		},
		["Perf"]={
			["UDVButton 7-1_8-1"]={template="UDPerf2"},
			["UDVButton 7-3_8-3"]={template="UDPerf"},
			["Fader 4"]={template="FPerf"},
			["UDVButton 7-6_8-6"]={template="UDPerf"},
			["UDVButton 7-8_8-8"]={template="UDOsc"},
		},
		["Index"]={
			["Button 7-1"]={template="BPerformancePage"},
			["Button 7-2"]={template="BPerformancePage"},
			["Button 7-3"]={template="BPerformancePage"},
			["Button 7-4"]={template="BPerformancePage"},
			["Button 8-1"]={template="BPerformancePage"},
			["Button 8-2"]={template="BPerformancePage"},
			["Button 8-3"]={template="BPerformancePage"},
			["Button 8-4"]={template="BPerformancePage"},
			["Button 5-5"]={template="BFilterPage"},
			["Button 2-7"]={template="BEffect2Page"},
			["Button 3-7"]={template="BEffect2Page"},
			["Button 4-7"]={template="BEffect2Page"},
		},
		["Mixer"]={
			["Fader 2"]={template="FVol"},
			["Fader 3"]={template="FVol"},
			["Fader 4"]={template="FVol"},
			["Knob V6"]={template="FPan"},
			["Knob V7"]={template="FPan"},
			["Knob V8"]={template="FPan"},
{% include "devices/instrument/europa/pro/confmap_submenu_amp.lua" %}
		},
		["Filter"]={
			["Button 5-1"]={template="BRedOnOff"},
			["Button 6-1"]={template="BRedOnOff"},
			["Button 7-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDFreq", inverted=true},
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FFreq"},
			["UDVButton 1-6_2-6"]={template="UDPerf"},
			["UDVButton 3-6_4-6"]={template="UDLFO"},
			["UDVButton 5-6_6-6"]={template="UDPerf"},
			["UDVButton 3-7_4-7"]={template="UDLFO", inverted=true},
		},
		["Amp"]={
			["Knob V2"]={template="FPan"},
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FPerf"},
			["Fader 5"]={template="FVol"},
			["Fader 6"]={template="FVol"},
			["Fader 7"]={template="FVol"},
			["Fader 8"]={template="FVol"},
{% include "devices/instrument/europa/pro/confmap_submenu_amp.lua" %}
		},
		["Eng *"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="UDFreq"},
			["UDVButton 3-3_4-3"]={template="UDFreq2"},
			["UDVButton 5-3_6-3"]={template="UDFreq"},
			["UDVButton 7-3_8-3"]={template="UDPerf"},
			["UDVButton 1-4_2-4"]={template="UDOsc", inverted=true},
			["Button 8-4"]={template="BRedOnOff"},
			["Fader 5"]={template="FOsc"},
			["UDVButton 7-6_8-6"]={template="UDLFO", inverted=true},
			["Fader 7"]={template="FLFO"},
			["Fader 8"]={template="FPerf"},
{% include "devices/instrument/europa/pro/confmap_submenu_osc.lua" %}
		},
		["Eng * Mod *"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="UDOsc", inverted=true},
			["Fader 4"]={template="FOsc"},
			["Fader 5"]={template="FLFO"},
			["UDVButton 7-6_8-6"]={template="UDLFO", inverted=true},
{% include "devices/instrument/europa/pro/confmap_submenu_osc.lua" %}
		},
		["Eng * Spectral Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 3-2_4-2"]={template="UDFreq", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FPerf"},
			["Fader 6"]={template="FLFO"},
			["UDVButton 7-7_8-7"]={template="UDLFO", inverted=true},
			["Fader 8"]={template="FPerf"},
{% include "devices/instrument/europa/pro/confmap_submenu_osc.lua" %}
		},
		["Eng * Harmonics"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="UDOsc", inverted=true},
			["Fader 4"]={template="FOsc"},
			["Fader 5"]={template="FOsc"},
{% include "devices/instrument/europa/pro/confmap_submenu_osc.lua" %}
		},
		["Eng * Unison"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="UDEffect", inverted=true},
			["UDVButton 1-4_2-4"]={template="UDEffect"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FFreq"},
			["Fader 7"]={template="FEffect"},
{% include "devices/instrument/europa/pro/confmap_submenu_osc.lua" %}
		},
{% include "devices/instrument/Shared/europa_grain/confmap_env.lua" %}
{% include "devices/instrument/Shared/europa_grain/confmap_lfo.lua" %}
{% include "devices/instrument/Shared/europa_grain/confmap_effects.lua" %}
{% include "devices/instrument/Shared/europa_grain/confmap_modmatrix.lua" %}
	},
