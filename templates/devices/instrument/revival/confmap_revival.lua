	["Revival"]={
		["Default"]={
{% include "devices/instrument/revival/"+lptype+"/confmap_mainmenu.lua" %}
		},
		["Index"]={
			["Button 2-4"]={template="BFilterPage"},
			["Button 3-4"]={template="BFilterPage"},
			["Button 4-4"]={template="BFilterPage"},
			["Button 5-4"]={template="BFilterPage"},
			["Button 2-5"]={template="BFilterModPage"},
			["Button 3-5"]={template="BFilterModPage"},
			["Button 4-5"]={template="BFilterModPage"},
			["Button 5-5"]={template="BFilterModPage"},
			["Button 2-6"]={template="BFilterModPage"},
			["Button 3-6"]={template="BFilterModPage"},
			["Button 4-6"]={template="BFilterModPage"},
			["Button 5-6"]={template="BFilterModPage"},
			["Button 2-7"]={template="BFilterModPage"},
			["Button 3-7"]={template="BFilterModPage"},
			["Button 4-7"]={template="BFilterModPage"},
			["Button 5-7"]={template="BFilterModPage"},
		},
		["Main"]={
			-- S1/S2 switches
			["Button 6-2"]={template="BYellowOnOff"},
			["Button 6-3"]={template="BYellowOnOff"},
			-- Attack Vib/Trem switches
			["Button 7-2"]={template="BYellowOnOff"},
			["Button 7-3"]={template="BYellowOnOff"},
			-- Rotator switches
			["Button 8-2"]={template="BRedOnOff"},
			["Button 8-3"]={template="BRedOnOff"},
			-- R1/R2 knobs
			["Fader 4"]={template="FMisc"},
			["Fader 5"]={template="FMisc"},
			["BigFader 8"]={template="FVol"},
		},
		["Perf"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDFreq"},
			["UDVButton 1-3_2-3"]={template="UDPerf"},
			["Fader 7"]={template="FPerf"},
			["UDVButton 7-8_8-8"]={template="FPerf"},
		},
		["Voicing 1"]={
			["UDVButton 1-2_2-2"]={template="FOsc",inverted=true},
			["UDVButton 1-3_2-3"]={template="FOsc",inverted=true},
			["UDVButton 1-4_2-4"]={template="FPerf",inverted=true},
			["UDVButton 1-5_2-5"]={template="FOsc",inverted=true},
			["Fader 4"]={template="FOsc"},
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_voicing.lua" %}
{% endif %}
		},
		["Voicing 2"]={
			["Fader 1"]={template="FPerf"},
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FPerf"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
			["Fader 8"]={template="FFreq"},
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_voicing.lua" %}
{% endif %}
		},
		["Pri/Sec"]={
			["UDVButton 1-2_2-2"]={template="UDOsc"},
			["UDVButton 1-3_2-3"]={template="UDOsc",inverted=true},
			["Knob V4"]={template="FOsc"},
			["Fader 6"]={template="FFreq"},
			["Button 1-7"]={template="BRedOnOff"},
		},
		["Solos"]={
			["Button 8-2"]={template="BSoloRevival"},
			["Button 8-4"]={template="BSoloRevival"},
			["Button 8-6"]={template="BSoloRevival"},
			["Button 8-8"]={template="BSoloRevival"},
		},
		["Attack"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_osc.lua" %}
{% endif %}
			["UDVButton 1-2_2-2"]={template="UDOsc",inverted=true},
			["Fader 3"]={template="FVol"},
			["Fader 5"]={template="FOsc"},
			["Fader 6"]={template="FVol"},
			["Fader 7"]={template="FVol"},
			["Button 1-8"]={template="BRedOnOff"},
		},
		["Primary"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_osc.lua" %}
{% endif %}
			["UDVButton 1-2_2-2"]={template="UDOsc",inverted=true},
			["Fader 3"]={template="FVol"},
			["Fader 7"]={template="FVol"},
		},
		["Secondary"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_osc.lua" %}
{% endif %}
			["UDVButton 1-2_2-2"]={template="UDOsc",inverted=true},
			["Fader 3"]={template="FVol"},
			["Fader 7"]={template="FVol"},
		},
		["Release"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_osc.lua" %}
{% endif %}
			["UDVButton 1-2_2-2"]={template="UDOsc",inverted=true},
			["Fader 3"]={template="FVol"},
			["Fader 5"]={template="FOsc"},
			["Fader 6"]={template="FVol"},
			["Fader 7"]={template="FVol"},
			["Button 1-8"]={template="BRedOnOff"},
		},
		["* Drawbars Lower"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_osc.lua" %}
{% endif %}
			["Button 7-1"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},
			["Drawbar 2"]={template="DSub"},
			["Drawbar 3"]={template="DSub"},
			["Drawbar 4"]={template="DFund"},
			["Drawbar 5"]={template="DFund"},
			["Drawbar 6"]={template="DHarm"},
			["Drawbar 7"]={template="DFund"},
			["Drawbar 8"]={template="DHarm"},
		},
		["* Drawbars Upper"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_osc.lua" %}
{% endif %}
			["Button 7-1"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},
			["Drawbar 2"]={template="DHarm"},
			["Drawbar 3"]={template="DHarm7"},
			["Drawbar 4"]={template="DFund"},
		},
		["* Mod Enable"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_osc.lua" %}
{% endif %}
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 1-6"]={template="BRedOnOff"},
			["Button 1-7"]={template="BRedOnOff"},
			["Button 1-8"]={template="BRedOnOff"},
			["Button 2-2"]={template="BRedOnOff"},
			["Button 2-3"]={template="BRedOnOff"},
			["Button 2-4"]={template="BRedOnOff"},
			["Button 3-2"]={template="BRedOnOff"},
			["Button 3-3"]={template="BRedOnOff"},
			["Button 3-4"]={template="BRedOnOff"},
			["Button 3-5"]={template="BRedOnOff"},
			["Button 3-6"]={template="BRedOnOff"},
			["Button 3-7"]={template="BRedOnOff"},
			["Button 3-8"]={template="BRedOnOff"},
			["Button 4-2"]={template="BRedOnOff"},
			["Button 4-3"]={template="BRedOnOff"},
			["Button 4-4"]={template="BRedOnOff"},
			["Button 5-2"]={template="BRedOnOff"},
			["Button 5-3"]={template="BRedOnOff"},
			["Button 5-4"]={template="BRedOnOff"},
			["Button 5-5"]={template="BRedOnOff"},
			["Button 5-6"]={template="BRedOnOff"},
			["Button 5-7"]={template="BRedOnOff"},
			["Button 5-8"]={template="BRedOnOff"},
			["Button 6-2"]={template="BRedOnOff"},
			["Button 6-3"]={template="BRedOnOff"},
			["Button 6-4"]={template="BRedOnOff"},
		},
		["* Mod *"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_osc.lua" %}
{% endif %}
			["UDVButton 5-2_6-2"]={template="UDFreq", inverted=true},
			["UDVButton 7-2_8-2"]={template="UDEffect", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FPerf"},
			["Fader 6"]={template="FPerf"},
			["Fader 7"]={template="FLFO"},
			["Fader 8"]={template="FFreq"},
		},
		["Effects"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_effects.lua" %}
			["Button 1-1"]={template="BRedOnOff"},
			["Button 8-1"]={template="BRedOnOff"},
			["Button 8-2"]={template="BRedOnOff"},
			["Button 8-3"]={template="BRedOnOff"},
			["Button 8-4"]={template="BRedOnOff"},
			["Button 8-5"]={template="BRedOnOff"},
			["Button 8-6"]={template="BRedOnOff"},
			["Fader 8"]={template="FEffect"},
{% else %}
			["Button 8-4"]={template="BRedOnOff"},
			["Fader 5"]={template="FEffect"},
			["Button 2-7"]={template="BRedOnOff"},
			["Button 3-7"]={template="BRedOnOff"},
			["Button 4-7"]={template="BRedOnOff"},
			["Button 5-7"]={template="BRedOnOff"},
			["Button 6-7"]={template="BRedOnOff"},
			["Button 7-7"]={template="BRedOnOff"},
{% endif %}
		},
		["PreAmp"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_effects.lua" %}
{% endif %}
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDEffect", inverted=true},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FAmount"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
		},
		["Phaser"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_effects.lua" %}
{% endif %}
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDEffect", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
		},
		["ModFilter"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_effects.lua" %}
{% endif %}
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDEffect", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["UDVButton 1-5_2-5"]={template="UDFreq"},
			["UDVButton 7-5_8-5"]={template="UDLFO"},
			["Fader 6"]={template="FLFO"},
			["Fader 7"]={template="FFreq"},
			["UDVButton 7-7_8-7"]={template="UDFreq"},
		},
		["Speaker"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_effects.lua" %}
{% endif %}
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDEffect", inverted=true},
			["Fader 3"]={template="FEffect"},
			["Knob V4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Knob V7"]={template="FVol"},
		},
		["Reverb"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_effects.lua" %}
{% endif %}
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDEffect", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Knob V4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Fader 8"]={template="FEffect"},
		},
		["Delay"]={
{% if lptype == "pro" %}
{% include "devices/instrument/revival/pro/confmap_submenu_effects.lua" %}
{% endif %}
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDEffect", inverted=true},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FEffect"},
		},
	},
