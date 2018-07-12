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
			["Fader 3"]={template="FMisc"},
			["Fader 8"]={template="FGain"},
		},
		["Osc *"]={
			["UDVButton 1-2_2-2"]={template="UDAmount", inverted=true},
			["UDVButton 3-2_4-2"]={template="UDAmount2", inverted=true},
			["UDVButton 5-2_6-2"]={template="UDAmount", inverted=true},
			["UDVButton 1-3_2-3"]={template="UDFreq"},
			["UDVButton 3-3_4-3"]={template="UDFreq2"},
			["UDVButton 5-3_6-3"]={template="UDFreq"},
			["Fader 4"]={template="FAmount"},
			["Fader 5"]={template="FAmount"},
			["Fader 6"]={template="FAmount"},
			["Fader 7"]={template="FMisc"},
			["Knob V8"]={template="FGain"},
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
			["Fader 6"]={template="FMisc"},
			["Fader 8"]={template="FMisc"},
{% include "devices/instrument/antidote/pro/confmap_submenu_filter.lua" %}
		},
		["Filter Envelope"]={
			["Fader 2"]={template="FMisc"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
{% include "devices/instrument/antidote/pro/confmap_submenu_filter.lua" %}
		},
		["Effects"]={
{% if lptype == "mini" %}
			["Fader 2"]={template="FAmount"},
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
			["Fader 8"]={template="FAmount"},
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
			["Fader 5"]={template="FMisc"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
{% include "devices/instrument/antidote/"+lptype+"/confmap_submenu_effects.lua" %}
		},
		["Chorus"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["Fader 2"]={template="FFreq"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FMisc"},
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
			["Fader 6"]={template="FAmount"},
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
			["Fader 6"]={template="FMisc"},
			["Fader 7"]={template="FEffect"},
{% include "devices/instrument/antidote/"+lptype+"/confmap_submenu_effects.lua" %}
		},
		["Comp"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDEffect"},
			["Fader 2"]={template="FEffect"},
			["Fader 4"]={template="FAmount"},
			["Fader 5"]={template="FAmount"},
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
                        ["Fader 4"]={template="FFreq"},
                        ["UDVButton 7-4_8-4"]={template="UDFreq"},
                        ["Knob V5"]={template="FAmount"},
                        ["UDVButton 3-1_4-1"]={template="UDMisc", inverted=true},
                        ["UDVButton 7-1_8-1"]={template="UDMisc", inverted=true},
{% include "devices/instrument/antidote/pro/confmap_submenu_mod.lua" %}
		},
		["Amp Env"]={
                        ["Fader 3"]={template="FGain"},
                        ["Fader 4"]={template="FGain"},
                        ["Fader 5"]={template="FGain"},
                        ["Fader 6"]={template="FGain"},
{% include "devices/instrument/antidote/pro/confmap_submenu_amp.lua" %}
		},
		["Mod Env"]={
                        ["UDVButton 3-1_4-1"]={template="UDMisc", inverted=true},
                        ["Fader 3"]={template="FMisc"},
                        ["Fader 4"]={template="FMisc"},
                        ["Fader 5"]={template="FMisc"},
                        ["Fader 6"]={template="FMisc"},
                        ["Knob V8"]={template="FAmount"},
{% include "devices/instrument/antidote/pro/confmap_submenu_mod.lua" %}
		},
		["Arpeggiator"]={
                        ["UDHButton 3-1_3-2"]={template="UDMisc"},
                        ["UDHButton 5-1_5-2"]={template="UDMisc"},
                        ["UDHButton 6-1_6-2"]={template="UDFreq"},
                        ["UDHButton 7-1_7-2"]={template="UDMisc"},
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
