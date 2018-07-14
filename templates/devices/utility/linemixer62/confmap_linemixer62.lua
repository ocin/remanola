	["Line Mixer 6:2"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/utility/linemixer62/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Main"]={
			["UDVButton 7-3_8-3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Fader 6"]={template="FVol"},
		},
		["Level"]={
{% if lptype == "pro" %}
{% include "devices/utility/linemixer62/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
			["Fader 1"]={template="FVol"},
			["Fader 2"]={template="FVol"},
			["Fader 3"]={template="FVol"},
			["Fader 4"]={template="FVol"},
			["Fader 5"]={template="FVol"},
			["Fader 6"]={template="FVol"},
		},
		["Pan"]={
			["Knob V1"]={template="FPan"},
			["Knob V2"]={template="FPan"},
			["Knob V3"]={template="FPan"},
			["Knob V4"]={template="FPan"},
			["Knob V5"]={template="FPan"},
			["Knob V6"]={template="FPan"},
{% if lptype == "pro" %}
{% include "devices/utility/linemixer62/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
		},
		["Meter"]={
{% if lptype == "pro" %}
{% include "devices/utility/linemixer62/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
		},
		["Aux Send"]={
{% if lptype == "pro" %}
{% include "devices/utility/linemixer62/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
			["Fader 1"]={template="FEffect"},
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FEffect"},
		},
	},
