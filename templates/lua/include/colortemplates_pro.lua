local color_templates = {
	-- Fader and Knob
	["FAmber"]={enabledcolor=DGREEN, activecolor=AMBER},
	["FRed"]={enabledcolor=DGREEN, activecolor=RED},
	["FGreen"]={enabledcolor=DGREEN, activecolor=GREEN},
	["FYellow"]={enabledcolor=DGREEN, activecolor=YELLOW},
	["FOrange"]={enabledcolor=DGREEN, activecolor=ORANGE},
	-- Faders by type
	["FOsc"]={enabledcolor=DAMBER, activecolor=AMBER},
	["FVol"]={enabledcolor=DMAGENTA, activecolor=MAGENTA},
	["FPan"]={enabledcolor=DMAGENTA, activecolor=MAGENTA},
	["FAmount"]={enabledcolor=DRED, activecolor=RED},
	["FGain"]={enabledcolor=DRED, activecolor=RED},
	["FFreq"]={enabledcolor=DGREEN, activecolor=GREEN},
	["FMisc"]={enabledcolor=DPINK, activecolor=PINK},
	["FLFO"]={enabledcolor=DYELLOW, activecolor=YELLOW},
	["FEnv"]={enabledcolor=DYELLOW, activecolor=YELLOW},
	["FPerf"]={enabledcolor=DCYAN, activecolor=CYAN},
	["FEffect"]={enabledcolor=DBLUE, activecolor=BLUE},
	-- Mix Channel
	["FMixComp"]={enabledcolor=DGREEN, activecolor=GREEN},
	["FMixGate"]={enabledcolor=DRED, activecolor=RED},
	["FMixFilter"]={enabledcolor=DORANGE, activecolor=ORANGE},
	["FMixEqHF"]={enabledcolor=DRED, activecolor=RED},
	["FMixEqHMF"]={enabledcolor=DGREEN, activecolor=GREEN},
	["FMixEqLMF"]={enabledcolor=DBLUE, activecolor=BLUE},
	["FMixEqLF"]={enabledcolor=DPINK, activecolor=PINK},
	-- Drawbars
	["DSub"]={enabledcolor=DRED, activecolor=RED},
	["DFund"]={enabledcolor=DGREY, activecolor=WHITE},
	["DHarm"]={enabledcolor=DBLUE, activecolor=BLUE},
	["DHarm7"]={enabledcolor=DCYAN, activecolor=CYAN},
	-- Special Vocoder Fader
	["FVCGreen"]={enabledcolor=DGREEN, activecolor=GREEN, disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=89},
	["FVCFreq"]={enabledcolor=DGREEN, activecolor=GREEN, disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=89},
	-- Fader with default value
	["FAmberDef100"]={enabledcolor=DGREEN, activecolor=AMBER, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
	["FRedDef100"]={enabledcolor=DGREEN, activecolor=RED, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
	["FGreenDef100"]={enabledcolor=WAMBER, activecolor=GREEN, denabledcolor=DGREEN, dactivecolor=YELLOW, defaultvalue=100},
	["FYellowDef100"]={enabledcolor=DGREEN, activecolor=YELLOW, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
	["FOrangeDef100"]={enabledcolor=DGREEN, activecolor=ORANGE, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
	-- Meters
	["InvMeter"]={enabledcolor=GREEN, activecolor=DGREEN, disabledcolor=NOCOLOR, maxcolor=RED},
	["MRed"]={enabledcolor=WAMBER, activecolor=RED, disabledcolor=NOCOLOR, maxcolor=RED},
	-- Up/Down Buttons
	["UDAmber"]={enabledcolor=AMBER, activecolor=AMBER},
	["UDAmber2"]={enabledcolor=HAMBER, activecolor=HAMBER},
	["UDRed"]={enabledcolor=RED, activecolor=RED},
	["UDGreen"]={enabledcolor=GREEN, activecolor=GREEN},
	["UDYellow"]={enabledcolor=YELLOW, activecolor=YELLOW},
	["UDYellow3"]={enabledcolor=HYELLOW, activecolor=HYELLOW},
	["UDOrange"]={enabledcolor=ORANGE, activecolor=ORANGE},
	["UDNocolor"]={enabledcolor=NOCOLOR, activecolor=NOCOLOR},
	-- UD by type
	["UDOsc"]={enabledcolor=DAMBER, activecolor=AMBER},
	["UDOsc2"]={enabledcolor=HAMBER, activecolor=AMBER},
	["UDAmount"]={enabledcolor=DRED, activecolor=RED},
	["UDAmount2"]={enabledcolor=HRED, activecolor=RED},
	["UDVol"]={enabledcolor=DMAGENTA, activecolor=MAGENTA},
	["UDVol2"]={enabledcolor=HMAGENTA, activecolor=MAGENTA},
	["UDGain"]={enabledcolor=DRED, activecolor=RED},
	["UDGain2"]={enabledcolor=HRED, activecolor=RED},
	["UDFreq"]={enabledcolor=DGREEN, activecolor=GREEN},
	["UDFreq2"]={enabledcolor=HGREEN, activecolor=GREEN},
	["UDMisc"]={enabledcolor=DPINK, activecolor=PINK},
	["UDMisc2"]={enabledcolor=HPINK, activecolor=PINK},
	["UDLFO"]={enabledcolor=DYELLOW, activecolor=YELLOW},
	["UDLFO2"]={enabledcolor=HYELLOW, activecolor=YELLOW},
	["UDEnv"]={enabledcolor=DYELLOW, activecolor=YELLOW},
	["UDEnv2"]={enabledcolor=HYELLOW, activecolor=YELLOW},
	["UDEffect"]={enabledcolor=DBLUE, activecolor=BLUE},
	["UDEffect2"]={enabledcolor=HBLUE, activecolor=BLUE},
	["UDPerf"]={enabledcolor=DCYAN, activecolor=CYAN},
	["UDPerf2"]={enabledcolor=HCYAN, activecolor=CYAN},
	-- Buttons
	["BAmber"]={enabledcolor=AMBER, activecolor=AMBER, disabledcolor=NOCOLOR},
	["BRed"]={enabledcolor=RED, activecolor=RED, disabledcolor=NOCOLOR},
	["BGreen"]={enabledcolor=GREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BYellow"]={enabledcolor=YELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR},
	["BYellow3"]={enabledcolor=YELLOW3, activecolor=YELLOW3, disabledcolor=NOCOLOR},
	["BOrange"]={enabledcolor=ORANGE, activecolor=ORANGE, disabledcolor=NOCOLOR},
	-- Button On/Off
	["BRedOnOff"]={enabledcolor=HGREY, activecolor=RED, disabledcolor=NOCOLOR},
	["BYellowOnOff"]={enabledcolor=HGREY, activecolor=YELLOW, disabledcolor=NOCOLOR},
	["BGreenOnOff"]={enabledcolor=HGREY, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BAmberOnOff"]={enabledcolor=HGREY, activecolor=AMBER, disabledcolor=NOCOLOR},
	["BBAmberOnOff"]={enabledcolor=DAMBER, activecolor=AMBER, disabledcolor=NOCOLOR},
	["BBlueOnOff"]={enabledcolor=HGREY, activecolor=BLUE, disabledcolor=NOCOLOR},
	["BBGreenOnOff"]={enabledcolor=DGREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BBRedOnOff"]={enabledcolor=DRED, activecolor=RED, disabledcolor=NOCOLOR},
	["BBBlueOnOff"]={enabledcolor=DBLUE, activecolor=BLUE, disabledcolor=NOCOLOR},
	["BBWhiteOnOff"]={enabledcolor=DGREY, activecolor=WHITE, disabledcolor=NOCOLOR},
	["BPerfOnOff"]={enabledcolor=DCYAN, activecolor=CYAN, disabledcolor=NOCOLOR},
	-- Button On/OFf Mix channel
	["BMixOnOff"]={enabledcolor=HGREY, activecolor=BLUE, disabledcolor=NOCOLOR},
	-- Red LED
	["BRedLed"]={enabledcolor=DGREEN, activecolor=RED, disabledcolor=NOCOLOR},
	-- Button Page
	["BMainPage"]={enabledcolor=DGREY, activecolor=WHITE, disabledcolor=NOCOLOR},
	["BIndexPage"]={enabledcolor=DGREY, activecolor=WHITE, disabledcolor=NOCOLOR},
	["BAmpPage"]={enabledcolor=DMAGENTA, activecolor=MAGENTA, disabledcolor=NOCOLOR},
	["BAmpModPage"]={enabledcolor=DMAGENTA, activecolor=MAGENTA, disabledcolor=NOCOLOR},
	["BOscPage"]={enabledcolor=DAMBER, activecolor=AMBER, disabledcolor=NOCOLOR},
	["BOscModPage"]={enabledcolor=DAMBER, activecolor=AMBER, disabledcolor=NOCOLOR},
	["BFilterPage"]={enabledcolor=DGREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BFilterModPage"]={enabledcolor=DGREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BGainPage"]={enabledcolor=DRED, activecolor=RED, disabledcolor=NOCOLOR},
	["BMainEffectPage"]={enabledcolor=DBLUE, activecolor=BLUE, disabledcolor=NOCOLOR},
	["BEffectPage"]={enabledcolor=DBLUE, activecolor=BLUE, disabledcolor=NOCOLOR},
	["BEffect2Page"]={enabledcolor=DBLUE, activecolor=BLUE, disabledcolor=NOCOLOR},
	["BEqPage"]={enabledcolor=DGREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BEffectSupPage"]={enabledcolor=DBLUE, activecolor=BLUE, disabledcolor=NOCOLOR},
	["BPerformancePage"]={enabledcolor=DCYAN, activecolor=CYAN, disabledcolor=NOCOLOR},
	["BPerfPage"]={enabledcolor=DCYAN, activecolor=CYAN, disabledcolor=NOCOLOR},
	["BLFOPage"]={enabledcolor=DYELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR},
	["BEnvPage"]={enabledcolor=HYELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR},
	["BModMPage"]={enabledcolor=DYELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR},
	-- Button Page (High intensity version)
	["BMainPageHigh"]={enabledcolor=WHITE, activecolor=WHITE, disabledcolor=NOCOLOR},
	["BIndexPageHigh"]={enabledcolor=WHITE, activecolor=WHITE, disabledcolor=NOCOLOR},
	["BAmpPageHigh"]={enabledcolor=MAGENTA, activecolor=MAGENTA, disabledcolor=NOCOLOR},
	["BAmpModPageHigh"]={enabledcolor=MAGENTA, activecolor=MAGENTA, disabledcolor=NOCOLOR},
	["BOscPageHigh"]={enabledcolor=AMBER, activecolor=AMBER, disabledcolor=NOCOLOR},
	["BOscModPageHigh"]={enabledcolor=AMBER, activecolor=AMBER, disabledcolor=NOCOLOR},
	["BFilterPageHigh"]={enabledcolor=GREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BFilterModPageHigh"]={enabledcolor=GREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BMainEffectPageHigh"]={enabledcolor=BLUE, activecolor=BLUE, disabledcolor=NOCOLOR},
	["BEffectPageHigh"]={enabledcolor=BLUE, activecolor=BLUE, disabledcolor=NOCOLOR},
	["BEffect2PageHigh"]={enabledcolor=BLUE, activecolor=BLUE, disabledcolor=NOCOLOR},
	["BEqPageHigh"]={enabledcolor=GREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BEffectSupPageHigh"]={enabledcolor=BLUE, activecolor=BLUE, disabledcolor=NOCOLOR},
	["BPerformancePageHigh"]={enabledcolor=CYAN, activecolor=CYAN, disabledcolor=NOCOLOR},
	["BPerfPageHigh"]={enabledcolor=CYAN, activecolor=CYAN, disabledcolor=NOCOLOR},
	["BLFOPageHigh"]={enabledcolor=YELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR},
	["BEnvPageHigh"]={enabledcolor=YELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR},
	["BModMPageHigh"]={enabledcolor=YELLOW, activecolor=YELLOW, disabledcolor=NOCOLOR},
	-- Mute/Solo
	["BMute"]={enabledcolor=DRED, activecolor=RED, disabledcolor=NOCOLOR},
	["BSolo"]={enabledcolor=WAMBER, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BSoloRevival"]={enabledcolor=WAMBER, activecolor=YELLOW, disabledcolor=NOCOLOR},
	-- Select
	["BPlaySel"]={enabledcolor=DGREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
	["BOscSel"]={enabledcolor=DAMBER, activecolor=AMBER, disabledcolor=NOCOLOR},
	-- Run
	["BRun"]={enabledcolor=RED, activecolor=GREEN, disabledcolor=NOCOLOR},
	-- Bank / Pattern Select
	["BBank"]={enabledcolor=WAMBER, activecolor=RED, disabledcolor=NOCOLOR},
	-- Sel sound/cat
	["BSelCat"]={enabledcolor=AMBER, activecolor=AMBER, disabledcolor=NOCOLOR},
	["BSelSound"]={enabledcolor=WAMBER, activecolor=AMBER, disabledcolor=NOCOLOR},
	-- Step sequencer
	["BStep"]={enabledcolor=DGREEN, activecolor=RED, disabledcolor=NOCOLOR},
	-- Drum Pad
	["BPad"]={enabledcolor=DGREEN, activecolor=GREEN, disabledcolor=NOCOLOR},
	-- Keyboard page Pad
	["BULPad"]={enabledcolor=MAGENTA, activecolor=MAGENTA, disabledcolor=MAGENTA},
	["BURPad"]={enabledcolor=GREEN, activecolor=GREEN, disabledcolor=GREEN},
	["BDLPad"]={enabledcolor=YELLOW, activecolor=YELLOW, disabledcolor=YELLOW},
	["BDRPad"]={enabledcolor=CYAN, activecolor=CYAN, disabledcolor=CYAN},
	-- Keyboard
	["BWhitekey"]={enabledcolor=WHITE, activecolor=WHITE, disabledcolor=WHITE},
	["BBlackkey"]={enabledcolor=BLUE, activecolor=BLUE, disabledcolor=BLUE},
}
