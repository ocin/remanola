	["Mixer 14:2"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Main"]={
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FGain"},
		},
		["Index"]={
			["Button 2-2"]={template="BAmpPage"},
			["Button 2-3"]={template="BAmpPage"},
			["Button 7-1"]={template="BAmpPage"},
			["Button 7-2"]={template="BAmpPage"},
			["Button 7-3"]={template="BAmpPage"},
			["Button 7-4"]={template="BAmpPage"},
			["Button 7-5"]={template="BAmpPage"},
			["Button 7-6"]={template="BAmpPage"},
			["Button 7-7"]={template="BAmpPage"},
			["Button 8-1"]={template="BAmpPage"},
			["Button 8-2"]={template="BAmpPage"},
			["Button 8-3"]={template="BAmpPage"},
			["Button 8-4"]={template="BAmpPage"},
			["Button 8-5"]={template="BAmpPage"},
			["Button 8-6"]={template="BAmpPage"},
			["Button 8-7"]={template="BAmpPage"},
		},
		["Channel 1-7"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_submenu_channel.lua" %}
{% endif %}
		},
		["Channel 8-14"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_submenu_channel.lua" %}
{% endif %}
		},
		["Channel *"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_submenu_channel.lua" %}
{% endif %}
			["Button 1-1"]={template="BAmpPage"},
			["Button 2-1"]={template="BFilterPage"},
			["Button 3-1"]={template="BEffectPage"},
			["ChannelMain"]={
				["Button 1-2"]={template="BMute"},
				["Button 2-2"]={template="BSolo"},
				["Knob V6"]={template="FGain"},
				["Fader 7"]={template="FGain"},
			},
			["ChannelEq"]={
				["Button 1-2"]={template="BYellowOnOff"},
				["Knob V4"]={template="FFreq"},
				["Knob V5"]={template="FFreq"},
			},
			["ChannelAuxSend"]={
				["Fader 2"]={template="FEffect"},
				["Fader 3"]={template="FEffect"},
				["Fader 4"]={template="FEffect"},
				["Fader 5"]={template="FEffect"},
				["Button 8-6"]={template="BYellowOnOff"},
			},
		},
		["Level 1-7"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
			["Fader 1"]={template="FGain"},
			["Fader 2"]={template="FGain"},
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
			["Fader 7"]={template="FGain"},
		},
		["Level 8-14"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
			["Fader 1"]={template="FGain"},
			["Fader 2"]={template="FGain"},
			["Fader 3"]={template="FGain"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
			["Fader 7"]={template="FGain"},
		},
		["Pan 1-7"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
			["Knob V1"]={template="FMisc"},
			["Knob V2"]={template="FMisc"},
			["Knob V3"]={template="FMisc"},
			["Knob V4"]={template="FMisc"},
			["Knob V5"]={template="FMisc"},
			["Knob V6"]={template="FMisc"},
			["Knob V7"]={template="FMisc"},
		},
		["Pan 8-14"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
			["Knob V1"]={template="FMisc"},
			["Knob V2"]={template="FMisc"},
			["Knob V3"]={template="FMisc"},
			["Knob V4"]={template="FMisc"},
			["Knob V5"]={template="FMisc"},
			["Knob V6"]={template="FMisc"},
			["Knob V7"]={template="FMisc"},
		},
	},
