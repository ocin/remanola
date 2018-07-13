	["Thor"]={
		["Default"]={
{% include "devices/instrument/thor/"+lptype+"/confmap_mainmenu.lua" %}
		},
		["Main"]={
			["Button 8-2"]={template="BRedOnOff"},
			["Button 8-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FMisc"},
			["Fader 5"]={template="FMisc"},
			["Fader 8"]={template="FGain"},
		},
		["Perf"]={
			["UDVButton 1-2_1-2"]={template="UDPerf"},
			["UDVButton 3-2_4-2"]={template="UDPerf2"},
			["UDVButton 5-2_6-2"]={template="UDPerf", inverted=true},
			["UDVButton 7-2_8-2"]={template="UDPerf2"},
			["Fader 3"]={template="FPerf"},
			["Button 1-4"]={template="BGreenOnOff"},
			["Button 2-4"]={template="BGreenOnOff"},
		},
		["Osc *"]={
			["Button 8-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDOsc", inverted=true},
			["UDVButton 1-3_2-3"]={template="UDPerf"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
			["UDVButton 1-5_2-5"]={template="UDFreq"},
			["UDVButton 1-6_2-6"]={template="UDFreq"},
			["Fader 8"]={template="FEffect"},
{% if lptype == "pro" %}
{% include "devices/instrument/thor/pro/confmap_submenu_osc.lua" %}
{% endif %}
			["Analog"]={
				["UDVButton 7-3_8-3"]={template="UDOsc", inverted=true},
				["Fader 7"]={template="FOsc"},
			},
			["Wavetable"]={
				["UDVButton 7-3_8-3"]={template="UDOsc", inverted=true},
				["Button 8-5"]={template="BRedOnOff"},
				["Fader 7"]={template="FOsc"},
			},
			["Phase Modulation"]={
				["UDVButton 7-3_8-3"]={template="UDOsc"},
				["UDVButton 7-4_8-4"]={template="UDOsc"},
				["Fader 7"]={template="FOsc"},
			},
			["FM Pair"]={
				["UDVButton 7-3_8-3"]={template="UDOsc"},
				["UDVButton 7-4_8-4"]={template="UDOsc"},
				["Fader 7"]={template="FOsc"},
			},
			["Multi Oscillator"]={
				["UDVButton 7-3_8-3"]={template="UDOsc", inverted=true},
				["UDVButton 7-5_8-5"]={template="UDOsc", inverted=true},
				["Fader 7"]={template="FOsc"},
			},
			["Noise"]={
				["UDVButton 7-3_8-3"]={template="UDOsc", inverted=true},
				["Fader 7"]={template="FOsc"},
			},
		},
		["Filter *"]={
{% if lptype == "mini" %}
{% include "devices/instrument/thor/mini/confmap_mainmenu_filter.lua" %}
{% else %}
{% include "devices/instrument/thor/pro/confmap_submenu_filter.lua" %}
{% endif %}
			["Button 5-1"]={template="BRedOnOff"},
			["Button 6-1"]={template="BRedOnOff"},
			["Button 7-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDFreq", inverted=true},
			["Button 1-8"]={template="BGreenOnOff"},
			["UDVButton 3-8_4-8"]={template="UDEnv"},
			["UDVButton 5-8_6-8"]={template="UDPerf"},
			["UDVButton 7-8_8-8"]={template="UDPerf2"},
			["Low Pass"]={
				["Fader 3"]={template="FGain"},
				["Fader 4"]={template="FFreq"},
				["Fader 5"]={template="FEffect"},
				["Button 1-6"]={template="BGreenOnOff"},
				["UDVButton 3-6_4-6"]={template="UDFreq", inverted=true},
			},
			["State Variable"]={
				["Fader 3"]={template="FGain"},
				["Fader 4"]={template="FFreq"},
				["Fader 5"]={template="FEffect"},
				["Button 1-6"]={template="BGreenOnOff"},
				["UDVButton 3-6_4-6"]={template="UDFreq", inverted=true},
				["Fader 7"]={template="FEffect"},
			},
			["Comb"]={
				["Fader 3"]={template="FGain"},
				["Fader 4"]={template="FFreq"},
				["Fader 5"]={template="FEffect"},
				["Button 1-6"]={template="BGreenOnOff"},
				["UDVButton 3-6_4-6"]={template="UDFreq", inverted=true},
			},
			["Formant"]={
				["Fader 3"]={template="FGain"},
				["Fader 4"]={template="FEffect"},
				["Fader 6"]={template="FEffect"},
				["Fader 7"]={template="FEffect"},
			},
		},
		["Filter 2"]={
			["Button 8-1"]={template="BRedOnOff"},
		},
		["Filter Env"]={
{% if lptype == "mini" %}
{% include "devices/instrument/thor/mini/confmap_mainmenu_filter.lua" %}
{% else %}
{% include "devices/instrument/thor/pro/confmap_submenu_filter.lua" %}
{% endif %}
			["Button 2-2"]={template="BGreenOnOff"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
		},
		["Mixer"]={
			["Knob V3"]={template="FVol"},
			["Fader 4"]={template="FVol"},
			["Fader 5"]={template="FVol"},
		},
		["Amp"]={
{% if lptype == "pro" %}
{% include "devices/instrument/thor/pro/confmap_submenu_amp.lua" %}
{% endif %}
			["UDVButton 3-2_4-2"]={template="UDGain"},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FPerf"},
			["Fader 4"]={template="FVol"},
			["Knob V5"]={template="FPan"},
		},
		["Amp Env"]={
{% if lptype == "pro" %}
{% include "devices/instrument/thor/pro/confmap_submenu_amp.lua" %}
{% endif %}
			["Button 2-2"]={template="BGreenOnOff"},
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
		},
		["Mod Env"]={
{% if lptype == "pro" %}
{% include "devices/instrument/thor/pro/confmap_submenu_mod.lua" %}
{% endif %}
			["Button 1-1"]={template="BGreenOnOff"},
			["Button 2-1"]={template="BGreenOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEnv"},
			["Fader 5"]={template="FEnv"},
			["Fader 6"]={template="FEnv"},
		},
		["Global Env"]={ -- Global Env
{% if lptype == "pro" %}
{% include "devices/instrument/thor/pro/confmap_submenu_mod.lua" %}
{% endif %}
			["Button 1-1"]={template="BGreenOnOff"},
			["Button 2-1"]={template="BGreenOnOff"},
			["Button 4-1"]={template="BGreenOnOff"},
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FEnv"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEnv"},
			["Fader 6"]={template="FEnv"},
			["Fader 7"]={template="FEnv"},
		},
		["LFO *"]={
{% if lptype == "pro" %}
{% include "devices/instrument/thor/pro/confmap_submenu_mod.lua" %}
{% endif %}
                        ["UDVButton 1-2_2-2"]={template="UDLFO"},
			["Button 1-1"]={template="BGreenOnOff"},
			["Button 2-1"]={template="BGreenOnOff"},
                        ["Fader 3"]={template="FFreq"},
                        ["Fader 4"]={template="FEffect"},
		},
		["LFO 1"]={
                        ["Fader 5"]={template="FPerf"},
		},
		["Step Sequencer"]={
			-- Sequence select
			["Button 1-1"]={template="BRedOnOff"},
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 1-6"]={template="BRedOnOff"},
			["Button 1-7"]={template="BRedOnOff"},
			["Button 1-8"]={template="BRedOnOff"},
			["Button 2-1"]={template="BRedOnOff"},
			["Button 2-2"]={template="BRedOnOff"},
			["Button 2-3"]={template="BRedOnOff"},
			["Button 2-4"]={template="BRedOnOff"},
			["Button 2-5"]={template="BRedOnOff"},
			["Button 2-6"]={template="BRedOnOff"},
			["Button 2-7"]={template="BRedOnOff"},
			["Button 2-8"]={template="BRedOnOff"},
			-- Controls
			["Button 8-1"]={template="BRedOnOff"},
                        ["UDVButton 7-2_8-2"]={template="UDEffect"},
                        ["UDVButton 7-3_8-3"]={template="UDEffect", inverted=true},
			["Button 8-4"]={template="BGreenOnOff"},
                        ["UDVButton 7-5_8-5"]={template="UDFreq"},
                        ["UDVButton 7-6_8-6"]={template="UDAmount"},
                        ["UDVButton 7-7_8-7"]={template="UDFreq", inverted=true},
                        ["UDVButton 7-8_8-8"]={template="UDMisc"},
			-- Sequence Knobs
			["Note"]={
				["UDVButton 3-1_4-1"]={template="UDFreq"},
				["UDVButton 3-2_4-2"]={template="UDFreq"},
				["UDVButton 3-3_4-3"]={template="UDFreq"},
				["UDVButton 3-4_4-4"]={template="UDFreq"},
				["UDVButton 3-5_4-5"]={template="UDFreq"},
				["UDVButton 3-6_4-6"]={template="UDFreq"},
				["UDVButton 3-7_4-7"]={template="UDFreq"},
				["UDVButton 3-8_4-8"]={template="UDFreq"},
				["UDVButton 5-1_6-1"]={template="UDFreq"},
				["UDVButton 5-2_6-2"]={template="UDFreq"},
				["UDVButton 5-3_6-3"]={template="UDFreq"},
				["UDVButton 5-4_6-4"]={template="UDFreq"},
				["UDVButton 5-5_6-5"]={template="UDFreq"},
				["UDVButton 5-6_6-6"]={template="UDFreq"},
				["UDVButton 5-7_6-7"]={template="UDFreq"},
				["UDVButton 5-8_6-8"]={template="UDFreq"},
			},
			["Velocity"]={
				["UDVButton 3-1_4-1"]={template="UDAmount"},
				["UDVButton 3-2_4-2"]={template="UDAmount"},
				["UDVButton 3-3_4-3"]={template="UDAmount"},
				["UDVButton 3-4_4-4"]={template="UDAmount"},
				["UDVButton 3-5_4-5"]={template="UDAmount"},
				["UDVButton 3-6_4-6"]={template="UDAmount"},
				["UDVButton 3-7_4-7"]={template="UDAmount"},
				["UDVButton 3-8_4-8"]={template="UDAmount"},
				["UDVButton 5-1_6-1"]={template="UDAmount"},
				["UDVButton 5-2_6-2"]={template="UDAmount"},
				["UDVButton 5-3_6-3"]={template="UDAmount"},
				["UDVButton 5-4_6-4"]={template="UDAmount"},
				["UDVButton 5-5_6-5"]={template="UDAmount"},
				["UDVButton 5-6_6-6"]={template="UDAmount"},
				["UDVButton 5-7_6-7"]={template="UDAmount"},
				["UDVButton 5-8_6-8"]={template="UDAmount"},
			},
			["GateLen"]={
				["UDVButton 3-1_4-1"]={template="UDEffect"},
				["UDVButton 3-2_4-2"]={template="UDEffect"},
				["UDVButton 3-3_4-3"]={template="UDEffect"},
				["UDVButton 3-4_4-4"]={template="UDEffect"},
				["UDVButton 3-5_4-5"]={template="UDEffect"},
				["UDVButton 3-6_4-6"]={template="UDEffect"},
				["UDVButton 3-7_4-7"]={template="UDEffect"},
				["UDVButton 3-8_4-8"]={template="UDEffect"},
				["UDVButton 5-1_6-1"]={template="UDEffect"},
				["UDVButton 5-2_6-2"]={template="UDEffect"},
				["UDVButton 5-3_6-3"]={template="UDEffect"},
				["UDVButton 5-4_6-4"]={template="UDEffect"},
				["UDVButton 5-5_6-5"]={template="UDEffect"},
				["UDVButton 5-6_6-6"]={template="UDEffect"},
				["UDVButton 5-7_6-7"]={template="UDEffect"},
				["UDVButton 5-8_6-8"]={template="UDEffect"},
			},
			["StepDur"]={
				["UDVButton 3-1_4-1"]={template="UDFreq"},
				["UDVButton 3-2_4-2"]={template="UDFreq"},
				["UDVButton 3-3_4-3"]={template="UDFreq"},
				["UDVButton 3-4_4-4"]={template="UDFreq"},
				["UDVButton 3-5_4-5"]={template="UDFreq"},
				["UDVButton 3-6_4-6"]={template="UDFreq"},
				["UDVButton 3-7_4-7"]={template="UDFreq"},
				["UDVButton 3-8_4-8"]={template="UDFreq"},
				["UDVButton 5-1_6-1"]={template="UDFreq"},
				["UDVButton 5-2_6-2"]={template="UDFreq"},
				["UDVButton 5-3_6-3"]={template="UDFreq"},
				["UDVButton 5-4_6-4"]={template="UDFreq"},
				["UDVButton 5-5_6-5"]={template="UDFreq"},
				["UDVButton 5-6_6-6"]={template="UDFreq"},
				["UDVButton 5-7_6-7"]={template="UDFreq"},
				["UDVButton 5-8_6-8"]={template="UDFreq"},
			},
			["Curve1"]={
				["UDVButton 3-1_4-1"]={template="UDMisc"},
				["UDVButton 3-2_4-2"]={template="UDMisc"},
				["UDVButton 3-3_4-3"]={template="UDMisc"},
				["UDVButton 3-4_4-4"]={template="UDMisc"},
				["UDVButton 3-5_4-5"]={template="UDMisc"},
				["UDVButton 3-6_4-6"]={template="UDMisc"},
				["UDVButton 3-7_4-7"]={template="UDMisc"},
				["UDVButton 3-8_4-8"]={template="UDMisc"},
				["UDVButton 5-1_6-1"]={template="UDMisc"},
				["UDVButton 5-2_6-2"]={template="UDMisc"},
				["UDVButton 5-3_6-3"]={template="UDMisc"},
				["UDVButton 5-4_6-4"]={template="UDMisc"},
				["UDVButton 5-5_6-5"]={template="UDMisc"},
				["UDVButton 5-6_6-6"]={template="UDMisc"},
				["UDVButton 5-7_6-7"]={template="UDMisc"},
				["UDVButton 5-8_6-8"]={template="UDMisc"},
			},
			["Curve2"]={
				["UDVButton 3-1_4-1"]={template="UDMisc"},
				["UDVButton 3-2_4-2"]={template="UDMisc"},
				["UDVButton 3-3_4-3"]={template="UDMisc"},
				["UDVButton 3-4_4-4"]={template="UDMisc"},
				["UDVButton 3-5_4-5"]={template="UDMisc"},
				["UDVButton 3-6_4-6"]={template="UDMisc"},
				["UDVButton 3-7_4-7"]={template="UDMisc"},
				["UDVButton 3-8_4-8"]={template="UDMisc"},
				["UDVButton 5-1_6-1"]={template="UDMisc"},
				["UDVButton 5-2_6-2"]={template="UDMisc"},
				["UDVButton 5-3_6-3"]={template="UDMisc"},
				["UDVButton 5-4_6-4"]={template="UDMisc"},
				["UDVButton 5-5_6-5"]={template="UDMisc"},
				["UDVButton 5-6_6-6"]={template="UDMisc"},
				["UDVButton 5-7_6-7"]={template="UDMisc"},
				["UDVButton 5-8_6-8"]={template="UDMisc"},
			},
		},
		["Effects"]={
{% if lptype == "mini" %}
			["Button 1-8"]={template="BEffectPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
{% else %}
			["Button 8-1"]={template="BEffectPage"},
			["Button 8-2"]={template="BEffectPage"},
			["Button 8-3"]={template="BEffectPage"},
{% include "devices/instrument/thor/pro/confmap_submenu_effects.lua" %}
{% endif %}
		},
		["Shaper"]={
			["Button 1-1"]={template="BGreenOnOff"},
                        ["UDVButton 5-2_6-2"]={template="UDEffect", inverted=true},
                        ["Fader 3"]={template="FEffect"},
			["UDVButton 7-4_8-4"]={template="UDAmount"},
{% if lptype == "mini" %}
{% include "devices/instrument/thor/mini/confmap_mainmenu_effects.lua" %}
{% else %}
{% include "devices/instrument/thor/pro/confmap_submenu_effects.lua" %}
{% endif %}
		},
		["Delay"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["Button 4-1"]={template="BGreenOnOff"},
                        ["Fader 3"]={template="FFreq"},
                        ["Fader 4"]={template="FEffect"},
                        ["Fader 5"]={template="FFreq"},
                        ["Fader 6"]={template="FAmount"},
                        ["Fader 7"]={template="FEffect"},
{% if lptype == "mini" %}
{% include "devices/instrument/thor/mini/confmap_mainmenu_effects.lua" %}
{% else %}
{% include "devices/instrument/thor/pro/confmap_submenu_effects.lua" %}
{% endif %}
		},
		["Chorus"]={
			["Button 1-1"]={template="BGreenOnOff"},
                        ["Fader 3"]={template="FFreq"},
                        ["Fader 4"]={template="FEffect"},
                        ["Fader 5"]={template="FFreq"},
                        ["Fader 6"]={template="FAmount"},
                        ["Fader 7"]={template="FEffect"},
{% if lptype == "mini" %}
{% include "devices/instrument/thor/mini/confmap_mainmenu_effects.lua" %}
{% else %}
{% include "devices/instrument/thor/pro/confmap_submenu_effects.lua" %}
{% endif %}
		},
	},
