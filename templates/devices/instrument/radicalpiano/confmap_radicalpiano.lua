	["Radical Piano"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/instrument/radicalpiano/pro/confmap_mainmenu.lua" %}
{% else %}
			["Button 1-1"]={template="BMainPage"},
{% endif %}
		},
		["Main"]={
			["Fader 2"]={template="FEffect"},
			["Fader 4"]={template="FOsc"},
			["UDVButton 7-5_8-5"]={template="UDOsc"},
			["Knob V6"]={template="FOsc"},
			["UDVButton 7-7_8-7"]={template="UDOsc"},
			["Fader 8"]={template="FVol"},
		},
		["Envelope"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Fader 4"]={template="FVol"},
			["Knob V5"]={template="FVol"},
			["Knob V6"]={template="FVol"},
		},
		["Velocity"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Fader 4"]={template="FPerf"},
			["Fader 5"]={template="FPerf"},
			["Knob V6"]={template="FPerf"},
		},
		["Tune"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Knob V4"]={template="FFreq"},
			["Fader 5"]={template="FOsc"},
		},
		["Resonance"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Knob V4"]={template="FOsc"},
			["Knob V5"]={template="FFreq"},
		},
		["Mechanics"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Knob V4"]={template="FOsc"},
			["Knob V5"]={template="FOsc"},
			["Knob V6"]={template="FOsc"},
		},
		["Eq"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 1-1"]={template="BRedOnOff"},
			["Knob V4"]={template="FEffect"},
			["Knob V5"]={template="FEffect"},
			["Knob V6"]={template="FEffect"},
{% if lptype == "pro" %}
{% include "devices/instrument/radicalpiano/pro/confmap_submenu_effect.lua" %}
{% endif %}
		},
		["Ambience"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["UDVButton 1-2_2-2"]={template="UDEffect", inverted=true},
			["Fader 4"]={template="FEffect"},
{% if lptype == "pro" %}
{% include "devices/instrument/radicalpiano/pro/confmap_submenu_effect.lua" %}
{% endif %}
		},
		["Output"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Fader 3"]={template="FEffect"},
			["Knob V4"]={template="FEffect"},
{% if lptype == "pro" %}
{% include "devices/instrument/radicalpiano/pro/confmap_submenu_effect.lua" %}
{% endif %}
		},
	},
