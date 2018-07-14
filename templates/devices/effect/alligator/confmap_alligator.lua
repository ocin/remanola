	["Alligator"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDEffect"},
			["Button 1-2"]={template="BRedOnOff"},
			["Button 3-2"]={template="BGreenOnOff"},
			["UDVButton 5-2_6-2"]={template="UDEffect"},
			["UDVButton 7-2_8-2"]={template="UDFreq"},
			["UDVButton 7-3_8-3"]={template="UDEffect"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 3-4"]={template="BRedOnOff"},
			["Button 5-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 3-5"]={template="BRedOnOff"},
			["Button 5-5"]={template="BRedOnOff"},
			["Fader 7"]={template="FGain"},
		},
		["HPFilter"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_filter.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_filter.lua" %}
{% endif %}
			["Button 1-2"]={template="BGreenOnOff"},
			["Knob V3"]={template="FLFO"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
			["Knob V6"]={template="FEnv"},
		},
		["BPFilter"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_filter.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_filter.lua" %}
{% endif %}
			["Knob V3"]={template="FLFO"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
			["Knob V6"]={template="FEnv"},
		},
		["LPFilter"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_filter.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_filter.lua" %}
{% endif %}
			["Knob V3"]={template="FLFO"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
			["Knob V6"]={template="FEnv"},
		},
		["HPEffects"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_effect.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_effect.lua" %}
{% endif %}
			["Fader 2"]={template="FAmount"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Knob V6"]={template="FPan"},
			["Fader 7"]={template="FVol"},
		},
		["BPEffects"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_effect.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_effect.lua" %}
{% endif %}
			["Fader 2"]={template="FAmount"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Knob V6"]={template="FPan"},
			["Fader 7"]={template="FVol"},
		},
		["LPEffects"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_effect.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_effect.lua" %}
{% endif %}
			["Fader 2"]={template="FAmount"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Knob V6"]={template="FPan"},
			["Fader 7"]={template="FVol"},
		},
		["Delay"]={
{% if lptype == "mini" %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_effect.lua" %}
{% endif %}
			["Fader 2"]={template="FFreq"},
			["UDVButton 7-2_8-2"]={template="UDFreq"},
			["Button 1-3"]={template="BGreenOnOff"},
			["Fader 4"]={template="FEffect"},
			["Knob V5"]={template="FEffect"},
		},
		["Phaser"]={
{% if lptype == "mini" %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_effect.lua" %}
{% endif %}
			["Fader 2"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
		},
		["AmpEnv"]={
			["Fader 3"]={template="FVol"},
			["Fader 4"]={template="FVol"},
			["Fader 5"]={template="FVol"},
		},
		["DryLevels"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_effect.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_effect.lua" %}
{% endif %}
			["Fader 2"]={template="FEffect"},
			["Knob V4"]={template="FPan"},
			["Fader 5"]={template="FVol"},
		},
		["FilterEnv"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_filter.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_filter.lua" %}
{% endif %}
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
		},
		["LFO"]={
			["UDVButton 1-2_2-2"]={template="UDLFO"},
			["Fader 4"]={template="FFreq"},
			["UDVButton 7-4_8-4"]={template="UDFreq"},
			["Button 1-5"]={template="BGreenOnOff"},
		},
	},
