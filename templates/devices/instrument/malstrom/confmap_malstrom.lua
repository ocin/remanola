	["Malstrom"]={
		["Default"]={
{% include "devices/instrument/malstrom/"+lptype+"/confmap_mainmenu.lua" %}
		},
		["Main"]={
			["Fader 3"]={template="FMisc"},
			["Button 8-2"]={template="BYellowOnOff"},
			["Fader 7"]={template="FMisc"},
			["Fader 8"]={template="FGain"},
		},
		["Osc *"]={
			["Button 8-1"]={template="BYellowOnOff"},
			["Fader 2"]={template="FAmount"},
			["Fader 3"]={template="FAmount"},
			["Knob V4"]={template="FAmount"},
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
			["Fader 3"]={template="FAmount"},
			["Fader 4"]={template="FAmount"},
			["Fader 5"]={template="FAmount"},
			["Fader 6"]={template="FAmount"},
			["Fader 8"]={template="FGain"},
{% if lptype == "mini" %}
{% include "devices/instrument/malstrom/mini/confmap_mainmenu_osc.lua" %}
{% else %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_osc.lua" %}
{% endif %}
		},
		["Filter *"]={
{% if lptype == "mini" %}
{% include "devices/instrument/malstrom/mini/confmap_mainmenu_filter.lua" %}
{% else %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_filter.lua" %}
{% endif %}
			["Button 1-2"]={template="BYellowOnOff"},
			["UDVButton 7-4_8-4"]={template="UDFreq", inverted=true},
			["Button 8-5"]={template="BYellowOnOff"},
			["Button 8-6"]={template="BYellowOnOff"},
			["Button 1-6"]={template="BYellowOnOff"},
			["Fader 7"]={template="FFreq"},
			["Fader 8"]={template="FEffect"},
		},
		["Filter Env"]={
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
			["Button 8-7"]={template="BYellowOnOff"},
			["Fader 8"]={template="FAmount"},
		},
		["Mod *"]={
{% if lptype == "mini" %}
{% include "devices/instrument/malstrom/mini/confmap_mainmenu_mod.lua" %}
{% else %}
{% include "devices/instrument/malstrom/pro/confmap_submenu_mod.lua" %}
{% endif %}
			["Button 5-1"]={template="BLFOPage"},
			["Button 6-1"]={template="BLFOPage"},
			["Button 1-2"]={template="BYellowOnOff"},
			["UDVButton 3-2_4-2"]={template="UDMisc"},
			["Fader 3"]={template="FFreq"},
			["Knob V4"]={template="FMisc"},
			["Knob V5"]={template="FMisc"},
			["Knob V6"]={template="FMisc"},
			["Knob V7"]={template="FMisc"},
			["Button 1-8"]={template="BYellowOnOff"},
			["Button 2-8"]={template="BYellowOnOff"},
			["UDVButton 7-8_8-8"]={template="UDMisc"},
		},
		["Shaper"]={
			["Button 1-2"]={template="BYellowOnOff"},
			["UDVButton 5-2_6-2"]={template="FEffect", inverted=true},
			["Fader 8"]={template="FEffect"},
		},
		["Velocity"]={
			["UDVButton 7-8_8-8"]={template="UDMisc"},
		},
		["ModWheel"]={
			["UDVButton 7-8_8-8"]={template="UDMisc"},
		},
	},
