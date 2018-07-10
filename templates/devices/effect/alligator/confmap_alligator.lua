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
			["Knob V3"]={template="FMisc"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
			["Knob V6"]={template="FMisc"},
		},
		["BPFilter"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_filter.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_filter.lua" %}
{% endif %}
			["Knob V3"]={template="FMisc"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
			["Knob V6"]={template="FMisc"},
		},
		["LPFilter"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_filter.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_filter.lua" %}
{% endif %}
			["Knob V3"]={template="FMisc"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
			["Knob V6"]={template="FMisc"},
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
			["Knob V6"]={template="FGain"},
			["Fader 7"]={template="FGain"},
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
			["Knob V6"]={template="FGain"},
			["Fader 7"]={template="FGain"},
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
			["Knob V6"]={template="FGain"},
			["Fader 7"]={template="FGain"},
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
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
		},
		["DryLevels"]={
{% if lptype == "pro" %}
{% include "devices/effect/alligator/pro/confmap_submenu_effect.lua" %}
{% else %}
{% include "devices/effect/alligator/mini/confmap_mainmenu_effect.lua" %}
{% endif %}
			["Fader 2"]={template="FEffect"},
			["Knob V4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
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
			["UDVButton 1-2_2-2"]={template="UDMisc"},
			["Fader 4"]={template="FFreq"},
			["UDVButton 7-4_8-4"]={template="UDFreq"},
			["Button 1-5"]={template="BGreenOnOff"},
		},
	},
