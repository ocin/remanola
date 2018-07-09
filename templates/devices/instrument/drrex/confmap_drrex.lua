	["DrOctoRex"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/instrument/drrex/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Main"]={
			["UDVButton 1-2_2-2"]={template="UDFreq"},
			["UDVButton 1-3_2-3"]={template="UDMisc"},
			-- Select Loop
			["Button 4-3"]={template="BYellowOnOff"},
			["Button 4-4"]={template="BYellowOnOff"},
			["Button 4-5"]={template="BYellowOnOff"},
			["Button 4-6"]={template="BYellowOnOff"},
			["Button 5-3"]={template="BYellowOnOff"},
			["Button 5-4"]={template="BYellowOnOff"},
			["Button 5-5"]={template="BYellowOnOff"},
			["Button 5-6"]={template="BYellowOnOff"},
			-- Right Controls
			["Button 1-7"]={template="BRedOnOff"},
			["Button 5-7"]={template="BYellowOnOff"},
			["UDVButton 7-8_8-8"]={template="FFreq"},
			["Fader 8"]={template="FGain"},
		},
		["AmpEnv"]={
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
			["Fader 7"]={template="FGain"},
		},
		["Osc"]={
			["Knob V2"]={template="FAmount"},
			["UDVButton 1-3_2-3"]={template="UDFreq"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
		},
		["Loop"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="UDAmount"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
			["Fader 8"]={template="FGain"},
		},
		["Performance"]={
			["UDVButton 3-1_4-1"]={template="UDMisc"},
			["UDVButton 7-1_8-1"]={template="UDMisc"},
			["Knob V2"]={template="FFreq"},
			["Knob V3"]={template="FFreq"},
			["Knob V4"]={template="FEffect"},
			["Knob V6"]={template="FMisc"},
			["Knob V7"]={template="FEffect"},
			["Knob V8"]={template="FGain"},
		},
		["Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="FFreq", inverted=true},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
		},
		["FilterEnv"]={
			["Fader 2"]={template="FAmount"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
			["Fader 7"]={template="FFreq"},
		},
		["LFO"]={
			["UDVButton 1-2_2-2"]={template="FMisc", inverted=true},
			["UDVButton 5-2_6-2"]={template="FMisc", inverted=true},
			["Button 1-4"]={template="BRedOnOff"},
			["Fader 5"]={template="FFreq"},
			["UDVButton 7-5_8-5"]={template="FFreq"},
			["Fader 8"]={template="FAmount"},
		},
	},
