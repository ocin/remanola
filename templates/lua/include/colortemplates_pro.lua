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
	["InvMeter"]={enabledcolor=GREEN,      activecolor=DGREEN,     disabledcolor=NOCOLOR, maxcolor=RED},
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
	["UDOsc"]={enabledcolor=AMBER, activecolor=AMBER},
	["UDOsc2"]={enabledcolor=HAMBER, activecolor=HAMBER},
	["UDAmount"]={enabledcolor=RED, activecolor=RED},
	["UDAmount2"]={enabledcolor=HRED, activecolor=HRED},
	["UDVol"]={enabledcolor=MAGENTA, activecolor=MAGENTA},
	["UDVol2"]={enabledcolor=HMAGENTA, activecolor=HMAGENTA},
	["UDGain"]={enabledcolor=RED, activecolor=RED},
	["UDGain2"]={enabledcolor=HRED, activecolor=HRED},
	["UDFreq"]={enabledcolor=GREEN, activecolor=GREEN},
	["UDFreq2"]={enabledcolor=HGREEN, activecolor=HGREEN},
	["UDMisc"]={enabledcolor=PINK, activecolor=PINK},
	["UDMisc2"]={enabledcolor=HPINK, activecolor=HPINK},
	["UDLFO"]={enabledcolor=YELLOW, activecolor=YELLOW},
	["UDLFO2"]={enabledcolor=HYELLOW, activecolor=HYELLOW},
	["UDEnv"]={enabledcolor=YELLOW, activecolor=YELLOW},
	["UDEnv2"]={enabledcolor=HYELLOW, activecolor=HYELLOW},
	["UDEffect"]={enabledcolor=BLUE, activecolor=BLUE},
	["UDEffect2"]={enabledcolor=HBLUE, activecolor=HBLUE},
	["UDPerf"]={enabledcolor=CYAN, activecolor=CYAN},
	["UDPerf2"]={enabledcolor=HCYAN, activecolor=HCYAN},
	-- Buttons
	["BAmber"]={enabledcolor=AMBER, activecolor=AMBER,  disabledcolor=NOCOLOR},
	["BRed"]={enabledcolor=RED, activecolor=RED,  disabledcolor=NOCOLOR},
	["BGreen"]={enabledcolor=GREEN, activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BYellow"]={enabledcolor=YELLOW, activecolor=YELLOW,  disabledcolor=NOCOLOR},
	["BYellow3"]={enabledcolor=YELLOW3, activecolor=YELLOW3,  disabledcolor=NOCOLOR},
	["BOrange"]={enabledcolor=ORANGE, activecolor=ORANGE,  disabledcolor=NOCOLOR},
	-- Button On/Off 
	["BRedOnOff"]={enabledcolor=HGREY,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BYellowOnOff"]={enabledcolor=HGREY,   activecolor=YELLOW,  disabledcolor=NOCOLOR},
	["BGreenOnOff"]={enabledcolor=HGREY,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BAmberOnOff"]={enabledcolor=HGREY,   activecolor=AMBER,  disabledcolor=NOCOLOR},
	["BBlueOnOff"]={enabledcolor=HGREY,   activecolor=BLUE,  disabledcolor=NOCOLOR},
	["BBGreenOnOff"]={enabledcolor=DGREEN,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BBRedOnOff"]={enabledcolor=DRED,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BBBlueOnOff"]={enabledcolor=DBLUE,   activecolor=BLUE,  disabledcolor=NOCOLOR},
	["BPerfOnOff"]={enabledcolor=DCYAN,   activecolor=CYAN,  disabledcolor=NOCOLOR},
	-- Button On/OFf Mix channel
	["BMixOnOff"]={enabledcolor=HGREY,   activecolor=BLUE,  disabledcolor=NOCOLOR},
	-- Red LED
	["BRedLed"]={enabledcolor=DGREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	-- Button Page
	["BMainPage"]={enabledcolor=WHITE,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BIndexPage"]={enabledcolor=WHITE,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BAmpPage"]={enabledcolor=MAGENTA,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BAmpModPage"]={enabledcolor=HMAGENTA,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BOscPage"]={enabledcolor=AMBER,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BOscModPage"]={enabledcolor=WAMBER,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BFilterPage"]={enabledcolor=GREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BFilterModPage"]={enabledcolor=DGREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BMainEffectPage"]={enabledcolor=HBLUE,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BEffectPage"]={enabledcolor=BLUE,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BEffect2Page"]={enabledcolor=HBLUE,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BEqPage"]={enabledcolor=HGREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BEffectSupPage"]={enabledcolor=DBLUE,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BPerformancePage"]={enabledcolor=CYAN,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BPerfPage"]={enabledcolor=CYAN,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BLFOPage"]={enabledcolor=YELLOW,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BEnvPage"]={enabledcolor=HYELLOW,   activecolor=RED,  disabledcolor=NOCOLOR},
	-- Mute/Solo
	["BMute"]={enabledcolor=DRED,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BSolo"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BSolo"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BSoloRevival"]={enabledcolor=WAMBER,   activecolor=YELLOW,  disabledcolor=NOCOLOR},
	-- Select
	["BPlaySel"]={enabledcolor=DGREEN, activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BOscSel"]={enabledcolor=DAMBER, activecolor=AMBER,  disabledcolor=NOCOLOR},
	-- Run
	["BRun"]={enabledcolor=RED,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	-- Bank / Pattern Select
	["BBank"]={enabledcolor=WAMBER,   activecolor=RED,  disabledcolor=NOCOLOR},
	-- Sel sound/cat
	["BSelCat"]={enabledcolor=AMBER,   activecolor=AMBER,  disabledcolor=NOCOLOR},
	["BSelSound"]={enabledcolor=WAMBER,   activecolor=AMBER,  disabledcolor=NOCOLOR},
	-- Step sequencer
	["BStep"]={enabledcolor=DGREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	-- Kong Pad
	["BPad"]={enabledcolor=DGREEN,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	-- Keyboard page Pad
	["BULPad"]={enabledcolor=MAGENTA,   activecolor=MAGENTA,  disabledcolor=MAGENTA},
	["BURPad"]={enabledcolor=GREEN,   activecolor=GREEN,  disabledcolor=GREEN},
	["BDLPad"]={enabledcolor=YELLOW,   activecolor=YELLOW,  disabledcolor=YELLOW},
	["BDRPad"]={enabledcolor=CYAN,   activecolor=CYAN,  disabledcolor=CYAN},
	-- Keyboard
	["BWhitekey"]={enabledcolor=WHITE,   activecolor=WHITE,  disabledcolor=WHITE},
	["BBlackkey"]={enabledcolor=BLUE,   activecolor=BLUE,  disabledcolor=BLUE},
}
