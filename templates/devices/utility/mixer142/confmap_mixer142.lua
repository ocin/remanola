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
			["Fader 6"]={template="FVol"},
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
				["Knob V6"]={template="FPan"},
				["Fader 7"]={template="FVol"},
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
			["Fader 1"]={template="FVol"},
			["Fader 2"]={template="FVol"},
			["Fader 3"]={template="FVol"},
			["Fader 4"]={template="FVol"},
			["Fader 5"]={template="FVol"},
			["Fader 6"]={template="FVol"},
			["Fader 7"]={template="FVol"},
		},
		["Level 8-14"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
			["Fader 1"]={template="FVol"},
			["Fader 2"]={template="FVol"},
			["Fader 3"]={template="FVol"},
			["Fader 4"]={template="FVol"},
			["Fader 5"]={template="FVol"},
			["Fader 6"]={template="FVol"},
			["Fader 7"]={template="FVol"},
		},
		["Pan 1-7"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
			["Knob V1"]={template="FPan"},
			["Knob V2"]={template="FPan"},
			["Knob V3"]={template="FPan"},
			["Knob V4"]={template="FPan"},
			["Knob V5"]={template="FPan"},
			["Knob V6"]={template="FPan"},
			["Knob V7"]={template="FPan"},
		},
		["Pan 8-14"]={
{% if lptype == "pro" %}
{% include "devices/utility/mixer142/pro/confmap_submenu_mutesolo.lua" %}
{% endif %}
			["Knob V1"]={template="FPan"},
			["Knob V2"]={template="FPan"},
			["Knob V3"]={template="FPan"},
			["Knob V4"]={template="FPan"},
			["Knob V5"]={template="FPan"},
			["Knob V6"]={template="FPan"},
			["Knob V7"]={template="FPan"},
		},
	},
