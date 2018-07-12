	["Line Mixer 6:2"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/utility/linemixer62/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Main"]={
			["UDVButton 7-3_8-3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Fader 6"]={template="FGain"},
		},
		["Level"]={
{% if lptype == "pro" %}
{% include "devices/utility/linemixer62/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
			["Fader 1"]={template="FGain"},
			["Fader 2"]={template="FGain"},
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
		},
		["Pan"]={
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
