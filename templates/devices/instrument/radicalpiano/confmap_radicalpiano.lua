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
			["Fader 4"]={template="FAmount"},
			["UDVButton 7-5_8-5"]={template="UDAmount"},
			["Knob V6"]={template="FAmount"},
			["UDVButton 7-7_8-7"]={template="UDAmount"},
			["Fader 8"]={template="FGain"},
		},
		["Envelope"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Fader 4"]={template="FGain"},
			["Knob V5"]={template="FGain"},
			["Knob V6"]={template="FGain"},
		},
		["Velocity"]={
			["Fader 4"]={template="FMisc"},
			["Fader 5"]={template="FMisc"},
			["Knob V6"]={template="FMisc"},
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
		},
		["Tune"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Knob V4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
		},
		["Resonance"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Knob V4"]={template="FFreq"},
			["Knob V5"]={template="FAmount"},
		},
		["Mechanics"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Knob V4"]={template="FAmount"},
			["Knob V5"]={template="FAmount"},
			["Knob V6"]={template="FAmount"},
		},
		["Eq"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 1-2"]={template="BRedOnOff"},
			["Knob V4"]={template="FGain"},
			["Knob V5"]={template="FGain"},
			["Knob V6"]={template="FGain"},
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
			["UDVButton 7-3_8-3"]={template="UDEffect", inverted=true},
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
