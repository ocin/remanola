local color_templates = {
	-- Fader and Knob
	["FAmber"]={enabledcolor=WGREEN, activecolor=AMBER},
	["FRed"]={enabledcolor=WGREEN, activecolor=RED},
	["FGreen"]={enabledcolor=WGREEN, activecolor=GREEN},
	["FYellow"]={enabledcolor=WGREEN, activecolor=YELLOW},
	["FOrange"]={enabledcolor=WGREEN, activecolor=ORANGE},
	-- Faders by type
	["FAmount"]={enabledcolor=WAMBER, activecolor=AMBER},
	["FGain"]={enabledcolor=WRED, activecolor=RED},
	["FFreq"]={enabledcolor=WGREEN, activecolor=GREEN},
	["FMisc"]={enabledcolor=WYELLOW, activecolor=YELLOW},
	["FEffect"]={enabledcolor=WBLUE, activecolor=BLUE},
	-- Special Vocoder Fader
	["FVCGreen"]={enabledcolor=WGREEN, activecolor=GREEN, disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=89},
	["FVCFreq"]={enabledcolor=WGREEN, activecolor=GREEN, disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=89},
	-- Fader with default value
	["FAmberDef100"]={enabledcolor=WGREEN, activecolor=AMBER, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
	["FRedDef100"]={enabledcolor=WGREEN, activecolor=RED, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
	["FGreenDef100"]={enabledcolor=WAMBER, activecolor=GREEN, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=100},
	["FYellowDef100"]={enabledcolor=WGREEN, activecolor=YELLOW, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
	["FOrangeDef100"]={enabledcolor=WGREEN, activecolor=ORANGE, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
	-- Meters
	["InvMeter"]={enabledcolor=GREEN,      activecolor=WGREEN,     disabledcolor=NOCOLOR, maxcolor=RED},
	["MRed"]={enabledcolor=WAMBER, activecolor=RED, disabledcolor=NOCOLOR, maxcolor=RED},
	-- Up/Down Buttons
	["UDAmber"]={enabledcolor=AMBER, activecolor=AMBER},
	["UDRed"]={enabledcolor=RED, activecolor=RED},
	["UDGreen"]={enabledcolor=GREEN, activecolor=GREEN},
	["UDYellow"]={enabledcolor=YELLOW, activecolor=YELLOW},
	["UDYellow3"]={enabledcolor=YELLOW3, activecolor=YELLOW3},
	["UDOrange"]={enabledcolor=ORANGE, activecolor=ORANGE},
	["UDNocolor"]={enabledcolor=NOCOLOR, activecolor=NOCOLOR},
	-- UD by type
	["UDAmount"]={enabledcolor=AMBER, activecolor=AMBER},
	["UDGain"]={enabledcolor=RED, activecolor=RED},
	["UDFreq"]={enabledcolor=GREEN, activecolor=GREEN},
	["UDMisc"]={enabledcolor=YELLOW, activecolor=YELLOW},
	["UDMisc2"]={enabledcolor=YELLOW3, activecolor=YELLOW3},
	["UDEffect"]={enabledcolor=BLUE, activecolor=BLUE},
	-- Buttons
	["BAmber"]={enabledcolor=AMBER, activecolor=AMBER,  disabledcolor=NOCOLOR},
	["BRed"]={enabledcolor=RED, activecolor=RED,  disabledcolor=NOCOLOR},
	["BGreen"]={enabledcolor=GREEN, activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BYellow"]={enabledcolor=YELLOW, activecolor=YELLOW,  disabledcolor=NOCOLOR},
	["BYellow3"]={enabledcolor=YELLOW3, activecolor=YELLOW3,  disabledcolor=NOCOLOR},
	["BOrange"]={enabledcolor=ORANGE, activecolor=ORANGE,  disabledcolor=NOCOLOR},
	-- Button On/Off 
	["BRedOnOff"]={enabledcolor=LGREY,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BYellowOnOff"]={enabledcolor=LGREY,   activecolor=YELLOW,  disabledcolor=NOCOLOR},
	["BGreenOnOff"]={enabledcolor=LGREY,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BAmberOnOff"]={enabledcolor=LGREY,   activecolor=AMBER,  disabledcolor=NOCOLOR},
	["BBGreenOnOff"]={enabledcolor=WGREEN,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	-- Red LED
	["BRedLed"]={enabledcolor=WGREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	-- Button Page
	["BMainPage"]={enabledcolor=WHITE,   activecolor=WHITE,  disabledcolor=NOCOLOR},
	["BAmpPage"]={enabledcolor=WRED,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BOscPage"]={enabledcolor=AMBER,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BOscModPage"]={enabledcolor=WAMBER,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BFilterPage"]={enabledcolor=GREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BFilterModPage"]={enabledcolor=WGREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BMainEffectPage"]={enabledcolor=RED,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BEffectPage"]={enabledcolor=BLUE,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BEffect2Page"]={enabledcolor=MBLUE,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BEffectSupPage"]={enabledcolor=WBLUE,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BPerformancePage"]={enabledcolor=YELLOW,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BLFOPage"]={enabledcolor=YELLOW,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BEnvPage"]={enabledcolor=YELLOW,   activecolor=RED,  disabledcolor=NOCOLOR},
	-- Mute/Solo
	["BMute"]={enabledcolor=WRED,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BSolo"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BSolo"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BSoloRevival"]={enabledcolor=WAMBER,   activecolor=YELLOW,  disabledcolor=NOCOLOR},
	-- Run
	["BRun"]={enabledcolor=RED,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	-- Bank / Pattern Select
	["BBank"]={enabledcolor=WAMBER,   activecolor=RED,  disabledcolor=NOCOLOR},
	-- Sel sound/cat
	["BSelCat"]={enabledcolor=AMBER,   activecolor=AMBER,  disabledcolor=NOCOLOR},
	["BSelSound"]={enabledcolor=WAMBER,   activecolor=AMBER,  disabledcolor=NOCOLOR},
	-- Step sequencer
	["BStep"]={enabledcolor=WGREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	-- Pad
	["BPad"]={enabledcolor=WGREEN,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	-- Keyboard
	["BWhitekey"]={enabledcolor=GREEN,   activecolor=GREEN,  disabledcolor=GREEN},
	["BBlackkey"]={enabledcolor=WGREEN,   activecolor=WGREEN,  disabledcolor=WGREEN},
}
