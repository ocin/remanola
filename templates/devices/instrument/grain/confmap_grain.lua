	["Grain"]={
		["Default"]={
			["Button 1-2"]={template="BRedOnOff"},
{% include "devices/instrument/grain/"+lptype+"/confmap_mainmenu.lua" %}
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
			["Button 1-2"]={template="BAmpPage"},
			["Button 7-1"]={template="BPerformancePage"},
			["Button 7-2"]={template="BPerformancePage"},
			["Button 7-3"]={template="BPerformancePage"},
			["Button 7-4"]={template="BPerformancePage"},
			["Button 8-1"]={template="BPerformancePage"},
			["Button 8-2"]={template="BPerformancePage"},
			["Button 8-3"]={template="BPerformancePage"},
			["Button 8-4"]={template="BPerformancePage"},
		},
		["Sample"]={
			["Fader 1"]={template="FMisc"},
			["Fader 2"]={template="FMisc"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FGain"},
			["UDVButton 1-5_2-5"]={template="UDOsc", inverted=true},
			["Fader 6"]={template="FFreq"},
			["Fader 7"]={template="FOsc"},
			["Button 1-8"]={template="BRedOnOff"},
		},
		["Grains"]={
			["UDVButton 1-1_2-1"]={template="UDOsc", inverted=true},
{% if lptype == "pro" %}
{% include "devices/instrument/grain/pro/confmap_submenu_osc.lua" %}
{% endif %}
			["Spectral Grains"]={
				["Fader 2"]={template="FOsc"},
				["Fader 3"]={template="FFreq"},
				["Button 1-4"]={template="BRedOnOff"},
				["UDVButton 7-4_8-4"]={template="UDOsc"},
				["Fader 5"]={template="FOsc"},
				["Fader 6"]={template="FEffect"},
				["Fader 7"]={template="FOsc"},
				["Fader 8"]={template="FPerf"},
			},
			["Grain Oscillator"]={
				["Fader 2"]={template="FOsc"},
				["Fader 3"]={template="FOsc"},
				["Fader 4"]={template="FFreq"},
				["Fader 5"]={template="FOsc"},
				["Fader 6"]={template="FEffect"},
				["Fader 7"]={template="FOsc"},
				["Fader 8"]={template="FPerf"},
			},
			["Long Grains"]={
				["Fader 2"]={template="FOsc"},
				["Fader 3"]={template="FOsc"},
				["Fader 5"]={template="FOsc"},
				["Fader 6"]={template="FFreq"},
				["Fader 7"]={template="FOsc"},
			},
			["Tape"]={
				["Fader 6"]={template="FOsc"},
			},
		},
		["Pitch"]={
			["UDVButton 1-2_2-2"]={template="UDFreq"},
			["UDVButton 1-3_2-3"]={template="UDFreq"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
			["Fader 6"]={template="FPerf"},
{% if lptype == "pro" %}
{% include "devices/instrument/grain/pro/confmap_submenu_osc.lua" %}
{% endif %}
		},
		["Osc"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="UDFreq"},
			["UDVButton 1-4_2-4"]={template="UDOsc"},
			["Fader 6"]={template="FOsc"},
{% if lptype == "pro" %}
{% include "devices/instrument/grain/pro/confmap_submenu_osc.lua" %}
{% endif %}
		},
		["Mixer"]={
			["UDVButton 1-2_2-2"]={template="UDAmount", inverted=true},
			["Fader 3"]={template="FVol"},
			["UDVButton 1-5_2-5"]={template="UDAmount"},
			["Fader 6"]={template="FVol"},
{% if lptype == "pro" %}
{% include "devices/instrument/grain/pro/confmap_submenu_amp.lua" %}
{% endif %}
		},
		["Filter"]={
			["UDVButton 1-2_2-2"]={template="UDFreq", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 6"]={template="FEnv"},
			["Fader 7"]={template="FPerf"},
			["Fader 8"]={template="FPerf"},
		},
		["Amp"]={
			["Fader 2"]={template="FGain"},
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FAmount"},
			["Fader 7"]={template="FMisc"},
			["Knob V8"]={template="FGain"},
{% if lptype == "pro" %}
{% include "devices/instrument/grain/pro/confmap_submenu_amp.lua" %}
{% endif %}
		},
{% include "devices/instrument/Shared/europa_grain/confmap_env.lua" %}
{% include "devices/instrument/Shared/europa_grain/confmap_lfo.lua" %}
{% include "devices/instrument/Shared/europa_grain/confmap_effects.lua" %}
{% include "devices/instrument/Shared/europa_grain/confmap_modmatrix.lua" %}
	},
