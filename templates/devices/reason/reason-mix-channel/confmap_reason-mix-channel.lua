	["Mix Channel"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/reason/reason-mix-channel/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Main"]={
			["Button 1-1"]={template="BMute"},
			["Button 1-2"]={template="BSolo"},
			["Fader 4"]={template="FEffect"},
			["Knob V5"]={template="FPan"},
			["BigFader 6"]={template="FVol"},
		},
		["Index"]={
			["Button 1-8"]={template="BAmpPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BFilterModPage"},
			["Button 5-8"]={template="BFilterModPage"},
			["Button 6-8"]={template="BFilterPage"},
			["Button 7-7"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Button 8-8"]={template="BEffect2Page"},
		},
		["Input"]={
			["Knob V2"]={template="FVol"},
			["Button 1-3"]={template="BMixOnOff"},
			["Button 1-4"]={template="BMixOnOff"},
			["Button 1-5"]={template="BMixOnOff"},
			["Button 1-7"]={template="BMixOnOff"},
		},
		["Compressor"]={
			["Button 1-2"]={template="BMixOnOff"},
			["Button 4-2"]={template="BMixOnOff"},
			["Fader 3"]={template="FMixComp"},
			["Fader 4"]={template="FMixComp"},
			["Fader 5"]={template="FMixComp"},
			["Button 1-6"]={template="BMixOnOff"},
			["Meter 8"]={template="FYellow"},
		},
		["Gate"]={
			["Button 1-2"]={template="BMixOnOff"},
			["Button 4-2"]={template="BMixOnOff"},
			["Fader 3"]={template="FMixGate"},
			["Fader 4"]={template="FMixGate"},
			["Fader 5"]={template="FMixGate"},
			["Fader 6"]={template="FMixGate"},
			["Button 1-7"]={template="BMixOnOff"},
			["Meter 8"]={template="FGreen"},
		},
		["Filter"]={
			["Button 1-2"]={template="BMixOnOff"},
			["Fader 3"]={template="FMixFilter"},
			["Button 1-4"]={template="BMixOnOff"},
			["Fader 5"]={template="FMixFilter"},
			["Button 1-7"]={template="BMixOnOff"},
		},
		["Equalizer High"]={
			["Button 1-1"]={template="BMixOnOff"},
			["Button 4-1"]={template="BMixOnOff"},
			["Knob V3"]={template="FMixEqHMF"},
			["Fader 4"]={template="FMixEqHMF"},
			["Fader 5"]={template="FMixEqHMF"},
			["Button 1-6"]={template="BMixOnOff"},
			["Knob V7"]={template="FMixEqHF"},
			["Fader 8"]={template="FMixEqHF"},
		},
		["Equalizer Low"]={
			["Button 1-1"]={template="BMixOnOff"},
			["Button 4-1"]={template="BMixOnOff"},
			["Button 1-2"]={template="BMixOnOff"},
			["Knob V3"]={template="FMixEqLF"},
			["Fader 4"]={template="FMixEqLF"},
			["Knob V6"]={template="FMixEqLMF"},
			["Fader 7"]={template="FMixEqLMF"},
			["Fader 8"]={template="FMixEqLMF"},
		},
		["Insert"]={
			["Button 1-2"]={template="BMixOnOff"},
			["Button 5-2"]={template="BMixOnOff"},
			["Button 6-2"]={template="BMixOnOff"},
			["Button 7-2"]={template="BMixOnOff"},
			["Button 8-2"]={template="BMixOnOff"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FEffect"},
{% if lptype == "pro" %}
{% include "devices/reason/reason-mix-channel/pro/confmap_submenu_insert.lua" %}
{% endif %}
		},
		["Send 1"]={
			["Fader 1"]={template="FEffect"},
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FEffect"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEffect"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
			["Fader 8"]={template="FEffect"},
{% if lptype == "pro" %}
{% include "devices/reason/reason-mix-channel/pro/confmap_submenu_send.lua" %}
{% endif %}
		},
		["Send 2"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["Button 1-2"]={template="BGreenOnOff"},
			["Button 1-3"]={template="BGreenOnOff"},
			["Button 1-4"]={template="BGreenOnOff"},
			["Button 1-5"]={template="BGreenOnOff"},
			["Button 1-6"]={template="BGreenOnOff"},
			["Button 1-7"]={template="BGreenOnOff"},
			["Button 1-8"]={template="BGreenOnOff"},
			["Button 2-1"]={template="BMixOnOff"},
			["Button 2-2"]={template="BMixOnOff"},
			["Button 2-3"]={template="BMixOnOff"},
			["Button 2-4"]={template="BMixOnOff"},
			["Button 2-5"]={template="BMixOnOff"},
			["Button 2-6"]={template="BMixOnOff"},
			["Button 2-7"]={template="BMixOnOff"},
			["Button 2-8"]={template="BMixOnOff"},
{% if lptype == "pro" %}
{% include "devices/reason/reason-mix-channel/pro/confmap_submenu_send.lua" %}
{% endif %}
		},
	},
