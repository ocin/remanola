	["Antidote"]={
		["Default"]={
{% include "devices/instrument/antidote/"+lptype+"/confmap_mainmenu.lua" %}
		},
		["Index"]={
			["Button 8-1"]={template="BPerformancePage"},
			["Button 8-2"]={template="BPerformancePage"},
			["Button 8-3"]={template="BPerformancePage"},
			["Button 8-4"]={template="BPerformancePage"},
			["Button 8-5"]={template="BPerformancePage"},
		},
		["Main"]={
			["Fader 8"]={template="FVol"},
		},
		["Perf"]={
			["UDVButton 7-2_8-2"]={template="UDOsc"},
			["Fader 3"]={template="FPerf"},
		},
		["Osc *"]={
			["UDVButton 1-2_2-2"]={template="UDOsc", inverted=true},
			["UDVButton 1-3_2-3"]={template="UDOsc"},
			["UDVButton 1-4_2-4"]={template="UDOsc"},
			["Fader 5"]={template="FOsc"},
			["Fader 6"]={template="FOsc"},
{% if lptype == "pro" %}
{% include "devices/instrument/antidote/pro/confmap_submenu_osc.lua" %}
{% endif %}
		},
		["OscMod *"]={
			["UDVButton 1-2_2-2"]={template="UDFreq"},
			["UDVButton 1-3_2-3"]={template="UDFreq"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
			["Fader 5"]={template="FEffect"},
			["Fader 7"]={template="FPerf"},
			["Knob V8"]={template="FVol"},
{% if lptype == "pro" %}
{% include "devices/instrument/antidote/pro/confmap_submenu_osc.lua" %}
{% endif %}
		},
		["Mixer"]={
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FMisc"},
{% include "devices/instrument/antidote/pro/confmap_submenu_amp.lua" %}
		},
		["Filter"]={
			["UDVButton 1-2_2-2"]={template="UDFreq", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 6"]={template="FEnv"},
			["Fader 8"]={template="FPerf"},
{% if lptype == "pro" %}
{% include "devices/instrument/antidote/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Filter Envelope"]={
			["Fader 2"]={template="FEnv"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
			["Fader 7"]={template="FFreq"},
{% if lptype == "pro" %}
{% include "devices/instrument/antidote/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Effects"]={
{% if lptype == "mini" %}
			["Fader 2"]={template="FEffect"},
			["Button 2-7"]={template="BGreenOnOff"},
			["Button 3-7"]={template="BGreenOnOff"},
			["Button 4-7"]={template="BGreenOnOff"},
			["Button 5-7"]={template="BGreenOnOff"},
			["Button 6-7"]={template="BGreenOnOff"},
			["Button 7-7"]={template="BGreenOnOff"},
			["Button 8-7"]={template="BGreenOnOff"},
{% else %}
			["Button 8-1"]={template="BGreenOnOff"},
			["Button 8-2"]={template="BGreenOnOff"},
			["Button 8-3"]={template="BGreenOnOff"},
			["Button 8-4"]={template="BGreenOnOff"},
			["Button 8-5"]={template="BGreenOnOff"},
			["Button 8-6"]={template="BGreenOnOff"},
			["Button 8-7"]={template="BGreenOnOff"},
			["Fader 8"]={template="FEffect"},
{% endif %}
{% include "devices/instrument/antidote/"+lptype+"/confmap_submenu_effects.lua" %}
		},
		["EQ/Bass"]={ --EQBass
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDFreq"},
			["UDVButton 5-1_6-1"]={template="UDEffect"},
			["Fader 2"]={template="FGain"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
			["Fader 7"]={template="FEffect"},
{% include "devices/instrument/antidote/"+lptype+"/confmap_submenu_effects.lua" %}
		},
		["Dist"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDEffect"},
			["UDVButton 5-1_6-1"]={template="UDEffect"},
			["Fader 2"]={template="FAmount"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FAmount"},
			["Fader 7"]={template="FEffect"},
{% include "devices/instrument/antidote/"+lptype+"/confmap_submenu_effects.lua" %}
		},
		["Phaser"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDEffect"},
			["UDVButton 5-1_6-1"]={template="UDFreq"},
			["Fader 2"]={template="FFreq"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FLFO"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
{% include "devices/instrument/antidote/"+lptype+"/confmap_submenu_effects.lua" %}
		},
		["Chorus"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["Fader 2"]={template="FFreq"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
{% include "devices/instrument/antidote/"+lptype+"/confmap_submenu_effects.lua" %}
		},
		["Delay"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDEffect"},
			["UDVButton 5-1_6-1"]={template="UDFreq"},
			["UDVButton 7-1_8-1"]={template="UDFreq"},
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FEffect"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FLFO"},
			["Fader 7"]={template="FEffect"},
{% include "devices/instrument/antidote/"+lptype+"/confmap_submenu_effects.lua" %}
		},
		["Reverb"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDEffect"},
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FLFO"},
			["Fader 7"]={template="FEffect"},
{% include "devices/instrument/antidote/"+lptype+"/confmap_submenu_effects.lua" %}
		},
		["Comp"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDEffect"},
			["Fader 2"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
{% include "devices/instrument/antidote/"+lptype+"/confmap_submenu_effects.lua" %}
		},
		["LFO *"]={
{% if lptype == "mini" %}
			["Button 1-1"]={template="BGreenOnOff"},
			["Button 1-3"]={template="BGreenOnOff"},
{% else %}
			["Button 1-1"]={template="BBRedOnOff"},
			["Button 1-3"]={template="BBBlueOnOff"},
{% endif %}
                        ["UDVButton 3-1_4-1"]={template="UDLFO", inverted=true},
                        ["UDVButton 7-1_8-1"]={template="UDLFO", inverted=true},
                        ["Fader 4"]={template="FFreq"},
                        ["UDVButton 7-4_8-4"]={template="UDFreq"},
                        ["Knob V5"]={template="FLFO"},
{% include "devices/instrument/antidote/pro/confmap_submenu_mod.lua" %}
		},
		["Amp Env"]={
                        ["Fader 3"]={template="FVol"},
                        ["Fader 4"]={template="FVol"},
                        ["Fader 5"]={template="FVol"},
                        ["Fader 6"]={template="FVol"},
{% include "devices/instrument/antidote/pro/confmap_submenu_amp.lua" %}
		},
		["Mod Env"]={
                        ["UDVButton 3-1_4-1"]={template="UDEnv", inverted=true},
                        ["Fader 3"]={template="FEnv"},
                        ["Fader 4"]={template="FEnv"},
                        ["Fader 5"]={template="FEnv"},
                        ["Fader 6"]={template="FEnv"},
                        ["Knob V8"]={template="FEnv"},
{% include "devices/instrument/antidote/pro/confmap_submenu_mod.lua" %}
		},
		["Arpeggiator"]={
                        ["UDHButton 3-1_3-2"]={template="UDPerf"},
                        ["UDHButton 5-1_5-2"]={template="UDPerf"},
                        ["UDHButton 6-1_6-2"]={template="UDFreq"},
                        ["UDHButton 7-1_7-2"]={template="UDFreq"},
                        ["Knob V4"]={template="FPerf"},
                        ["Button 8-1"]={template="BGreenOnOff"},
{% include "devices/instrument/antidote/pro/confmap_submenu_perf.lua" %}
		},
		["Mod Matrix *"]={
			["Button 1-1"]={template="BPerformancePage"},
			["Button 2-1"]={template="BPerformancePage"},
			["Button 3-1"]={template="BPerformancePage"},
			["Button 4-1"]={template="BPerformancePage"},
			["Button 5-1"]={template="BPerformancePage"},
			["UDVButton 1-2_2-2"]={template="UDAmount", inverted=true},
			["Knob V3"]={template="FAmount"},
			["UDVButton 1-4_2-4"]={template="UDEffect", inverted=true},
{% include "devices/instrument/antidote/pro/confmap_submenu_perf.lua" %}
		},
	},
