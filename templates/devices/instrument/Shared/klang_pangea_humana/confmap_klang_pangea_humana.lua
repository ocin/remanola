		["Default"]={
{% if lptype == "pro" %}
{% include "devices/instrument/Shared/klang_pangea_humana/pro/confmap_leftmenu.lua" %}
{% endif %}
		},
		["Main"]={
			["Fader 8"]={template="FGain"},
		},
		["Instrument"]={
			["UDVButton 1-2_2-2"]={template="UDAmount", inverted=true},
			["Fader 4"]={template="FAmount"},
			["UDVButton 1-5_2-5"]={template="UDFreq"},
			["UDVButton 1-6_2-6"]={template="UDFreq"},
			["UDVButton 1-7_2-7"]={template="UDFreq"},
		},
		["Amp"]={
			["Fader 2"]={template="FMisc"},
			["Fader 4"]={template="FGain"},
			["Fader 5"]={template="FGain"},
			["Fader 6"]={template="FGain"},
			["Fader 7"]={template="FGain"},
		},
		["Filter"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDFreq", inverted=true},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FEffect"},
			["Fader 6"]={template="FMisc"},
			["Fader 7"]={template="FMisc"},
			["Fader 8"]={template="FMisc"},
		},
		["Filter Envelope"]={
			["Fader 2"]={template="FMisc"},
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
		["Mod Wheel"]={
			["Fader 2"]={template="FAmount"},
			["Fader 3"]={template="FFreq"},
			["Fader 4"]={template="FGain"},
		},
