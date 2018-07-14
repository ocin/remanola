	["Malstrom"]={
		["Default"]={
{% include "devices/instrument/malstrom/"+lptype+"/confmap_mainmenu.lua" %}
		},
		["Main"]={
			["Fader 7"]={template="FEffect"},
			["Fader 8"]={template="FGain"},
		},
		["Perf"]={
			["UDVButton 7-2_8-2"]={template="FPerf"},
			["Button 8-3"]={template="BYellowOnOff"},
			["Fader 4"]={template="FPerf"},
			["UDVButton 7-5_8-5"]={template="FPerf"},
{% if lptype == "pro" %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["Osc *"]={
			["Button 1-1"]={template="BYellowOnOff"},
			["Fader 2"]={template="FOsc"},
			["Fader 3"]={template="FOsc"},
			["Knob V4"]={template="FOsc"},
			["UDVButton 7-5_8-5"]={template="UDFreq"},
			["UDVButton 7-6_8-6"]={template="UDFreq"},
			["UDVButton 7-7_8-7"]={template="UDFreq"},
			["Button 8-8"]={template="BYellowOnOff"},
{% if lptype == "mini" %}
{% include "devices/instrument/malstrom/mini/confmap_mainmenu_osc.lua" %}
{% else %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_osc.lua" %}
{% endif %}
		},
		["Osc A"]={
			["Button 7-8"]={template="BYellowOnOff"},
		},
		["Osc * Env"]={
			["Fader 3"]={template="FOsc"},
			["Fader 4"]={template="FOsc"},
			["Fader 5"]={template="FOsc"},
			["Fader 6"]={template="FOsc"},
			["Fader 8"]={template="FVol"},
{% if lptype == "mini" %}
{% include "devices/instrument/malstrom/mini/confmap_mainmenu_osc.lua" %}
{% else %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_osc.lua" %}
{% endif %}
		},
		["Filter *"]={
			["Button 1-1"]={template="BYellowOnOff"},
			["UDVButton 1-2_2-2"]={template="UDFreq", inverted=true},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FFreq"},
			["Button 8-5"]={template="BYellowOnOff"},
			["Button 8-6"]={template="BYellowOnOff"},
			["Button 1-6"]={template="BYellowOnOff"},
{% if lptype == "mini" %}
{% include "devices/instrument/malstrom/mini/confmap_mainmenu_filter.lua" %}
{% else %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Filter Env"]={
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
			["Button 8-7"]={template="BYellowOnOff"},
			["Fader 8"]={template="FEnv"},
{% if lptype == "mini" %}
{% include "devices/instrument/malstrom/mini/confmap_mainmenu_filter.lua" %}
{% else %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_filter.lua" %}
{% endif %}
		},
		["Mod *"]={
			["Button 1-1"]={template="BYellowOnOff"},
			["UDVButton 1-2_2-2"]={template="UDLFO"},
			["Fader 3"]={template="FFreq"},
			["Button 1-8"]={template="BYellowOnOff"},
			["Button 2-8"]={template="BYellowOnOff"},
			["UDVButton 7-8_8-8"]={template="UDLFO"},
{% if lptype == "mini" %}
{% include "devices/instrument/malstrom/mini/confmap_mainmenu_mod.lua" %}
{% else %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_mod.lua" %}
{% endif %}
		},
		["Mod A"]={
			["Knob V4"]={template="FOsc"},
			["Knob V5"]={template="FOsc"},
			["Knob V6"]={template="FOsc"},
		},
		["Mod B"]={
			["Knob V4"]={template="FOsc"},
			["Knob V5"]={template="FVol"},
			["Knob V6"]={template="FFreq"},
			["Knob V7"]={template="FLFO"},
		},
		["Shaper"]={
			["Button 1-2"]={template="BYellowOnOff"},
			["UDVButton 1-3_2-3"]={template="FEffect", inverted=true},
			["Fader 8"]={template="FEffect"},
		},
		["Velocity"]={
			["Knob V2"]={template="FOsc"},
			["Knob V3"]={template="FOsc"},
			["Knob V4"]={template="FFreq"},
			["Knob V5"]={template="FVol"},
			["Knob V6"]={template="FOsc"},
			["Knob V7"]={template="FLFO"},
			["UDVButton 7-8_8-8"]={template="UDPerf"},
{% if lptype == "pro" %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
		["ModWheel"]={
			["Knob V2"]={template="FOsc"},
			["Knob V3"]={template="FOsc"},
			["Knob V4"]={template="FFreq"},
			["Knob V5"]={template="FLFO"},
			["UDVButton 7-8_8-8"]={template="UDPerf"},
{% if lptype == "pro" %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_perf.lua" %}
{% endif %}
		},
	},
