local item_conf_map = {
{% include "include/remanola_confmap_default.lua" %}
{% include "reason/reason-master-section.lua" %}
{% include "reason/reason-mix-channel.lua" %}
{% include "instrument/kong.lua" %}
{% include "instrument/redrum.lua" %}
{% include "instrument/thor.lua" %}
{% include "instrument/combinator.lua" %}
{% include "instrument/drrex.lua" %}
{% include "instrument/id8.lua" %}
{% include "instrument/malstrom.lua" %}
{% include "instrument/nn19.lua" %}
{% include "instrument/subtractor.lua" %}
{% include "instrument/revival.lua" %}
{% include "instrument/antidote.lua" %}
{% include "instrument/px7.lua" %}
{% include "instrument/parsec.lua" %}
{% include "instrument/europa.lua" %}
{% include "instrument/grain.lua" %}
{% include "instrument/klang.lua" %}
{% include "instrument/pangea.lua" %}
{% include "instrument/humana.lua" %}
	["Audiomatic"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 2"]={template="FRed"},
			["UDVButton 1-3_2-3"]={template="UDOrange"},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FRed"},
		},
	},
	["Pulveriser"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 7-1_8-1"]={template="UDYellow"},
			["Fader 2"]={template="FOrange"},
			["Fader 3"]={template="FYellow"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FRed"},
		},
		["Filter"]={
			["UDVButton 1-2_2-2"]={template="UDGreen"},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Knob V7"]={template="FYellow"},
			["Knob V8"]={template="FYellow"},
		},
		["Follower"]={
			["Button 8-1"]={template="BRedOnOff"},
			["Fader 2"]={template="FOrange"},
			["Fader 4"]={template="FYellow"},
			["Fader 5"]={template="FYellow"},
		},
		["Tremor"]={
			["Fader 2"]={template="FGreen"},
			["UDVButton 7-2_8-2"]={template="UDGreen"},
			["Button 1-3"]={template="BGreenOnOff"},
			["UDVButton 1-4_2-4"]={template="UDOrange"},
			["Button 1-5"]={template="BGreenOnOff"},
			["Fader 6"]={template="FYellow"},
			["Knob V8"]={template="FYellow"},
		},
	},
	["Scream 4 Distortion"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["UDVButton 1-4_2-4"]={template="UDOrange", inverted=true},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FRed"},
		},
		["Cut"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Knob V4"]={template="FGreen"},
			["Knob V5"]={template="FGreen"},
			["Knob V6"]={template="FGreen"},
		},
		["Body"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["UDVButton 1-7_2-7"]={template="UDOrange", inverted=true},
		},
	},
	["The Echo"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-2_2-2"]={template="UDOrange"},
			["Button 1-3"]={template="BYellowOnOff"},
			["Fader 4"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FOrange"},
		},
		["Delay"]={
			["Fader 2"]={template="FGreen"},
			["UDVButton 7-2_8-2"]={template="UDGreen"},
			["Fader 3"]={template="FGreen"},
			["Button 1-4"]={template="BYellowOnOff"},
			["Button 4-4"]={template="BYellowOnOff"},
			["Button 8-5"]={template="BYellowOnOff"},
			["Knob V6"]={template="FOrange"},
		},
		["Feedback"]={
			["Fader 2"]={template="FOrange"},
			["Knob V3"]={template="FOrange"},
			["Button 1-5"]={template="BYellowOnOff"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FAmber"},
		},
		["Color"]={
			["Fader 2"]={template="FAMber"},
			["UDVButton 1-3_2-3"]={template="UDAmber"},
			["Button 1-5"]={template="BYellowOnOff"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FOrange"},
		},
		["Modulation"]={
			["Knob V2"]={template="FYellow"},
			["Fader 3"]={template="FOrange"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FYellow"},
		},
	},
	["RV7000 Advanced Reverb"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 1-2"]={template="BRedOnOff"},
			["Button 2-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FGreen"},
			["Knob V5"]={template="FGreen"},
			["Fader 7"]={template="FOrange"},
		},
		["Reverb"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["SmallSpace"]={
				["Fader 2"]={template="FOrange"},
				["Fader 3"]={template="FYellow"},
				["UDVButton 7-4_8-4"]={template="UDOrange"},
				["Fader 5"]={template="FGreen"},
				["Fader 6"]={template="FOrange"},
				["Fader 7"]={template="FGreen"},
				["Fader 8"]={template="FYellow"},
			},
			["Room"]={
				["Fader 2"]={template="FOrange"},
				["Fader 3"]={template="FOrange"},
				["UDVButton 7-4_8-4"]={template="UDOrange"},
				["Fader 5"]={template="FOrange"},
				["Fader 6"]={template="FOrange"},
				["Fader 7"]={template="FGreen"},
				["Fader 8"]={template="FYellow"},
			},
			["Hall"]={
				["Fader 2"]={template="FOrange"},
				["Fader 3"]={template="FOrange"},
				["UDVButton 7-4_8-4"]={template="UDOrange"},
				["Fader 5"]={template="FOrange"},
				["Fader 6"]={template="FOrange"},
				["Fader 7"]={template="FGreen"},
				["Fader 8"]={template="FYellow"},
			},
			["Arena"]={
				["Fader 2"]={template="FOrange"},
				["Fader 3"]={template="FOrange"},
				["Fader 4"]={template="FGreen"},
				["Fader 5"]={template="FGreen"},
				["Fader 6"]={template="FAmber"},
				["Fader 7"]={template="FGreen"},
				["Fader 8"]={template="FAmber"},
			},
			["Plate"]={
				["Fader 5"]={template="FGreen"},
				["Fader 7"]={template="FGreen"},
			},
			["Spring"]={
				["Fader 2"]={template="FOrange"},
				["Fader 3"]={template="FOrange"},
				["Fader 4"]={template="FGreen"},
				["Fader 5"]={template="FGreen"},
				["Button 8-6"]={template="BRedOnOff"},
				["Fader 7"]={template="FGreen"},
				["Fader 8"]={template="FAmber"},
			},
			["Echo"]={
				["Fader 2"]={template="FOrange"},
				["UDVButton 7-2_8-2"]={template="UDOrange"},
				["Fader 3"]={template="FOrange"},
				["Button 8-4"]={template="BRedOnOff"},
				["Fader 5"]={template="FGreen"},
				["Fader 6"]={template="FOrange"},
				["Fader 7"]={template="FGreen"},
			},
			["MultiTap"]={
				["Button 8-2"]={template="BRedOnOff"},
				["Fader 3"]={template="FOrange"},
				["Fader 4"]={template="FGreen"},
				["UDVButton 7-5_8-5"]={template="UDOrange"},
				["Fader 6"]={template="FGreen"},
				["UDVButton 7-6_8-6"]={template="UDGreen"},
				["Fader 7"]={template="FAmber"},
				["Knob V8"]={template="FAmber"},
			},
			["Reverse"]={
				["Fader 2"]={template="FOrange"},
				["UDVButton 7-2_8-2"]={template="UDOrange"},
				["Fader 3"]={template="FOrange"},
				["Button 8-6"]={template="BRedOnOff"},
				["Fader 5"]={template="FOrange"},
			},
			["Convolution"]={
				["UDVButton 7-2_8-2"]={template="UDOrange"},
				["Fader 3"]={template="FOrange"},
				["Knob V4"]={template="FOrange"},
				["Fader 5"]={template="FGreen"},
				["UDVButton 7-6_8-6"]={template="UDAmber"},
				["Knob V7"]={template="FGreen"},
				["Fader 8"]={template="FRed"},
			},
		},
		["Eq"]={
			["Knob V2"]={template="FRed"},
			["Fader 3"]={template="FGreen"},
			["Knob V5"]={template="FRed"},
			["Fader 6"]={template="FGreen"},
			["Fader 7"]={template="FOrange"},
		},
		["Gate"]={
			["Fader 1"]={template="FOrange"},
			["Fader 2"]={template="FOrange"},
			["Button 8-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FOrange"},
		},
	},
	["Alligator"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 1-2"]={template="BRedOnOff"},
			["Button 3-2"]={template="BGreenOnOff"},
			["UDVButton 5-2_6-2"]={template="UDOrange"},
			["UDVButton 7-2_8-2"]={template="UDGreen"},
			["UDVButton 7-3_8-3"]={template="UDOrange"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 3-4"]={template="BRedOnOff"},
			["Button 5-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 3-5"]={template="BRedOnOff"},
			["Button 5-5"]={template="BRedOnOff"},
			["Fader 7"]={template="FRed"},
		},
		["HPFilter"]={
			["Button 2-1"]={template="BFilterPage"},
			["Button 3-1"]={template="BFilterPage"},
			["Button 4-1"]={template="BFilterPage"},
			["Knob V3"]={template="FYellow"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Knob V6"]={template="FYellow"},
		},
		["BPFilter"]={
			["Button 2-1"]={template="BFilterPage"},
			["Button 3-1"]={template="BFilterPage"},
			["Button 4-1"]={template="BFilterPage"},
			["Knob V3"]={template="FYellow"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Knob V6"]={template="FYellow"},
		},
		["LPFilter"]={
			["Button 2-1"]={template="BFilterPage"},
			["Button 3-1"]={template="BFilterPage"},
			["Button 4-1"]={template="BFilterPage"},
			["Knob V3"]={template="FYellow"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Knob V6"]={template="FYellow"},
		},
		["HPEffects"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Fader 2"]={template="FAmber"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FOrange"},
			["Knob V6"]={template="FRed"},
			["Fader 7"]={template="FRed"},
		},
		["BPEffects"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Fader 2"]={template="FAmber"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FOrange"},
			["Knob V6"]={template="FRed"},
			["Fader 7"]={template="FRed"},
		},
		["LPEffects"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Fader 2"]={template="FAmber"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FOrange"},
			["Knob V6"]={template="FRed"},
			["Fader 7"]={template="FRed"},
		},
		["Delay"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Fader 2"]={template="FGreen"},
			["UDVButton 7-2_8-2"]={template="UDGreen"},
			["Button 1-3"]={template="BGreenOnOff"},
			["Fader 4"]={template="FOrange"},
			["Knob V5"]={template="FOrange"},
		},
		["Phaser"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Fader 2"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
		},
		["AmpEnv"]={
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FRed"},
			["Fader 5"]={template="FRed"},
		},
		["DryLevels"]={
			["Fader 2"]={template="FOrange"},
			["Knob V4"]={template="FRed"},
			["Fader 5"]={template="FRed"},
		},
		["FilterEnv"]={
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FGreen"},
		},
		["LFO"]={
			["UDVButton 1-2_2-2"]={template="UDYellow"},
			["Fader 4"]={template="FGreen"},
			["UDVButton 7-4_8-4"]={template="UDGreen"},
			["Button 1-5"]={template="BGreenOnOff"},
		},
	},
	["Softtube Amp"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-2_2-2"]={template="UDOrange"},
			["UDVButton 3-2_4-2"]={template="UDOrange"},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FRed"},
			["Fader 7"]={template="FRed"},
			["Fader 8"]={template="FRed"},
		},
		["Eq"]={
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FRed"},
			["Fader 5"]={template="FRed"},
		},
	},
	["Softtube Bass Amp"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-2_2-2"]={template="UDOrange"},
			["UDVButton 3-2_4-2"]={template="UDOrange"},
			["Fader 3"]={template="FOrange"},
			["Fader 8"]={template="FRed"},
		},
		["Eq"]={
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FRed"},
			["UDVButton 7-5_8-5"]={template="UDGreen"},
			["Button 8-6"]={template="BRedOnOff"},
			["Fader 7"]={template="FRed"},
		},
	},
	["Synchronous"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 3"]={template="FRed"},
			["Button 8-4"]={template="BRedOnOff"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FRed"},
		},
		["Dist"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 3-2_4-2"]={template="UDOrange"},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
		},
		["Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 3-2_4-2"]={template="UDOrange"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Fader 7"]={template="FYellow"},
		},
		["Delay"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 3-2"]={template="BRedOnOff"},
			["Button 4-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FGreen"},
			["UDVButton 7-4_8-4"]={template="UDGreen"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 8-5"]={template="BRedOnOff"},
			["Fader 6"]={template="FOrange"},
			["Button 8-7"]={template="BRedOnOff"},
			["Knob V8"]={template="FOrange"},
		},
		["Reverb"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Fader 7"]={template="FYellow"},
			["Button 8-8"]={template="BRedOnOff"},
		},
	},
	["BV512 Digital Vocoder"]={
		["Default"]={
			["Fader 1"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 2"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 3"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 4"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 5"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 6"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 7"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 8"]={template="FVCGreen", bvmap="Fader VC"},
		},
		["Index"]={
			["UDVButton 7-1_8-1"]={template="UDNocolor"},
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 4-1"]={template="BRedOnOff"},
			["UDVButton 5-1_6-1"]={template="UDOrange"},
			["UDVButton 7-1_8-1"]={template="UDOrange"},
			["Fader 4"]={template="FAmber"},
			["Fader 5"]={template="FAmber"},
			["Knob V6"]={template="FRed"},
			["Fader 7"]={template="FGreen"},
			["Fader 8"]={template="FOrange"},
		},
	},
	["MClass Equalizer"]={
		["Default"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FGreen"},
			["Knob V5"]={template="FRed"},
			["Fader 6"]={template="FYellow"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 5-8"]={template="BEffectPage"},
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 1-3"]={template="BRedOnOff"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 1-6"]={template="BRedOnOff"},
			["Button 1-7"]={template="BRedOnOff"},
		},
	},
	["MClass Compressor"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["Button 7-1"]={template="BRedLed"},
			["Button 8-1"]={template="BRedOnOff"},
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Knob V3"]={template="FRed"},
			["Fader 4"]={template="FOrange"},
			["Button 1-5"]={template="BRedOnOff"},
			["Fader 6"]={template="FOrange"},
			["Meter 7"]={template="InvMeter"},
			["Knob V8"]={template="FRed"},
		},
		["Env"]={
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
			["Button 1-6"]={template="BRedOnOff"},
		},
	},
	["MClass Maximizer"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Knob V3"]={template="FRed"},
			["Button 1-6"]={template="BRedOnOff"},
		},
		["Limiter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 4-2"]={template="BRedOnOff"},
			["Meter 3"]={template="InvMeter"},
			["UDVButton 1-4_2-4"]={template="UDOrange", inverted=true},
			["UDVButton 1-5_2-5"]={template="UDOrange", inverted=true},
			["Knob V6"]={template="FRed"},
		},
		["SoftCLip"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
		},
	},
	["MClass Stereo Imager"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Knob V3"]={template="FOrange"},
			["Meter 4"]={template="FRed", bvmap="MeterSI"},
			["Fader 5"]={template="FGreen", bvmap="Fader64"},
			["Knob V6"]={template="FOrange"},
			["Meter 7"]={template="FRed", bvmap="MeterSI"},
			["Button 1-6"]={template="BRedOnOff"},
			["UDVButton 1-8_2-8"]={template="UDYellow"},
			["UDVButton 7-8_8-8"]={template="UDOrange"},
		},
	},
	["Neptune Pitch Adjuster"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 3"]={template="FOrange"},
			["Button 1-4"]={template="BYellowOnOff"},
			["Button 3-4"]={template="BYellowOnOff"},
			["Button 5-4"]={template="BYellowOnOff"},
			["UDVButton 7-4_8-4"]={template="UDOrange", inverted=true},
			["UDVButton 1-5_2-5"]={template="UDOrange"},
			["Fader 7"]={template="FOrange"},
			["Fader 8"]={template="FOrange"},
		},
		["PitchAdjust"]={
			["Button 1-2"]={template="BYellowOnOff"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
		},
		["Transpose"]={
			["Button 1-2"]={template="BYellowOnOff"},
			["UDVButton 1-4_2-4"]={template="UDGreen"},
			["UDVButton 5-4_6-4"]={template="UDGreen"},
		},
		["Formant"]={
			["Button 1-2"]={template="BYellowOnOff"},
			["Knob V5"]={template="FOrange"},
		},
	},
	["RV-7 Digital Reverb"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-3_2-3"]={template="UDOrange"},
			["Knob V4"]={template="FOrange"},
			["Knob V5"]={template="FOrange"},
			["Fader 7"]={template="FOrange"},
			["Fader 8"]={template="FOrange"},
		},
	},
	["DDL-1 Digital Delay Line"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-3_2-3"]={template="UDGreen"},
			["UDVButton 1-4_2-4"]={template="UDGreen", inverted=true},
			["UDVButton 1-5_2-5"]={template="UDGreen", inverted=true},
			["Fader 6"]={template="FOrange"},
			["Knob V7"]={template="FRed"},
			["Fader 8"]={template="FOrange"},
		},
	},
	["D-11 Foldback Distortion"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 4"]={template="FOrange"},
			["Fader 8"]={template="FOrange"},
		},
	},
	["ECF-42 Filter"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FAmber"},
			["Fader 6"]={template="FYellow"},
			["UDVButton 1-7_2-7"]={template="UDGreen", inverted=true},
		},
	},
	["CF-101 Chorus/Flanger"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 3"]={template="FGreen"},
			["Knob V4"]={template="FOrange"},
			["Fader 5"]={template="FGreen"},
			["Button 1-6"]={template="BRedOnOff"},
			["Fader 7"]={template="FYellow"},
			["Button 1-8"]={template="BRedOnOff"},
		},
	},
	["PH-90 Phaser"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
		},
		["LFO"]={
			["Fader 5"]={template="FGreen"},
			["Button 1-6"]={template="BRedOnOff"},
			["Fader 7"]={template="FYellow"},
		},
	},
	["UN-16 Unison"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-3_2-3"]={template="UDOrange", inverted=true},
			["Fader 4"]={template="FOrange"},
			["Fader 8"]={template="FOrange"},
		},
	},
	["COMP-01 Compressor/Limiter"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FYellow"},
			["Meter 8"]={template="FRed", bvmap="MeterSI"},
		},
	},
	["PEQ-2 Two Band Parametric EQ"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 8-1"]={template="BRedOnOff"},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FYellow"},
			["Knob V5"]={template="FRed"},
			["Fader 6"]={template="FGreen"},
			["Fader 7"]={template="FYellow"},
			["Knob V8"]={template="FRed"},
		},
	},
	["Saturation Knob"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 3"]={template="FOrange"},
			["UDVButton 1-4_2-4"]={template="UDOrange"},
		},
	},
	["Polar Dual Pitch Shifter"]={
		["Default"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectSupPage"},
			["Button 5-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectSupPage"},
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-3_2-3"]={template="UDOrange", inverted=true},
			["UDVButton 5-3_6-3"]={template="UDOrange", inverted=true},
			["Button 8-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FGreen"},
			["Fader 6"]={template="FGreen"},
		},
		["Dry Signal"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["Knob V4"]={template="FRed"},
			["Knob V5"]={template="FYellow"},
			["Fader 8"]={template="FRed"},
		},
		["Delay Buffer"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 5-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["Button 1-4"]={template="BRedOnOff"},
			["Knob V4"]={template="FYellow"},
			["Knob V5"]={template="FYellow"},
		},
		["Shifter *"]={
			["Button 1-1"]={template="BRedOnOff"},
			["Knob V2"]={template="FGreen"},
			["Knob V3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
			["Knob V6"]={template="FYellow"},
			["Knob V7"]={template="FYellow"},
		},
		["Shifter Vol *"]={
			["Knob V2"]={template="FRed"},
			["Knob V3"]={template="FYellow"},
			["Fader 6"]={template="FRed"},
		},
		["Envelope"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FYellow"},
			["Fader 4"]={template="FYellow"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FYellow"},
			["Button 1-7"]={template="BRedOnOff"},
		},
		["LFO"]={
			["Fader 2"]={template="FGreen"},
			["UDVButton 7-2_8-2"]={template="UDGreen"},
			["Fader 3"]={template="FYellow"},
			["UDVButton 7-4_8-4"]={template="UDOrange"},
			["Button 1-5"]={template="BRedOnOff"},
		},
		["Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 7-3_8-3"]={template="UDGreen", inverted=true},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FYellow"},
			["Knob V7"]={template="FYellow"},
			["Knob V8"]={template="FYellow"},
		},
	},
{% include "utilities/rpg8.lua" %}
{% include "utilities/matrix.lua" %}
}	
