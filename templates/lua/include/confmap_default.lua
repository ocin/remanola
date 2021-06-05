	["Default"]={
		["Default"]={
			["Button *"]={enabledcolor=YELLOW, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Fader *"]={template="FYellow"},
			["BigFader *"]={enabledcolor=WAMBER, activecolor=GREEN, disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=751, bvmap="BigFader"},
			["MFader *"]={enabledcolor=WYELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR, bvmap="MFader"},
			["Drawbar *"]={ttemplate="FYellow", defaultvalue=0},
			["Meter *"]={enabledcolor=WAMBER, activecolor=GREEN, disabledcolor=NOCOLOR, maxcolor=RED},
			["Knob *"]={template="FYellow"},
			["UDHButton *"]={enabledcolor=YELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR},
			["UDVButton *"]={enabledcolor=YELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR},
			["EFSButton"]={enabledcolor=YELLOW, activecolor=GREEN, disabledcolor=NOCOLOR},

			["Button D1"]={enabledcolor=WGREEN, activecolor=WGREEN, disabledcolor=NOCOLOR},
			["Button D2"]={enabledcolor=ORANGE, activecolor=YELLOW, disabledcolor=NOCOLOR},
			["Button D3"]={enabledcolor=WRED, activecolor=RED, disabledcolor=NOCOLOR},
			["Button D4"]={enabledcolor=WAMBER, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Button D5"]={enabledcolor=WAMBER, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Button D6"]={enabledcolor=YELLOW, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Button D7"]={enabledcolor=YELLOW, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Button D8"]={enabledcolor=RED, activecolor=AMBER, disabledcolor=NOCOLOR},

			["Button C1"]={enabledcolor=ORANGE, activecolor=ORANGE, disabledcolor=NOCOLOR},
			["Button C2"]={enabledcolor=ORANGE, activecolor=ORANGE, disabledcolor=NOCOLOR},
			["Button C3"]={enabledcolor=GREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Button C4"]={enabledcolor=GREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
{% if lptype == "mini" %}
			["Button C5"]={template="BMainPage", helptext="Goto Main"},
{% endif %}
			["Button C6"]={template="BPerfPage", helptext="Goto Keyboard"},
			["Button C7"]={template="BIndexPage", helptext="Goto Index"},
			["Button C8"]={enabledcolor=YELLOW, activecolor=RED, disabledcolor=GREEN},
			["Button B1"]={template="BMainPage"},

			["Side LED"]={enabledcolor=GREEN, activecolor=GREEN, disabledcolor=GREEN},
		},
		["Index"]={
			["Button C7"]={enabledcolor=WHITE, activecolor=WHITE, disabledcolor=NOCOLOR, helptext="Goto Internal"},
			["Button 1-1"]={template="BMainPageHigh", helptext="Goto Main"},
			["Button 2-1"]={template="BOscPageHigh"},
			["Button 3-1"]={template="BOscPageHigh"},
			["Button 4-1"]={template="BOscPageHigh"},
			["Button 5-1"]={template="BOscPageHigh"},
			["Button 6-1"]={template="BOscPageHigh"},
			["Button 7-1"]={template="BOscPageHigh"},
			["Button 8-1"]={template="BOscPageHigh"},

			["Button 1-2"]={template="BAmpPageHigh"},
			["Button 2-2"]={template="BOscModPageHigh"},
			["Button 3-2"]={template="BOscModPageHigh"},
			["Button 4-2"]={template="BOscModPageHigh"},
			["Button 5-2"]={template="BOscModPageHigh"},
			["Button 6-2"]={template="BOscModPageHigh"},
			["Button 7-2"]={template="BOscModPageHigh"},
			["Button 8-2"]={template="BOscModPageHigh"},

			["Button 1-3"]={template="BAmpPageHigh"},
			["Button 2-3"]={template="BOscModPageHigh"},
			["Button 3-3"]={template="BOscModPageHigh"},
			["Button 4-3"]={template="BOscModPageHigh"},
			["Button 5-3"]={template="BOscModPageHigh"},
			["Button 6-3"]={template="BOscModPageHigh"},
			["Button 7-3"]={template="BOscModPageHigh"},
			["Button 8-3"]={template="BOscModPageHigh"},

			["Button 1-4"]={template="BAmpPageHigh"},
			["Button 2-4"]={template="BOscModPageHigh"},
			["Button 3-4"]={template="BOscModPageHigh"},
			["Button 4-4"]={template="BOscModPageHigh"},
			["Button 5-4"]={template="BOscModPageHigh"},
			["Button 6-4"]={template="BOscModPageHigh"},
			["Button 7-4"]={template="BOscModPageHigh"},
			["Button 8-4"]={template="BOscModPageHigh"},

			["Button 1-5"]={template="BPerformancePageHigh"},
			["Button 2-5"]={template="BFilterPageHigh"},
			["Button 3-5"]={template="BFilterPageHigh"},
			["Button 4-5"]={template="BFilterPageHigh"},
			["Button 5-5"]={template="BLFOPageHigh"},
			["Button 6-5"]={template="BLFOPageHigh"},
			["Button 7-5"]={template="BLFOPageHigh"},
			["Button 8-5"]={template="BLFOPageHigh"},

			["Button 1-6"]={template="BPerformancePageHigh"},
			["Button 2-6"]={template="BFilterModPageHigh"},
			["Button 3-6"]={template="BFilterModPageHigh"},
			["Button 4-6"]={template="BFilterModPageHigh"},
			["Button 5-6"]={template="BEnvPageHigh"},
			["Button 6-6"]={template="BEnvPageHigh"},
			["Button 7-6"]={template="BEnvPageHigh"},
			["Button 8-6"]={template="BEnvPageHigh"},

			["Button 1-7"]={template="BPerformancePageHigh"},
			["Button 2-7"]={template="BEffectPageHigh"},
			["Button 3-7"]={template="BEffectPageHigh"},
			["Button 4-7"]={template="BEffectPageHigh"},
			["Button 5-7"]={template="BEffectPageHigh"},
			["Button 6-7"]={template="BEffectPageHigh"},
			["Button 7-7"]={template="BEffectPageHigh"},
			["Button 8-7"]={template="BEffectPageHigh"},

			["Button 1-8"]={template="BMainEffectPageHigh"},
			["Button 2-8"]={template="BEffectPageHigh"},
			["Button 3-8"]={template="BEffectPageHigh"},
			["Button 4-8"]={template="BEffectPageHigh"},
			["Button 5-8"]={template="BEffectPageHigh"},
			["Button 6-8"]={template="BEffectPageHigh"},
			["Button 7-8"]={template="BEffectPageHigh"},
			["Button 8-8"]={template="BEffectPageHigh"},
		},
		["Internal"]={
			["Button C7"]={enabledcolor=RED, activecolor=RED, disabledcolor=NOCOLOR},
			["Button 1-1"]={template="BMainPage"},
			["Button C1"]={enabledcolor=NOCOLOR, activecolor=ORANGE, disabledcolor=NOCOLOR},
			["Button C2"]={enabledcolor=NOCOLOR, activecolor=ORANGE, disabledcolor=NOCOLOR},
			["Button C3"]={enabledcolor=NOCOLOR, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Button C4"]={enabledcolor=NOCOLOR, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Button H"]={enabledcolor=YELLOW, activecolor=GREEN, disabledcolor=NOCOLOR},
{% if lptype == "pro" %}
{% include "lua/include/confmap_default_colortest_pro.lua" %}
{% else %}
			["Button 1-6"]={enabledcolor=NOCOLOR, activecolor=GREEN, disabledcolor=GREEN},
			["Button 1-7"]={enabledcolor=NOCOLOR, activecolor=GREEN, disabledcolor=GREEN},
			["Button 1-8"]={enabledcolor=NOCOLOR, activecolor=GREEN, disabledcolor=GREEN},
			["Button 2-8"]={enabledcolor=NOCOLOR, activecolor=GREEN, disabledcolor=GREEN},
			["Button 7-8"]={enabledcolor=NOCOLOR, activecolor=RED, disabledcolor=ORANGE},
			["Button 8-8"]={enabledcolor=NOCOLOR, activecolor=RED, disabledcolor=ORANGE},
{% include "lua/include/confmap_default_colortest_mini.lua" %}
{% endif %}
		},
		["Keyboard"]={
{% if lptype == "pro" %}
			["Button A1"]={template="BPerformancePage"},
			["Button A2"]={template="BPerformancePage"},
{% endif %}
			["Kbd"]={
				["Button 1-2"]={template="BPerformancePage"},
				["Button 2-2"]={template="BPerformancePage"},
				["Fader 1"]={template="FPerf"},
				["Knob V1"]={template="FFreq", resetonrel=true},
				["UDVButton 1-3_2-3"]={template="UDPerf"},
				["Button 1-4"]={template="BPerformancePage"},
				["Button 1-5"]={template="BPerformancePage"},
				["Button 1-6"]={template="BPerformancePage"},
				["Button 1-7"]={template="BPerformancePage"},
				["Button 1-8"]={template="BPerformancePage"},
				["Button 2-4"]={template="BFilterPage"},
				["Button 2-5"]={template="BFilterPage"},
				["Button 2-6"]={template="BFilterPage"},
				["Button 2-7"]={template="BFilterPage"},
				["Button 2-8"]={template="BFilterPage"},

				["Button 8-2"]={template="BWhitekey"},
				["Button 7-2"]={template="BBlackkey"},
				["Button 8-3"]={template="BWhitekey"},
				["Button 7-3"]={template="BBlackkey"},
				["Button 8-4"]={template="BWhitekey"},
				["Button 8-5"]={template="BWhitekey"},
				["Button 7-5"]={template="BBlackkey"},
				["Button 8-6"]={template="BWhitekey"},
				["Button 7-6"]={template="BBlackkey"},
				["Button 8-7"]={template="BWhitekey"},
				["Button 7-7"]={template="BBlackkey"},
				["Button 8-8"]={template="BWhitekey"},

				["Button 6-2"]={template="BWhitekey"},
				["Button 5-2"]={template="BBlackkey"},
				["Button 6-3"]={template="BWhitekey"},
				["Button 5-3"]={template="BBlackkey"},
				["Button 6-4"]={template="BWhitekey"},
				["Button 6-5"]={template="BWhitekey"},
				["Button 5-5"]={template="BBlackkey"},
				["Button 6-6"]={template="BWhitekey"},
				["Button 5-6"]={template="BBlackkey"},
				["Button 6-7"]={template="BWhitekey"},
				["Button 5-7"]={template="BBlackkey"},
				["Button 6-8"]={template="BWhitekey"},

				["Button 4-2"]={template="BWhitekey"},
				["Button 3-2"]={template="BBlackkey"},
				["Button 4-3"]={template="BWhitekey"},
				["Button 3-3"]={template="BBlackkey"},
				["Button 4-4"]={template="BWhitekey"},
				["Button 4-5"]={template="BWhitekey"},
				["Button 3-5"]={template="BBlackkey"},
				["Button 4-6"]={template="BWhitekey"},
				["Button 3-6"]={template="BBlackkey"},
				["Button 4-7"]={template="BWhitekey"},
				["Button 3-7"]={template="BBlackkey"},
				["Button 4-8"]={template="BWhitekey"},
			},
			["Drum"]={
				-- Pads UL
				["Button 1-1"]={template="BULPad"},
				["Button 1-2"]={template="BULPad"},
				["Button 1-3"]={template="BULPad"},
				["Button 1-4"]={template="BULPad"},
				["Button 2-1"]={template="BULPad"},
				["Button 2-2"]={template="BULPad"},
				["Button 2-3"]={template="BULPad"},
				["Button 2-4"]={template="BULPad"},
				["Button 3-1"]={template="BULPad"},
				["Button 3-2"]={template="BULPad"},
				["Button 3-3"]={template="BULPad"},
				["Button 3-4"]={template="BULPad"},
				["Button 4-1"]={template="BULPad"},
				["Button 4-2"]={template="BULPad"},
				["Button 4-3"]={template="BULPad"},
				["Button 4-4"]={template="BULPad"},
				-- Pads UR
				["Button 1-5"]={template="BURPad"},
				["Button 1-6"]={template="BURPad"},
				["Button 1-7"]={template="BURPad"},
				["Button 1-8"]={template="BURPad"},
				["Button 2-5"]={template="BURPad"},
				["Button 2-6"]={template="BURPad"},
				["Button 2-7"]={template="BURPad"},
				["Button 2-8"]={template="BURPad"},
				["Button 3-5"]={template="BURPad"},
				["Button 3-6"]={template="BURPad"},
				["Button 3-7"]={template="BURPad"},
				["Button 3-8"]={template="BURPad"},
				["Button 4-5"]={template="BURPad"},
				["Button 4-6"]={template="BURPad"},
				["Button 4-7"]={template="BURPad"},
				["Button 4-8"]={template="BURPad"},
				-- Pads DL
				["Button 5-1"]={template="BDLPad"},
				["Button 5-2"]={template="BDLPad"},
				["Button 5-3"]={template="BDLPad"},
				["Button 5-4"]={template="BDLPad"},
				["Button 6-1"]={template="BDLPad"},
				["Button 6-2"]={template="BDLPad"},
				["Button 6-3"]={template="BDLPad"},
				["Button 6-4"]={template="BDLPad"},
				["Button 7-1"]={template="BDLPad"},
				["Button 7-2"]={template="BDLPad"},
				["Button 7-3"]={template="BDLPad"},
				["Button 7-4"]={template="BDLPad"},
				["Button 8-1"]={template="BDLPad"},
				["Button 8-2"]={template="BDLPad"},
				["Button 8-3"]={template="BDLPad"},
				["Button 8-4"]={template="BDLPad"},
				-- Pads DR
				["Button 5-5"]={template="BDRPad"},
				["Button 5-6"]={template="BDRPad"},
				["Button 5-7"]={template="BDRPad"},

				["Button 6-5"]={template="BDRPad"},
				["Button 6-6"]={template="BDRPad"},
				["Button 6-7"]={template="BDRPad"},
				["Button 6-8"]={template="BDRPad"},
				["Button 7-5"]={template="BDRPad"},
				["Button 7-6"]={template="BDRPad"},
				["Button 7-7"]={template="BDRPad"},
				["Button 7-8"]={template="BDRPad"},
				["Button 8-5"]={template="BDRPad"},
				["Button 8-6"]={template="BDRPad"},
				["Button 8-7"]={template="BDRPad"},
				["Button 8-8"]={template="BDRPad"},
			},
		},
		["Transport"]={
			["Button D1"]={enabledcolor=GREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Button D2"]={enabledcolor=ORANGE, activecolor=YELLOW, disabledcolor=NOCOLOR},
			["Button D3"]={enabledcolor=WRED, activecolor=RED, disabledcolor=NOCOLOR},
			["Button D4"]={enabledcolor=AMBER, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Button D5"]={enabledcolor=AMBER, activecolor=GREEN, disabledcolor=NOCOLOR},
			["Button D6"]={template="BBGreenOnOff"},
			["Button D7"]={template="BBGreenOnOff"},
			["Button D8"]={enabledcolor=YELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR},
		},
		["Options"]={
			["Button D1"]={template="BRedOnOff"},
			["Button D2"]={template="BRed"},
			["Button D3"]={template="BGreen"},
			["Button D4"]={template="BGreenOnOff"},
			["Button D5"]={template="BRedOnOff"},
			["Button D6"]={template="BRedOnOff"},
			["Button D7"]={template="BRedOnOff"},
			["Button D8"]={enabledcolor=GREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
		},
	},
