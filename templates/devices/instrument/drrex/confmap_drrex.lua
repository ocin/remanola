	["DrOctoRex"]={
		["Default"]={
{% if lptype == "pro" %}
{% include "devices/instrument/drrex/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Main"]={
			["UDVButton 1-2_2-2"]={template="UDPerf"},
			["UDVButton 1-3_2-3"]={template="UDPerf"},
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
			["Button 5-7"]={template="BRun"},
			["UDVButton 7-7_8-7"]={template="FFreq"},
			["Fader 8"]={template="FVol"},
		},
		["AmpEnv"]={
			["Fader 4"]={template="FVol"},
			["Fader 5"]={template="FVol"},
			["Fader 6"]={template="FVol"},
			["Fader 7"]={template="FVol"},
		},
		["Osc"]={
			["Knob V2"]={template="FOsc"},
			["UDVButton 1-3_2-3"]={template="UDFreq"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
		},
		["Loop"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="UDPerf"},
			["UDVButton 1-4_2-4"]={template="UDFreq"},
			["Fader 8"]={template="FVol"},
		},
		["Performance"]={
			["UDVButton 3-1_4-1"]={template="UDPerf"},
			["UDVButton 7-1_8-1"]={template="UDPerf"},
			["Knob V2"]={template="FFreq"},
			["Knob V3"]={template="FEffect"},
			["Knob V4"]={template="FEffect"},
			["Knob V6"]={template="FFreq"},
			["Knob V7"]={template="FEffect"},
			["Knob V8"]={template="FVol"},
		},
		["Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="FFreq", inverted=true},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FEffect"},
		},
		["FilterEnv"]={
			["Fader 2"]={template="FEnv"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
			["Fader 7"]={template="FFreq"},
		},
		["LFO"]={
			["UDVButton 1-2_2-2"]={template="UDLFO", inverted=true},
			["UDVButton 5-2_6-2"]={template="UDLFO", inverted=true},
			["Button 1-4"]={template="BRedOnOff"},
			["Fader 5"]={template="FFreq"},
			["UDVButton 7-5_8-5"]={template="UDFreq"},
			["Fader 8"]={template="FLFO"},
		},
	},
