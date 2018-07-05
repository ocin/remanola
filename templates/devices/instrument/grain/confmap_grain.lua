	["Grain"]={
		["Default"]={
			["Button 1-2"]={template="BRedOnOff"},
{% include "devices/instrument/grain/"+lptype+"/confmap_leftmenu.lua" %}
		},
		["Main"]={
			["Fader 3"]={template="FMisc"},
			["UDVButton 7-7_7-7"]={template="UDFreq"},
			["Fader 8"]={template="FGain"},
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
			["UDVButton 1-5_2-5"]={template="UDAmount", inverted=true},
			["Fader 6"]={template="FFreq"},
			["Fader 7"]={template="FEffect"},
			["Button 1-8"]={template="BRedOnOff"},
		},
		["Grains"]={
			["UDVButton 1-1_2-1"]={template="UDAmount", inverted=true},
{% if lptype == "pro" %}
{% include "devices/instrument/grain/pro/confmap_bottommenu_osc.lua" %}
{% endif %}
			["Spectral Grains"]={
				["Fader 2"]={template="FAmount"},
				["Fader 3"]={template="FFreq"},
				["Button 1-4"]={template="BRedOnOff"},
				["UDVButton 7-4_8-4"]={template="UDAmount"},
				["Fader 5"]={template="FMisc"},
				["Fader 6"]={template="FEffect"},
				["Fader 7"]={template="FFreq"},
				["Fader 8"]={template="FMisc"},
			},
			["Grain Oscillator"]={
				["Fader 2"]={template="FGain"},
				["Fader 3"]={template="FEffect"},
				["Fader 4"]={template="FAmount"},
				["Fader 5"]={template="FAmount"},
				["Fader 6"]={template="FEffect"},
				["Fader 7"]={template="FFreq"},
				["Fader 8"]={template="FMisc"},
			},
			["Long Grains"]={
				["Fader 2"]={template="FGain"},
				["Fader 3"]={template="FEffect"},
				["Fader 4"]={template="FAmount"},
				["Fader 5"]={template="FAmount"},
				["Fader 6"]={template="FAmount"},
			},
			["Tape"]={
				["Fader 6"]={template="FAmount"},
			},
		},
		["Pitch"]={
			["UDVButton 1-2_2-2"]={template="UDFreq"},
			["UDVButton 1-3_2-3"]={template="UDFreq"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
			["Fader 6"]={template="FMisc"},
{% if lptype == "pro" %}
{% include "devices/instrument/grain/pro/confmap_bottommenu_osc.lua" %}
{% endif %}
		},
		["Osc"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="UDFreq"},
			["UDVButton 1-4_2-4"]={template="UDAmount"},
			["Fader 6"]={template="FMisc"},
{% if lptype == "pro" %}
{% include "devices/instrument/grain/pro/confmap_bottommenu_osc.lua" %}
{% endif %}
		},
		["Mixer"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FGain"},
			["Button 1-4"]={template="BRedOnOff"},
			["Fader 5"]={template="FGain"},
{% if lptype == "pro" %}
{% include "devices/instrument/grain/pro/confmap_bottommenu_amp.lua" %}
{% endif %}
		},
		["Filter"]={
			["UDVButton 1-2_2-2"]={template="UDFreq", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["UDVButton 1-6_2-6"]={template="UDMisc"},
			["UDVButton 1-7_2-7"]={template="UDMisc"},
			["UDVButton 2-8_1-8"]={template="UDMisc"},
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
{% include "devices/instrument/grain/pro/confmap_bottommenu_amp.lua" %}
{% endif %}
		},
{% include "devices/instrument/Shared/europa_grain/confmap_env.lua" %}
{% include "devices/instrument/Shared/europa_grain/confmap_lfo.lua" %}
{% include "devices/instrument/Shared/europa_grain/confmap_effects.lua" %}
{% include "devices/instrument/Shared/europa_grain/confmap_modmatrix.lua" %}
	},
