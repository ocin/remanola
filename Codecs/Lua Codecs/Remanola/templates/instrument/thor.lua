	["Thor"]={
		["Default"]={
{% if lptype == "mini" %}
			["Button 1-1"]={template="BMainPage"},
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
{% endif %}
			["Button B1"]={template="BMainPage"},
			["Button B2"]={template="BOscPage"},
			["Button B3"]={template="BOscPage"},
			["Button B4"]={template="BOscPage"},
			["Button B5"]={template="BFilterPage"},
			["Button B6"]={template="BFilterPage"},
			["Button B7"]={template="BFilterPage"},
			["Button B8"]={template="BEffectPage"},
		},
		["Main"]={
			["UDVButton 1-2_1-2"]={template="UDMisc"},
			["UDVButton 3-2_4-2"]={template="UDMisc2"},
			["UDVButton 5-2_6-2"]={template="UDMisc", inverted=true},
			["UDVButton 7-2_8-2"]={template="UDMisc2"},
			["Fader 3"]={template="FMisc"},
			["Button 1-4"]={template="BGreenOnOff"},
			["Button 2-4"]={template="BGreenOnOff"},
			["Button 8-4"]={template="BRedOnOff"},
			["Button 8-5"]={template="BRedOnOff"},
			["Fader 6"]={template="FMisc"},
			["Fader 7"]={template="FMisc"},
			["Fader 8"]={template="FGain"},
		},
		["Osc *"]={
			["UDVButton 1-2_2-2"]={template="UDAmount", inverted=true},
			["UDVButton 1-3_2-3"]={template="UDMisc"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
			["UDVButton 1-5_2-5"]={template="UDFreq"},
			["UDVButton 1-6_2-6"]={template="UDFreq"},
			["Fader 8"]={template="FEffect"},
			["Analog"]={
				["UDVButton 7-3_8-3"]={template="UDMisc", inverted=true},
				["Fader 7"]={template="FAmount"},
			},
			["Wavetable"]={
				["UDVButton 7-3_8-3"]={template="UDAmount", inverted=true},
				["Button 8-5"]={template="BRedOnOff"},
				["Fader 7"]={template="FAmount"},
			},
			["Phase Modulation"]={
				["UDVButton 7-3_8-3"]={template="UDAmount"},
				["UDVButton 7-4_8-4"]={template="UDAmount"},
				["Fader 7"]={template="FAmount"},
			},
			["FM Pair"]={
				["UDVButton 7-3_8-3"]={template="UDAmount"},
				["UDVButton 7-4_8-4"]={template="UDAmount"},
				["Fader 7"]={template="FAmount"},
			},
			["Multi Oscillator"]={
				["UDVButton 7-3_8-3"]={template="UDAmount", inverted=true},
				["UDVButton 7-5_8-5"]={template="UDAmount", inverted=true},
				["Fader 7"]={template="FAmount"},
			},
			["Noise"]={
				["UDVButton 7-3_8-3"]={template="UDAmount", inverted=true},
				["Fader 7"]={template="FAmount"},
			},
		},
		["Filter *"]={
			["Button 2-1"]={template="BFilterPage"},
			["Button 3-1"]={template="BFilterPage"},
			["Button 4-1"]={template="BFilterPage"},
			["Button 5-1"]={template="BRedOnOff"},
			["Button 6-1"]={template="BRedOnOff"},
			["Button 7-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDFreq", inverted=true},
			["Low Pass"]={
				["Fader 3"]={template="FGain"},
				["Fader 4"]={template="FFreq"},
				["Fader 5"]={template="FEffect"},
				["Button 1-6"]={template="BGreenOnOff"},
				["UDVButton 3-6_4-6"]={template="UDFreq", inverted=true},
				["Button 1-8"]={template="BGreenOnOff"},
				["UDVButton 3-8_4-8"]={template="FMisc"},
				["UDVButton 5-8_6-8"]={template="FMisc"},
				["UDVButton 7-8_8-8"]={template="FMisc"},
			},
			["State Variable"]={
				["Fader 3"]={template="FGain"},
				["Fader 4"]={template="FFreq"},
				["Fader 5"]={template="FEffect"},
				["Button 1-6"]={template="BGreenOnOff"},
				["UDVButton 3-6_4-6"]={template="UDFreq", inverted=true},
				["Fader 7"]={template="FEffect"},
				["Button 1-8"]={template="BGreenOnOff"},
				["UDVButton 3-8_4-8"]={template="FMisc"},
				["UDVButton 5-8_6-8"]={template="FMisc"},
				["UDVButton 7-8_8-8"]={template="FMisc"},
			},
			["Comb"]={
				["Fader 3"]={template="FGain"},
				["Fader 4"]={template="FFreq"},
				["Fader 5"]={template="FEffect"},
				["Button 1-6"]={template="BGreenOnOff"},
				["UDVButton 3-6_4-6"]={template="UDFreq", inverted=true},
				["UDVButton 3-8_4-8"]={template="FMisc"},
				["UDVButton 5-8_6-8"]={template="FMisc"},
				["UDVButton 7-8_8-8"]={template="FMisc"},
			},
			["Formant"]={
				["Fader 3"]={template="FGain"},
				["Fader 4"]={template="FEffect"},
				["Fader 6"]={template="FEffect"},
				["Fader 7"]={template="FEffect"},
				["UDVButton 3-8_4-8"]={template="FMisc"},
				["UDVButton 5-8_6-8"]={template="FMisc"},
				["UDVButton 7-8_8-8"]={template="FMisc"},
			},
		},
		["Filter 2"]={
			["Button 8-1"]={template="BRedOnOff"},
		},
		["Filter Env"]={
			["Button 2-2"]={template="BGreenOnOff"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
		},
		["Mixer"]={
			["Knob V3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
		},
		["Amp"]={
			["UDVButton 3-2_4-2"]={template="UDGain"},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FMisc"},
			["Fader 4"]={template="FGain"},
			["Knob V5"]={template="FGain"},
		},
		["Amp Env"]={
			["Button 2-2"]={template="BGreenOnOff"},
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
		},
		["Mod Env"]={
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FMisc"},
			["Fader 5"]={template="FMisc"},
			["Fader 6"]={template="FMisc"},
		},
		["Global Env"]={ -- Global Env
			["Button 2-1"]={template="BGreenOnOff"},
			["Button 3-1"]={template="BGreenOnOff"},
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FMisc"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FMisc"},
			["Fader 6"]={template="FMisc"},
			["Fader 7"]={template="FMisc"},
		},
		["LFO *"]={
                        ["UDVButton 3-1_4-1"]={template="UDMisc"},
			["Button 6-1"]={template="BGreenOnOff"},
			["Button 7-1"]={template="BGreenOnOff"},
                        ["Fader 3"]={template="FFreq"},
                        ["Fader 4"]={template="FEffect"},
		},
		["LFO 1"]={
                        ["Fader 5"]={template="FMisc"},
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
{% include "instrument/include/thor-bottommenu-effects.lua" %}
{% endif %}
		},
		["Shaper"]={
			["Button 1-1"]={template="BGreenOnOff"},
                        ["UDVButton 5-2_6-2"]={template="UDEffect", inverted=true},
                        ["Fader 3"]={template="FEffect"},
			["UDVButton 7-4_8-4"]={template="UDGain"},
{% if lptype == "mini" %}
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
{% else %}
{% include "instrument/include/thor-bottommenu-effects.lua" %}
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
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
{% else %}
{% include "instrument/include/thor-bottommenu-effects.lua" %}
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
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
{% else %}
{% include "instrument/include/thor-bottommenu-effects.lua" %}
{% endif %}
		},
	},