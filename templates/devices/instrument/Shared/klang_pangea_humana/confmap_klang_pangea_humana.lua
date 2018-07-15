		["Default"]={
{% if lptype == "pro" %}
{% include "devices/instrument/Shared/klang_pangea_humana/pro/confmap_mainmenu.lua" %}
{% endif %}
		},
		["Main"]={
			["UDVButton 1-2_2-2"]={template="UDOsc", inverted=true},
			["Fader 8"]={template="FVol"},
		},
		["Perf"]={
			["UDVButton 7-1_8-1"]={template="UDPerf"},
			["Fader 2"]={template="FOsc"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FVol"},
		},
		["Instrument"]={
			["UDVButton 1-2_2-2"]={template="UDOsc", inverted=true},
			["Fader 4"]={template="FOsc"},
			["UDVButton 1-5_2-5"]={template="UDFreq"},
			["UDVButton 1-6_2-6"]={template="UDFreq"},
			["UDVButton 1-7_2-7"]={template="UDFreq"},
		},
		["Amp"]={
			["Fader 2"]={template="FPerf"},
			["Fader 4"]={template="FVol"},
			["Fader 5"]={template="FVol"},
			["Fader 6"]={template="FVol"},
			["Fader 7"]={template="FVol"},
		},
		["Filter"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDFreq", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 5"]={template="FEnv"},
			["Fader 7"]={template="FPerf"},
			["Fader 8"]={template="FPerf"},
		},
		["Filter Envelope"]={
			["Fader 2"]={template="FEnv"},
			["Fader 4"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
			["Fader 7"]={template="FFreq"},
		},
		["Delay"]={
			["Button 1-1"]={template="BRedOnOff"},
			["Fader 2"]={template="FFreq"},
			["UDVButton 7-2_8-2"]={template="UDFreq"},
			["Button 1-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FEffect"},
			["Button 1-5"]={template="BRedOnOff"},
			["Fader 6"]={template="FEffect"},
			["Fader 7"]={template="FEffect"},
		},
		["Reverb"]={
			["Button 1-1"]={template="BRedOnOff"},
			["Fader 2"]={template="FEffect"},
			["Fader 3"]={template="FFreq"},
			["Fader 5"]={template="FFreq"},
			["Fader 6"]={template="FFreq"},
			["Fader 8"]={template="FEffect"},
		},
