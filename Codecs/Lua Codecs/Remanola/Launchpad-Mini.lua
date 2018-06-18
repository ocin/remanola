-- Remanola Novation Launchpad Mini Codec
-- Copyright 2018 Niklas Jakobsson <nico@niconet.se>

-- This file is part of Remanola.

-- Remanola is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- Remanola is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with Remanola.  If not, see <http://www.gnu.org/licenses/>.

GREEN1=tonumber("010000",2)
GREEN2=tonumber("100000",2)
GREEN3=tonumber("110000",2)

RED1=tonumber("000001",2)
RED2=tonumber("000010",2)
RED3=tonumber("000011",2)

AMBER1=bit.bor(RED1,GREEN1)
AMBER2=bit.bor(RED2,GREEN2)
AMBER3=bit.bor(RED3,GREEN3)

ORANGE1=bit.bor(RED2,GREEN1)
ORANGE2=bit.bor(RED3,GREEN1)
ORANGE3=bit.bor(RED3,GREEN2)

YELLOW1=bit.bor(RED1,GREEN2)
YELLOW2=bit.bor(RED1,GREEN3)
YELLOW3=bit.bor(RED2,GREEN3)

RED=RED3
WRED=RED1

GREEN=GREEN3
WGREEN=GREEN1

AMBER=AMBER3
WAMBER=AMBER1

YELLOW=YELLOW2
ORANGE=ORANGE2

NOCOLOR=0

CLEAR=tonumber("001000",2)
COPY=tonumber("000100",2)

DBCOPY    = tonumber("0110000",2)
DBFLASH   = tonumber("0101000",2)
DBUPDATE0 = tonumber("0100000",2)
DBUPDATE1 = tonumber("0100100",2)
DBDISP0   = tonumber("0100000",2)
DBDISP1   = tonumber("0100001",2)

MIDI_OUT_SCROLL = "f0 00 20 29 09"
MIDI_OUT_ENDSCROLL = MIDI_OUT_SCROLL.." 00 f7"
MIDI_OUT_DOUBLEBUFF = "b0 00"
MIDI_OUT_BRIGHTNESS = "b0 1e"
MIDI_OUT_GETVERSION = "f0 00 20 29 00 70 f7"
MIDI_IN_SCROLLEND = "b0 00 03"

g_scopetext = "none"
g_colorscheme = "Default"
g_scopetext_saved = ""
g_colorscheme_saved = ""
g_brightness = 4
g_brightness_new = 4
g_helpmode = false
g_valuemode = false
g_scrolltext = nil
g_scrollcolor_default = YELLOW
g_scrollcolor = g_scrollcolor_default
g_scrolling = false
g_scrollspeed_default = 7
g_scrollspeed = g_scrollspeed_default
g_scrolltime = nil
g_playingbutton = 1
g_flashing = false
g_flashstate = 0
g_flashlength = 250
g_flashtime = nil
g_stopflashing = false
g_startflashing = false
g_lightshow = 0
g_lightshowtime = nil
g_lightshowcycle = 1
g_lightshowloop = 1
g_updatetime = nil
g_enginenum = 0
g_enginenumnew = nil
g_effectnum = 0
g_effectnumnew = nil
g_lfonum = 0
g_lfonumnew = nil
g_envnum = 0
g_envnumnew = nil
g_editnumnew = nil
g_sel1 = -1
g_sel2 = -1
g_sel3 = -1
g_sel4 = -1
g_cpage = nil
g_cstep = nil
g_updateall = true
g_currentbuffer = 0
g_startbar = false
g_barupdate = false
g_barupdatetime = nil
g_startbeat = false
g_beatupdate = false
g_beatupdatetime = nil

g_updateditems = {}

gradient={
	[1]=WGREEN,
	[2]=GREEN,
	[3]=YELLOW,
	[4]=ORANGE,
	[5]=AMBER,
	[6]=WAMBER,
	[7]=RED,
	[8]=WRED,
}

brightness={
	[1]="0d",
	[2]="08",
	[3]="04",
	[4]="02",
	[5]="00",
}

item_bvmap={
	["Default"]={
		[1]=127,
		[2]=113,
		[3]=100,
		[4]=75,
		[5]=63,
		[6]=40,
		[7]=20,
		[8]=0,
	},
	["Fader64"]={
		[1]=127,
		[2]=113,
		[3]=100,
		[4]=75,
		[5]=64,
		[6]=40,
		[7]=20,
		[8]=0,
	},
	["MeterSI"]={
		[1]=63,
		[2]=55,
		[3]=48,
		[4]=40,
		[5]=32,
		[6]=24,
		[7]=16,
		[8]=11,
	},
	["Fader VC"]={
		[1]=127,
		[2]=108,
		[3]=89,
		[4]=71,
		[5]=53,
		[6]=36,
		[7]=18,
		[8]=0,
	},
	["BigFader"]={
		[1]=1023,
		[2]=876,
		[3]=751,
		[4]=631,
		[5]=511,
		[6]=340,
		[7]=170,
		[8]=0,
	},
	["Knob V"]={
		[1]=127,
		[2]=111,
		[3]=95,
		[4]=79,
		[5]=47,
		[6]=31,
		[7]=15,
		[8]=0,
	},
	["Knob H"]={
		[1]=0,
		[2]=15,
		[3]=31,
		[4]=47,
		[5]=79,
		[6]=95,
		[7]=111,
		[8]=127,
	},
	["Drawbar"]={
		[1]=0,
		[2]=20,
		[3]=40,
		[4]=63,
		[5]=80,
		[6]=100,
		[7]=113,
		[8]=127,
	},
	["Meter"]={
		[1]=45,
		[2]=39,
		[3]=33,
		[4]=27,
		[5]=21,
		[6]=15,
		[7]=8,
		[8]=1,
	},
}

button_to_padnote={
	[70]=36,
	[71]=37,
      	[72]=38,
       	[73]=39,
       	[60]=40,
       	[61]=41,
       	[62]=42,
       	[63]=43,
       	[50]=44,
       	[51]=45,
       	[52]=46,
       	[53]=47,
       	[40]=48,
       	[41]=49,
       	[42]=50,
       	[43]=51,
}

local buttons = {
	["Button 1-1"]="90 00",
	["Button 1-2"]="90 01",
	["Button 1-3"]="90 02",
	["Button 1-4"]="90 03",
	["Button 1-5"]="90 04",
	["Button 1-6"]="90 05",
	["Button 1-7"]="90 06",
	["Button 1-8"]="90 07",
	
	["Button 2-1"]="90 10",
	["Button 2-2"]="90 11",
	["Button 2-3"]="90 12",
	["Button 2-4"]="90 13",
	["Button 2-5"]="90 14",
	["Button 2-6"]="90 15",
	["Button 2-7"]="90 16",
	["Button 2-8"]="90 17",

	["Button 3-1"]="90 20",
	["Button 3-2"]="90 21",
	["Button 3-3"]="90 22",
	["Button 3-4"]="90 23",
	["Button 3-5"]="90 24",
	["Button 3-6"]="90 25",
	["Button 3-7"]="90 26",
	["Button 3-8"]="90 27",
	
	["Button 4-1"]="90 30",
	["Button 4-2"]="90 31",
	["Button 4-3"]="90 32",
	["Button 4-4"]="90 33",
	["Button 4-5"]="90 34",
	["Button 4-6"]="90 35",
	["Button 4-7"]="90 36",
	["Button 4-8"]="90 37",
	
	["Button 5-1"]="90 40",
	["Button 5-2"]="90 41",
	["Button 5-3"]="90 42",
	["Button 5-4"]="90 43",
	["Button 5-5"]="90 44",
	["Button 5-6"]="90 45",
	["Button 5-7"]="90 46",
	["Button 5-8"]="90 47",
	
	["Button 6-1"]="90 50",
	["Button 6-2"]="90 51",
	["Button 6-3"]="90 52",
	["Button 6-4"]="90 53",
	["Button 6-5"]="90 54",
	["Button 6-6"]="90 55",
	["Button 6-7"]="90 56",
	["Button 6-8"]="90 57",
		
	["Button 7-1"]="90 60",
	["Button 7-2"]="90 61",
	["Button 7-3"]="90 62",
	["Button 7-4"]="90 63",
	["Button 7-5"]="90 64",
	["Button 7-6"]="90 65",
	["Button 7-7"]="90 66",
	["Button 7-8"]="90 67",
	
	["Button 8-1"]="90 70",
	["Button 8-2"]="90 71",
	["Button 8-3"]="90 72",
	["Button 8-4"]="90 73",
	["Button 8-5"]="90 74",
	["Button 8-6"]="90 75",
	["Button 8-7"]="90 76",
	["Button 8-8"]="90 77",
	
	["Button A"]="90 08", 
	["Button B"]="90 18", 
	["Button C"]="90 28", 
	["Button D"]="90 38", 
	["Button E"]="90 48", 
	["Button F"]="90 58", 
	["Button G"]="90 68", 
	["Button H"]="90 78",

	["Button C1"]="b0 68",
	["Button C2"]="b0 69",
	["Button C3"]="b0 6a",
	["Button C4"]="b0 6b",
	["Button C5"]="b0 6c",
	["Button C6"]="b0 6d",
	["Button C7"]="b0 6e",
	["Button C8"]="b0 6f",
}	

local color_templates = {
	-- Fader and Knob
	["FAmber"]={enabledcolor=WGREEN, activecolor=AMBER},
	["FRed"]={enabledcolor=WGREEN, activecolor=RED},
	["FGreen"]={enabledcolor=WGREEN, activecolor=GREEN},
	["FYellow"]={enabledcolor=WGREEN, activecolor=YELLOW},
	["FOrange"]={enabledcolor=WGREEN, activecolor=ORANGE},
	-- Special Vocoder Fader
	["FVCGreen"]={enabledcolor=WGREEN, activecolor=GREEN, disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=89},
	-- Fader with default value
	["FAmberDef100"]={enabledcolor=WGREEN, activecolor=AMBER, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
	["FRedDef100"]={enabledcolor=WGREEN, activecolor=RED, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
	["FGreenDef100"]={enabledcolor=WAMBER, activecolor=GREEN, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=100},
	["FYellowDef100"]={enabledcolor=WGREEN, activecolor=YELLOW, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
	["FOrangeDef100"]={enabledcolor=WGREEN, activecolor=ORANGE, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
	["InvMeter"]={enabledcolor=GREEN,      activecolor=WGREEN,     disabledcolor=NOCOLOR, maxcolor=RED},
	-- Up/Down Buttons
	["UDAmber"]={enabledcolor=AMBER, activecolor=AMBER},
	["UDRed"]={enabledcolor=RED, activecolor=RED},
	["UDGreen"]={enabledcolor=GREEN, activecolor=GREEN},
	["UDYellow"]={enabledcolor=YELLOW, activecolor=YELLOW},
	["UDYellow3"]={enabledcolor=YELLOW3, activecolor=YELLOW3},
	["UDOrange"]={enabledcolor=ORANGE, activecolor=ORANGE},
	["UDNocolor"]={enabledcolor=NOCOLOR, activecolor=NOCOLOR},
	-- Buttons
	["BAmber"]={enabledcolor=AMBER, activecolor=AMBER,  disabledcolor=NOCOLOR},
	["BRed"]={enabledcolor=RED, activecolor=RED,  disabledcolor=NOCOLOR},
	["BGreen"]={enabledcolor=GREEN, activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BYellow"]={enabledcolor=YELLOW, activecolor=YELLOW,  disabledcolor=NOCOLOR},
	["BYellow3"]={enabledcolor=YELLOW3, activecolor=YELLOW3,  disabledcolor=NOCOLOR},
	["BOrange"]={enabledcolor=ORANGE, activecolor=ORANGE,  disabledcolor=NOCOLOR},
	-- Button On/Off 
	["BRedOnOff"]={enabledcolor=WAMBER,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BYellowOnOff"]={enabledcolor=WAMBER,   activecolor=YELLOW,  disabledcolor=NOCOLOR},
	["BGreenOnOff"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
	["BAmberOnOff"]={enabledcolor=WAMBER,   activecolor=AMBER,  disabledcolor=NOCOLOR},
	-- Red LED
	["BRedLed"]={enabledcolor=WGREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	-- Button Page
	["BMainPage"]={enabledcolor=RED,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BAmpPage"]={enabledcolor=WRED,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BOscPage"]={enabledcolor=AMBER,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BOscModPage"]={enabledcolor=WAMBER,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BFilterPage"]={enabledcolor=GREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BFilterModPage"]={enabledcolor=WGREEN,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BMainEffectPage"]={enabledcolor=RED,   activecolor=RED,  disabledcolor=NOCOLOR},
	["BEffectPage"]={enabledcolor=ORANGE,   activecolor=RED,  disabledcolor=NOCOLOR},
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
}

local item_conf_map = {
	["Default"]={
		["Default"]={
			["Button *"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Fader *"]={template="FYellow"},
			["BigFader *"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=751},
			["Drawbar *"]={ttemplate="FYellow"},
			["Meter *"]={enabledcolor=WGREEN,      activecolor=GREEN,     disabledcolor=NOCOLOR, maxcolor=RED},
			["Knob *"]={template="FYellow"},
			["UDHButton *"]={enabledcolor=YELLOW,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["UDVButton *"]={enabledcolor=YELLOW,      activecolor=YELLOW,     disabledcolor=NOCOLOR},

			["Button A"]={enabledcolor=WGREEN,   activecolor=WGREEN,  disabledcolor=NOCOLOR}, 
			["Button B"]={enabledcolor=ORANGE,    activecolor=YELLOW,   disabledcolor=NOCOLOR}, 
			["Button C"]={enabledcolor=WRED,      activecolor=RED,    disabledcolor=NOCOLOR}, 
			["Button D"]={enabledcolor=WAMBER,   activecolor=GREEN,   disabledcolor=NOCOLOR}, 
			["Button E"]={enabledcolor=WAMBER,      activecolor=GREEN,  disabledcolor=NOCOLOR}, 
			["Button F"]={enabledcolor=YELLOW,      activecolor=GREEN,  disabledcolor=NOCOLOR}, 
			["Button G"]={enabledcolor=YELLOW,      activecolor=GREEN,  disabledcolor=NOCOLOR}, 
			["Button H"]={enabledcolor=RED,      activecolor=AMBER,  disabledcolor=NOCOLOR},
		
			["Button C1"]={enabledcolor=ORANGE,   activecolor=ORANGE,  disabledcolor=NOCOLOR},
			["Button C2"]={enabledcolor=ORANGE,   activecolor=ORANGE,  disabledcolor=NOCOLOR},
			["Button C3"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button C4"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button C5"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button C6"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button C7"]={enabledcolor=RED,      activecolor=RED,     disabledcolor=NOCOLOR},
			["Button C8"]={enabledcolor=YELLOW,      activecolor=RED,     disabledcolor=GREEN},
		},
		["Index"]={
			["Button 1-1"]={template="BMainPage", helptext="Goto Main"},
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 5-1"]={template="BOscPage"},
			["Button 6-1"]={template="BOscPage"},
			["Button 7-1"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},

			["Button 1-2"]={template="BAmpPage"},
			["Button 2-2"]={template="BOscModPage"},
			["Button 3-2"]={template="BOscModPage"},
			["Button 4-2"]={template="BOscModPage"},
			["Button 5-2"]={template="BOscModPage"},
			["Button 6-2"]={template="BOscModPage"},
			["Button 7-2"]={template="BOscModPage"},
			["Button 8-2"]={template="BOscModPage"},

			["Button 1-3"]={template="BAmpPage"},
			["Button 2-3"]={template="BOscModPage"},
			["Button 3-3"]={template="BOscModPage"},
			["Button 4-3"]={template="BOscModPage"},
			["Button 5-3"]={template="BOscModPage"},
			["Button 6-3"]={template="BOscModPage"},
			["Button 7-3"]={template="BOscModPage"},
			["Button 8-3"]={template="BOscModPage"},

			["Button 1-4"]={template="BAmpPage"},
			["Button 2-4"]={template="BOscModPage"},
			["Button 3-4"]={template="BOscModPage"},
			["Button 4-4"]={template="BOscModPage"},
			["Button 5-4"]={template="BOscModPage"},
			["Button 6-4"]={template="BOscModPage"},
			["Button 7-4"]={template="BOscModPage"},
			["Button 8-4"]={template="BOscModPage"},

			["Button 1-5"]={template="BPerformancePage"},
			["Button 2-5"]={template="BFilterPage"},
			["Button 3-5"]={template="BFilterPage"},
			["Button 4-5"]={template="BFilterPage"},
			["Button 5-5"]={template="BLFOPage"},
			["Button 6-5"]={template="BLFOPage"},
			["Button 7-5"]={template="BLFOPage"},
			["Button 8-5"]={template="BLFOPage"},

			["Button 1-6"]={template="BPerformancePage"},
			["Button 2-6"]={template="BFilterModPage"},
			["Button 3-6"]={template="BFilterModPage"},
			["Button 4-6"]={template="BFilterModPage"},
			["Button 5-6"]={template="BEnvPage"},
			["Button 6-6"]={template="BEnvPage"},
			["Button 7-6"]={template="BEnvPage"},
			["Button 8-6"]={template="BEnvPage"},

			["Button 1-7"]={template="BPerformancePage"},
			["Button 2-7"]={template="BEffectPage"},
			["Button 3-7"]={template="BEffectPage"},
			["Button 4-7"]={template="BEffectPage"},
			["Button 5-7"]={template="BEffectPage"},
			["Button 6-7"]={template="BEffectPage"},
			["Button 7-7"]={template="BEffectPage"},
			["Button 8-7"]={template="BEffectPage"},

			["Button 1-8"]={template="BMainEffectPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 5-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Button 8-8"]={template="BEffectPage"},
		},
		["Internal"]={
			["Button 1-1"]={template="BMainPage"},
			["Button 1-6"]={enabledcolor=NOCOLOR,    activecolor=GREEN,  disabledcolor=GREEN},
			["Button 1-7"]={enabledcolor=NOCOLOR,    activecolor=GREEN,  disabledcolor=GREEN},
			["Button 1-8"]={enabledcolor=NOCOLOR,    activecolor=GREEN,  disabledcolor=GREEN},
			["Button 2-8"]={enabledcolor=NOCOLOR,    activecolor=GREEN,  disabledcolor=GREEN},
			["Button 7-8"]={enabledcolor=NOCOLOR,    activecolor=RED,  disabledcolor=ORANGE},
			["Button 8-8"]={enabledcolor=NOCOLOR,    activecolor=RED,  disabledcolor=ORANGE},
			["Button C1"]={enabledcolor=NOCOLOR,   activecolor=ORANGE,  disabledcolor=NOCOLOR},
			["Button C2"]={enabledcolor=NOCOLOR,   activecolor=ORANGE,  disabledcolor=NOCOLOR},
			["Button C3"]={enabledcolor=NOCOLOR,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button C4"]={enabledcolor=NOCOLOR,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button H"]={enabledcolor=YELLOW,      activecolor=GREEN,  disabledcolor=NOCOLOR},
			-- Color test
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=RED3},
			["Button 5-2"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=RED2},
			["Button 5-3"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=RED1},
			["Button 5-4"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=NOCOLOR},

			["Button 6-1"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=ORANGE2},
			["Button 6-2"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=ORANGE1},
			["Button 6-3"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=AMBER1},
			["Button 6-4"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=GREEN1},

			["Button 7-1"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=ORANGE3},
			["Button 7-2"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=AMBER2},
			["Button 7-3"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=YELLOW1},
			["Button 7-4"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=GREEN2},

			["Button 8-1"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=AMBER3},
			["Button 8-2"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=YELLOW3},
			["Button 8-3"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=YELLOW2},
			["Button 8-4"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=GREEN3},
		},
	},
	["Master Section"]={
		["Default"]={
		},
		["Index"]={
			["Button 1-1"]={template="BMainPage"},
			["Button 1-2"]={template="BAmpPage"},
			["Button 1-3"]={template="BAmpPage"},
			["Button 1-5"]={template="BPerformancePage"},
			["Button 8-1"]={template="BYellow"},
			["Button 8-8"]={template="BYellow"},
		},
		["Main"]={
		},
		["Channel Mutes & Solos"]={
			["Button 1-1"]={template="BMute"},
			["Button 1-2"]={template="BMute"},
			["Button 1-3"]={template="BMute"},
			["Button 1-4"]={template="BMute"},
			["Button 1-5"]={template="BMute"},
			["Button 1-6"]={template="BMute"},
			["Button 1-7"]={template="BMute"},
			["Button 1-8"]={template="BMute"},
	
			["Button 2-1"]={template="BSolo"},
			["Button 2-2"]={template="BSolo"},
			["Button 2-3"]={template="BSolo"},
			["Button 2-4"]={template="BSolo"},
			["Button 2-5"]={template="BSolo"},
			["Button 2-6"]={template="BSolo"},
			["Button 2-7"]={template="BSolo"},
			["Button 2-8"]={template="BSolo"},

			["Button 3-1"]={template="BMute"},
			["Button 3-2"]={template="BSolo"},
		},
		["Channel Faders"]={
		},

	},
	["Mix Channel"]={
		["Default"]={
		},
		["Main"]={
			["Button 1-1"]={template="BMute"},
			["Button 1-2"]={template="BSolo"},
		},
		["Send"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["Button 2-1"]={template="BGreenOnOff"},
			["Button 3-1"]={template="BGreenOnOff"},
			["Button 4-1"]={template="BGreenOnOff"},
			["Button 5-1"]={template="BGreenOnOff"},
			["Button 6-1"]={template="BGreenOnOff"},
			["Button 7-1"]={template="BGreenOnOff"},
			["Button 8-1"]={template="BGreenOnOff"},
		},
	},
	["Kong"]={
		["Default"]={
		},
		["Index"]={
			-- Pads
			["Button 5-1"]={template="BOscPage"},
			["Button 5-2"]={template="BOscPage"},
			["Button 5-3"]={template="BOscPage"},
			["Button 5-4"]={template="BOscPage"},
			["Button 6-1"]={template="BOscPage"},
			["Button 6-2"]={template="BOscPage"},
			["Button 6-3"]={template="BOscPage"},
			["Button 6-4"]={template="BOscPage"},
			["Button 7-1"]={template="BOscPage"},
			["Button 7-2"]={template="BOscPage"},
			["Button 7-3"]={template="BOscPage"},
			["Button 7-4"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},
			["Button 8-2"]={template="BOscPage"},
			["Button 8-3"]={template="BOscPage"},
			["Button 8-4"]={template="BOscPage"},
			-- Pads
			["Button 5-5"]={template="BPerformancePage"},
			["Button 5-6"]={template="BPerformancePage"},
			["Button 5-7"]={template="BPerformancePage"},
			["Button 5-8"]={template="BPerformancePage"},
			["Button 6-5"]={template="BPerformancePage"},
			["Button 6-6"]={template="BPerformancePage"},
			["Button 6-7"]={template="BPerformancePage"},
			["Button 6-8"]={template="BPerformancePage"},
			["Button 7-5"]={template="BPerformancePage"},
			["Button 7-6"]={template="BPerformancePage"},
			["Button 7-7"]={template="BPerformancePage"},
			["Button 7-8"]={template="BPerformancePage"},
			["Button 8-5"]={template="BPerformancePage"},
			["Button 8-6"]={template="BPerformancePage"},
			["Button 8-7"]={template="BPerformancePage"},
			["Button 8-8"]={template="BPerformancePage"},
		},
		["Main"]={
			-- Pads
			["Button 5-1"]={template="BPad"},
			["Button 5-2"]={template="BPad"},
			["Button 5-3"]={template="BPad"},
			["Button 5-4"]={template="BPad"},
			["Button 6-1"]={template="BPad"},
			["Button 6-2"]={template="BPad"},
			["Button 6-3"]={template="BPad"},
			["Button 6-4"]={template="BPad"},
			["Button 7-1"]={template="BPad"},
			["Button 7-2"]={template="BPad"},
			["Button 7-3"]={template="BPad"},
			["Button 7-4"]={template="BPad"},
			["Button 8-1"]={template="BPad"},
			["Button 8-2"]={template="BPad"},
			["Button 8-3"]={template="BPad"},
			["Button 8-4"]={template="BPad"},
			["Fader 6"]={template="FRed"},
		},
		["Mutes & Solos"]={
			-- Mute
			["Button 1-1"]={template="BMute"},
			["Button 1-2"]={template="BMute"},
			["Button 1-3"]={template="BMute"},
			["Button 1-4"]={template="BMute"},
			["Button 2-1"]={template="BMute"},
			["Button 2-2"]={template="BMute"},
			["Button 2-3"]={template="BMute"},
			["Button 2-4"]={template="BMute"},
			["Button 3-1"]={template="BMute"},
			["Button 3-2"]={template="BMute"},
			["Button 3-3"]={template="BMute"},
			["Button 3-4"]={template="BMute"},
			["Button 4-1"]={template="BMute"},
			["Button 4-2"]={template="BMute"},
			["Button 4-3"]={template="BMute"},
			["Button 4-4"]={template="BMute"},
			-- Solo
			["Button 1-5"]={template="BSolo"},
			["Button 1-6"]={template="BSolo"},
			["Button 1-7"]={template="BSolo"},
			["Button 1-8"]={template="BSolo"},
			["Button 2-5"]={template="BSolo"},
			["Button 2-6"]={template="BSolo"},
			["Button 2-7"]={template="BSolo"},
			["Button 2-8"]={template="BSolo"},
			["Button 3-5"]={template="BSolo"},
			["Button 3-6"]={template="BSolo"},
			["Button 3-7"]={template="BSolo"},
			["Button 3-8"]={template="BSolo"},
			["Button 4-5"]={template="BSolo"},
			["Button 4-6"]={template="BSolo"},
			["Button 4-7"]={template="BSolo"},
			["Button 4-8"]={template="BSolo"},
		},
		["Drum *"]={
			-- Pages
			["Button 1-1"]={template="BOscPage"},
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BEffectPage"},
			["Button 4-1"]={template="BEffectPage"},
			-- Drums
			["Button 5-1"]={template="BOscPage"},
			["Button 5-2"]={template="BOscPage"},
			["Button 5-3"]={template="BOscPage"},
			["Button 5-4"]={template="BOscPage"},
			["Button 6-1"]={template="BOscPage"},
			["Button 6-2"]={template="BOscPage"},
			["Button 6-3"]={template="BOscPage"},
			["Button 6-4"]={template="BOscPage"},
			["Button 7-1"]={template="BOscPage"},
			["Button 7-2"]={template="BOscPage"},
			["Button 7-3"]={template="BOscPage"},
			["Button 7-4"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},
			["Button 8-2"]={template="BOscPage"},
			["Button 8-3"]={template="BOscPage"},
			["Button 8-4"]={template="BOscPage"},
			["DrumMain"]={
				-- Offset
				["UDVButton 1-2_2-2"]={template="UDAmber"},
				["UDVButton 3-2_4-2"]={template="UDGreen"},
				-- Sends
				["UDVButton 1-3_2-3"]={template="UDOrange"},
				["UDVButton 3-3_4-3"]={template="UDOrange"},
				["UDVButton 3-4_4-4"]={template="UDOrange"},
				-- Outputs
				["UDVButton 5-5_6-5"]={template="UDRed"},
				-- Pitch Bend Range
				["UDVButton 7-5_8-5"]={template="UDYellow"},
				["Knob V6"]={template="FAmber"},
				["Knob V7"]={template="FRed"},
				["Fader 8"]={template="FRed"},
			},
			["DrumModule"]={
				["Button 1-2"]={template="BYellowOnOff"},
				["Fader 5"]={template="FGreen"},
				["Knob V6"]={template="FAmber"},
				["Fader 7"]={template="FAmber"},
				["Fader 8"]={template="FRed"},
			},
			["DrumFX1"]={
				["Button 1-2"]={template="BYellowOnOff"},
				["Button 1-4"]={template="BYellowOnOff"},
				["Button 2-4"]={template="BYellowOnOff"},
				["Button 3-4"]={template="BYellowOnOff"},
				["Button 4-4"]={template="BYellowOnOff"},
				["Fader 5"]={template="FOrange"},
				["Fader 6"]={template="FOrange"},
			},
			["DrumFX2"]={
				["Button 1-2"]={template="BYellowOnOff"},
				["Button 1-4"]={template="BYellowOnOff"},
				["Button 2-4"]={template="BYellowOnOff"},
				["Button 3-4"]={template="BYellowOnOff"},
				["Button 4-4"]={template="BYellowOnOff"},
				["Fader 5"]={template="FOrange"},
				["Fader 6"]={template="FOrange"},
			},
		},
		["Pad *"]={
			["UDVButton 1-2_2-2"]={template="UDAmber"},
			["UDVButton 3-2_4-2"]={template="UDAmber", inverted=true},
			-- Pad Groups
			["Button 1-6"]={template="BYellowOnOff"},
			["Button 1-7"]={template="BYellowOnOff"},
			["Button 1-8"]={template="BYellowOnOff"},
			["Button 2-6"]={template="BYellowOnOff"},
			["Button 2-7"]={template="BYellowOnOff"},
			["Button 2-8"]={template="BYellowOnOff"},
			["Button 3-6"]={template="BYellowOnOff"},
			["Button 3-7"]={template="BYellowOnOff"},
			["Button 3-8"]={template="BYellowOnOff"},
			-- Pads
			["Button 5-5"]={template="BPerformancePage"},
			["Button 5-6"]={template="BPerformancePage"},
			["Button 5-7"]={template="BPerformancePage"},
			["Button 5-8"]={template="BPerformancePage"},
			["Button 6-5"]={template="BPerformancePage"},
			["Button 6-6"]={template="BPerformancePage"},
			["Button 6-7"]={template="BPerformancePage"},
			["Button 6-8"]={template="BPerformancePage"},
			["Button 7-5"]={template="BPerformancePage"},
			["Button 7-6"]={template="BPerformancePage"},
			["Button 7-7"]={template="BPerformancePage"},
			["Button 7-8"]={template="BPerformancePage"},
			["Button 8-5"]={template="BPerformancePage"},
			["Button 8-6"]={template="BPerformancePage"},
			["Button 8-7"]={template="BPerformancePage"},
			["Button 8-8"]={template="BPerformancePage"},
		},
		["Bus FX"]={
			["Button 1-2"]={template="BYellowOnOff"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FOrange"},
			["Fader 6"]={template="FRed"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
		},
		["Master FX"]={
			["Button 1-2"]={template="BYellowOnOff"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FOrange"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
		},
	},
	["Redrum"]={
		["Default"]={
		},
		["Index"]={
			-- Select Drum
			["Button 6-1"]={template="BOscPage"},
			["Button 6-2"]={template="BOscPage"},
			["Button 7-1"]={template="BOscPage"},
			["Button 7-2"]={template="BOscPage"},
			["Button 7-3"]={template="BOscPage"},
			["Button 7-4"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},
			["Button 8-2"]={template="BOscPage"},
			["Button 8-3"]={template="BOscPage"},
			["Button 8-4"]={template="BOscPage"},
		},
		["Main"]={
			-- Sequence Step and toggle selected drum step
			["Button 1-1"]={template="BStep"},
			["Button 1-2"]={template="BStep"},
			["Button 1-3"]={template="BStep"},
			["Button 1-4"]={template="BStep"},
			["Button 1-5"]={template="BStep"},
			["Button 1-6"]={template="BStep"},
			["Button 1-7"]={template="BStep"},
			["Button 1-8"]={template="BStep"},
			["Button 2-1"]={template="BStep"},
			["Button 2-2"]={template="BStep"},
			["Button 2-3"]={template="BStep"},
			["Button 2-4"]={template="BStep"},
			["Button 2-5"]={template="BStep"},
			["Button 2-6"]={template="BStep"},
			["Button 2-7"]={template="BStep"},
			["Button 2-8"]={template="BStep"},
			-- Drum Select
			["Button 3-1"]={template="BAmberOnOff"},
			["Button 3-2"]={template="BAmberOnOff"},
			["Button 4-1"]={template="BAmberOnOff"},
			["Button 4-2"]={template="BAmberOnOff"},
			["Button 4-3"]={template="BAmberOnOff"},
			["Button 4-4"]={template="BAmberOnOff"},
			["Button 5-1"]={template="BAmberOnOff"},
			["Button 5-2"]={template="BAmberOnOff"},
			["Button 5-3"]={template="BAmberOnOff"},
			["Button 5-4"]={template="BAmberOnOff"},
			-- Edit Steps, Accent
			["Button 3-5"]={template="BPerformancePage"},
			["Button 3-6"]={template="BPerformancePage"},
			-- Edit Accent, color is handled elsewhere
			["Button 4-6"]={template="BRedOnOff"},
			-- Edit Steps
			["UDVButton 5-8_6-8"]={template="UDGreen"},
			-- Flam
			["UDVButton 7-7_8-7"]={template="UDAmber"},
			["Button 8-8"]={template="BRedOnOff"},
			-- Run
			["Button 3-8"]={template="BRun"},
			-- Play, Solo, Mute
			["Button 6-5"]={template="BRed"},
			["Button 7-5"]={template="BYellow"},
			["Button 8-5"]={template="BGreen"},
			["Play"]={
				["Button 6-1"]={template="BPad"},
				["Button 6-2"]={template="BPad"},
				["Button 7-1"]={template="BPad"},
				["Button 7-2"]={template="BPad"},
				["Button 7-3"]={template="BPad"},
				["Button 7-4"]={template="BPad"},
				["Button 8-1"]={template="BPad"},
				["Button 8-2"]={template="BPad"},
				["Button 8-3"]={template="BPad"},
				["Button 8-4"]={template="BPad"},
			},
			["Solo"]={
				["Button 6-1"]={template="BSoloRevival"},
				["Button 6-2"]={template="BSoloRevival"},
				["Button 7-1"]={template="BSoloRevival"},
				["Button 7-2"]={template="BSoloRevival"},
				["Button 7-3"]={template="BSoloRevival"},
				["Button 7-4"]={template="BSoloRevival"},
				["Button 8-1"]={template="BSoloRevival"},
				["Button 8-2"]={template="BSoloRevival"},
				["Button 8-3"]={template="BSoloRevival"},
				["Button 8-4"]={template="BSoloRevival"},
			},
			["Mute"]={
				["Button 6-1"]={template="BMute"},
				["Button 6-2"]={template="BMute"},
				["Button 7-1"]={template="BMute"},
				["Button 7-2"]={template="BMute"},
				["Button 7-3"]={template="BMute"},
				["Button 7-4"]={template="BMute"},
				["Button 8-1"]={template="BMute"},
				["Button 8-2"]={template="BMute"},
				["Button 8-3"]={template="BMute"},
				["Button 8-4"]={template="BMute"},
			},
		},
		["Performance"]={
			-- Pattern enable
			["Button 1-1"]={template="BRedOnOff"},
			["Button 1-2"]={template="BRedOnOff"},
			-- Resolution, Shuffle
			["UDHButton 7-1_7-1"]={template="FYellow"},
			["UDHButton 8-3_8-4"]={template="FGreen"},
			["Button 8-5"]={template="BRedOnOff"},
			-- Pattern 1-4
			["Button 2-1"]={template="BPerformancePage"},
			["Button 2-2"]={template="BPerformancePage"},
			["Button 2-3"]={template="BPerformancePage"},
			["Button 2-4"]={template="BPerformancePage"},
			-- Pattern 5-8
			["Button 3-1"]={template="BPerformancePage"},
			["Button 3-2"]={template="BPerformancePage"},
			["Button 3-3"]={template="BPerformancePage"},
			["Button 3-4"]={template="BPerformancePage"},
			-- Bank A-D
			["Button 4-1"]={template="BOscPage"},
			["Button 4-2"]={template="BOscPage"},
			["Button 4-3"]={template="BOscPage"},
			["Button 4-4"]={template="BOscPage"},
		},
		["Drum *"]={
			-- Goto Drum edit/main
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			-- Select Drum
			["Button 6-1"]={template="BOscPage"},
			["Button 6-2"]={template="BOscPage"},
			["Button 7-1"]={template="BOscPage"},
			["Button 7-2"]={template="BOscPage"},
			["Button 7-3"]={template="BOscPage"},
			["Button 7-4"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},
			["Button 8-2"]={template="BOscPage"},
			["Button 8-3"]={template="BOscPage"},
			["Button 8-4"]={template="BOscPage"},
			-- Play, Mute, Solo
			["Button 5-1"]={template="BPad"},
			["Button 3-2"]={template="BMute"},
			["Button 3-3"]={template="BSolo"},
			-- 
			["UDVButton 5-4_6-4"]={template="UDYellow"},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["Knob V7"]={template="FRed"},
			["Fader 8"]={template="FRed"},
		},
		["Drum * Edit"]={
			-- Goto Drum edit/main
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			-- Select Drum
			["Button 6-1"]={template="BOscPage"},
			["Button 6-2"]={template="BOscPage"},
			["Button 7-1"]={template="BOscPage"},
			["Button 7-2"]={template="BOscPage"},
			["Button 7-3"]={template="BOscPage"},
			["Button 7-4"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},
			["Button 8-2"]={template="BOscPage"},
			["Button 8-3"]={template="BOscPage"},
			["Button 8-4"]={template="BOscPage"},
			--
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FAmber"},
			["Knob V7"]={template="FAmber"},
			["Fader 8"]={template="FYellow"},
		},
	},
	["Thor"]={
		["Default"]={
			["Button 1-1"]={template="BMainPage"},
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 5-1"]={template="BFilterPage"},
			["Button 6-1"]={template="BFilterPage"},
			["Button 7-1"]={template="BFilterPage"},
		},
		["Main"]={
			["UDVButton 1-2_1-2"]={template="UDYellow"},
			["UDVButton 3-2_4-2"]={template="UDYellow3"},
			["UDVButton 5-2_6-2"]={template="UDYellow", inverted=true},
			["UDVButton 7-2_8-2"]={template="UDYellow3"},
			["Fader 3"]={template="FYellow"},
			["Button 1-4"]={template="BGreenOnOff"},
			["Button 2-4"]={template="BGreenOnOff"},
			["Button 8-4"]={template="BRedOnOff"},
			["Button 8-5"]={template="BRedOnOff"},
			["Fader 6"]={template="FYellow"},
			["Fader 7"]={template="FYellow"},
			["Fader 8"]={template="FRed"},
		},
		["Osc *"]={
			["Button 1-2"]={template="BAmber"},
			["Fader 3"]={template="FAmber"},
			["UDVButton 3-2_4-2"]={template="UDAmber"},
			["UDVButton 5-2_6-2"]={template="UDAmber"},
			["UDVButton 1-4_2-4"]={template="UDYellow"},
			["UDVButton 1-5_2-5"]={template="UDGreen"},
			["UDVButton 1-6_2-6"]={template="UDGreen"},
			["UDVButton 1-7_2-7"]={template="UDGreen"},
			["Fader 8"]={template="FOrange"},
		},
		["Filter *"]={
			["Button 1-2"]={template="BGreen"},
			["Button 5-2"]={template="BRedOnOff"},
			["Button 6-2"]={template="BRedOnOff"},
			["Button 7-2"]={template="BRedOnOff"},
			["Button 8-2"]={template="BGreenOnOff"},
			["UDVButton 3-2_4-2"]={template="UDGreen"},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FYellow"},
			["Fader 7"]={template="FYellow"},
			["Fader 8"]={template="FAmber"},
		},
		["Filter Env"]={
			["Button 2-2"]={template="BGreenOnOff"},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FGreen"},
		},
		["Mixer"]={
			["Knob V3"]={template="FRed"},
			["Fader 4"]={template="FRed"},
			["Fader 5"]={template="FRed"},
		},
		["Amp"]={
			["Fader 3"]={template="FYellow"},
			["Fader 4"]={template="FRed"},
			["Knob V5"]={template="FRed"},
		},
		["Amp Env"]={
			["Button 2-2"]={template="BGreenOnOff"},
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FRed"},
			["Fader 5"]={template="FRed"},
			["Fader 6"]={template="FRed"},
		},
		["Mod Env"]={
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FYellow"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FYellow"},
		},
		["Global Env"]={ -- Global Env
			["Button 2-1"]={template="BGreenOnOff"},
			["Button 3-1"]={template="BGreenOnOff"},
			["Fader 2"]={template="FOrange"},
			["Fader 3"]={template="FYellow"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FYellow"},
			["Fader 7"]={template="FYellow"},
		},
		["LFO *"]={
                        ["UDVButton 3-1_4-1"]={template="UDYellow"},
			["Button 6-1"]={template="BGreenOnOff"},
			["Button 7-1"]={template="BGreenOnOff"},
                        ["Fader 3"]={template="FGreen"},
                        ["Fader 4"]={template="FOrange"},
		},
		["LFO 1"]={
                        ["Fader 5"]={template="FYellow"},
		},
		["Step Sequencer"]={
			-- Sequence select
			["Button 1-1"]={template="BRedOnOff"},
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 1-6"]={template="BRedOnOff"},
			["Button 1-7"]={template="BRedOnOff"},
			["Button 1-8"]={template="BRedOnOff"},
			["Button 2-1"]={template="BRedOnOff"},
			["Button 2-2"]={template="BRedOnOff"},
			["Button 2-3"]={template="BRedOnOff"},
			["Button 2-4"]={template="BRedOnOff"},
			["Button 2-5"]={template="BRedOnOff"},
			["Button 2-6"]={template="BRedOnOff"},
			["Button 2-7"]={template="BRedOnOff"},
			["Button 2-8"]={template="BRedOnOff"},
			-- Controls
			["Button 8-1"]={template="BRedOnOff"},
                        ["UDVButton 7-2_8-2"]={template="UDOrange"},
                        ["UDVButton 7-3_8-3"]={template="UDOrange", inverted=true},
			["Button 8-4"]={template="BGreenOnOff"},
                        ["UDVButton 7-5_8-5"]={template="UDGreen"},
                        ["UDVButton 7-6_8-6"]={template="UDAmber"},
                        ["UDVButton 7-7_8-7"]={template="UDGreen", inverted=true},
                        ["UDVButton 7-8_8-8"]={template="UDYellow"},
			-- Sequence Knobs
			["Note"]={
				["UDVButton 3-1_4-1"]={template="UDGreen"},
				["UDVButton 3-2_4-2"]={template="UDGreen"},
				["UDVButton 3-3_4-3"]={template="UDGreen"},
				["UDVButton 3-4_4-4"]={template="UDGreen"},
				["UDVButton 3-5_4-5"]={template="UDGreen"},
				["UDVButton 3-6_4-6"]={template="UDGreen"},
				["UDVButton 3-7_4-7"]={template="UDGreen"},
				["UDVButton 3-8_4-8"]={template="UDGreen"},
				["UDVButton 5-1_6-1"]={template="UDGreen"},
				["UDVButton 5-2_6-2"]={template="UDGreen"},
				["UDVButton 5-3_6-3"]={template="UDGreen"},
				["UDVButton 5-4_6-4"]={template="UDGreen"},
				["UDVButton 5-5_6-5"]={template="UDGreen"},
				["UDVButton 5-6_6-6"]={template="UDGreen"},
				["UDVButton 5-7_6-7"]={template="UDGreen"},
				["UDVButton 5-8_6-8"]={template="UDGreen"},
			},
			["Velocity"]={
				["UDVButton 3-1_4-1"]={template="UDAmber"},
				["UDVButton 3-2_4-2"]={template="UDAmber"},
				["UDVButton 3-3_4-3"]={template="UDAmber"},
				["UDVButton 3-4_4-4"]={template="UDAmber"},
				["UDVButton 3-5_4-5"]={template="UDAmber"},
				["UDVButton 3-6_4-6"]={template="UDAmber"},
				["UDVButton 3-7_4-7"]={template="UDAmber"},
				["UDVButton 3-8_4-8"]={template="UDAmber"},
				["UDVButton 5-1_6-1"]={template="UDAmber"},
				["UDVButton 5-2_6-2"]={template="UDAmber"},
				["UDVButton 5-3_6-3"]={template="UDAmber"},
				["UDVButton 5-4_6-4"]={template="UDAmber"},
				["UDVButton 5-5_6-5"]={template="UDAmber"},
				["UDVButton 5-6_6-6"]={template="UDAmber"},
				["UDVButton 5-7_6-7"]={template="UDAmber"},
				["UDVButton 5-8_6-8"]={template="UDAmber"},
			},
			["GateLen"]={
				["UDVButton 3-1_4-1"]={template="UDOrange"},
				["UDVButton 3-2_4-2"]={template="UDOrange"},
				["UDVButton 3-3_4-3"]={template="UDOrange"},
				["UDVButton 3-4_4-4"]={template="UDOrange"},
				["UDVButton 3-5_4-5"]={template="UDOrange"},
				["UDVButton 3-6_4-6"]={template="UDOrange"},
				["UDVButton 3-7_4-7"]={template="UDOrange"},
				["UDVButton 3-8_4-8"]={template="UDOrange"},
				["UDVButton 5-1_6-1"]={template="UDOrange"},
				["UDVButton 5-2_6-2"]={template="UDOrange"},
				["UDVButton 5-3_6-3"]={template="UDOrange"},
				["UDVButton 5-4_6-4"]={template="UDOrange"},
				["UDVButton 5-5_6-5"]={template="UDOrange"},
				["UDVButton 5-6_6-6"]={template="UDOrange"},
				["UDVButton 5-7_6-7"]={template="UDOrange"},
				["UDVButton 5-8_6-8"]={template="UDOrange"},
			},
			["StepDur"]={
				["UDVButton 3-1_4-1"]={template="UDGreen"},
				["UDVButton 3-2_4-2"]={template="UDGreen"},
				["UDVButton 3-3_4-3"]={template="UDGreen"},
				["UDVButton 3-4_4-4"]={template="UDGreen"},
				["UDVButton 3-5_4-5"]={template="UDGreen"},
				["UDVButton 3-6_4-6"]={template="UDGreen"},
				["UDVButton 3-7_4-7"]={template="UDGreen"},
				["UDVButton 3-8_4-8"]={template="UDGreen"},
				["UDVButton 5-1_6-1"]={template="UDGreen"},
				["UDVButton 5-2_6-2"]={template="UDGreen"},
				["UDVButton 5-3_6-3"]={template="UDGreen"},
				["UDVButton 5-4_6-4"]={template="UDGreen"},
				["UDVButton 5-5_6-5"]={template="UDGreen"},
				["UDVButton 5-6_6-6"]={template="UDGreen"},
				["UDVButton 5-7_6-7"]={template="UDGreen"},
				["UDVButton 5-8_6-8"]={template="UDGreen"},
			},
			["Curve1"]={
				["UDVButton 3-1_4-1"]={template="UDYellow"},
				["UDVButton 3-2_4-2"]={template="UDYellow"},
				["UDVButton 3-3_4-3"]={template="UDYellow"},
				["UDVButton 3-4_4-4"]={template="UDYellow"},
				["UDVButton 3-5_4-5"]={template="UDYellow"},
				["UDVButton 3-6_4-6"]={template="UDYellow"},
				["UDVButton 3-7_4-7"]={template="UDYellow"},
				["UDVButton 3-8_4-8"]={template="UDYellow"},
				["UDVButton 5-1_6-1"]={template="UDYellow"},
				["UDVButton 5-2_6-2"]={template="UDYellow"},
				["UDVButton 5-3_6-3"]={template="UDYellow"},
				["UDVButton 5-4_6-4"]={template="UDYellow"},
				["UDVButton 5-5_6-5"]={template="UDYellow"},
				["UDVButton 5-6_6-6"]={template="UDYellow"},
				["UDVButton 5-7_6-7"]={template="UDYellow"},
				["UDVButton 5-8_6-8"]={template="UDYellow"},
			},
			["Curve2"]={
				["UDVButton 3-1_4-1"]={template="UDYellow"},
				["UDVButton 3-2_4-2"]={template="UDYellow"},
				["UDVButton 3-3_4-3"]={template="UDYellow"},
				["UDVButton 3-4_4-4"]={template="UDYellow"},
				["UDVButton 3-5_4-5"]={template="UDYellow"},
				["UDVButton 3-6_4-6"]={template="UDYellow"},
				["UDVButton 3-7_4-7"]={template="UDYellow"},
				["UDVButton 3-8_4-8"]={template="UDYellow"},
				["UDVButton 5-1_6-1"]={template="UDYellow"},
				["UDVButton 5-2_6-2"]={template="UDYellow"},
				["UDVButton 5-3_6-3"]={template="UDYellow"},
				["UDVButton 5-4_6-4"]={template="UDYellow"},
				["UDVButton 5-5_6-5"]={template="UDYellow"},
				["UDVButton 5-6_6-6"]={template="UDYellow"},
				["UDVButton 5-7_6-7"]={template="UDYellow"},
				["UDVButton 5-8_6-8"]={template="UDYellow"},
			},
		},
		["Shaper"]={
			["Button 2-2"]={template="BGreenOnOff"},
                        ["UDVButton 5-2_6-2"]={template="UDOrange", inverted=true},
                        ["Fader 3"]={template="FOrange"},
		},
		["Delay"]={
			["Button 2-2"]={template="BGreenOnOff"},
			["Button 4-2"]={template="BGreenOnOff"},
                        ["Fader 3"]={template="FGreen"},
                        ["Fader 4"]={template="FOrange"},
                        ["Fader 5"]={template="FGreen"},
                        ["Fader 6"]={template="FAmber"},
                        ["Fader 7"]={template="FOrange"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
		},
		["Chorus"]={
			["Button 2-2"]={template="BGreenOnOff"},
                        ["Fader 3"]={template="FGreen"},
                        ["Fader 4"]={template="FOrange"},
                        ["Fader 5"]={template="FGreen"},
                        ["Fader 6"]={template="FAmber"},
                        ["Fader 7"]={template="FOrange"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
		},
	},
	["Combinator"]={
		["Default"]={
			-- On/Off/Bypass
			["UDVButton 1-1_2-1"]={template="UDRed"},
			-- Run
			["Button 5-1"]={template="BRedOnOff"},
			-- Bypass All Effects
			["Button 6-1"]={template="BRedOnOff"},
			-- Buttons
			["Button 8-1"]={template="BRedOnOff"},
			["Button 8-2"]={template="BRedOnOff"},
			["Button 8-3"]={template="BRedOnOff"},
			["Button 8-4"]={template="BRedOnOff"},
			-- Rotaries
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FYellow"},
			["Fader 7"]={template="FYellow"},
			["Fader 8"]={template="FYellow"},
		},
	},
	["DrOctoRex"]={
		["Default"]={
		},
		["Main"]={
			["UDVButton 1-2_2-2"]={template="UDGreen"},
			["UDVButton 1-3_2-3"]={template="UDYellow"},
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
			["UDVButton 7-8_8-8"]={template="FGreen"},
			["Fader 8"]={template="FRed"},
		},
		["AmpEnv"]={
			["Fader 4"]={template="FRed"},
			["Fader 5"]={template="FRed"},
			["Fader 6"]={template="FRed"},
			["Fader 7"]={template="FRed"},
		},
		["Osc"]={
			["Knob V2"]={template="FAmber"},
			["UDVButton 1-3_2-3"]={template="UDGreen"},
			["UDVButton 1-4_2-4"]={template="UDGreen"},
		},
		["Loop"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="UDAmber"},
			["UDVButton 1-4_2-4"]={template="UDGreen"},
			["Fader 8"]={template="FRed"},
		},
		["Performance"]={
			["UDVButton 3-1_4-1"]={template="UDYellow"},
			["UDVButton 7-1_8-1"]={template="UDYellow"},
			["Knob V2"]={template="FGreen"},
			["Knob V3"]={template="FGreen"},
			["Knob V4"]={template="FOrange"},
			["Knob V6"]={template="FYellow"},
			["Knob V7"]={template="FOrange"},
			["Knob V8"]={template="FRed"},
		},
		["Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="FGreen", inverted=true},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
		},
		["FilterEnv"]={
			["Fader 2"]={template="FAmber"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FGreen"},
			["Fader 7"]={template="FGreen"},
		},
		["LFO"]={
			["UDVButton 1-2_2-2"]={template="FYellow", inverted=true},
			["UDVButton 5-2_6-2"]={template="FYellow", inverted=true},
			["Button 1-4"]={template="BRedOnOff"},
			["Fader 5"]={template="FGreen"},
			["UDVButton 7-5_8-5"]={template="FGreen"},
			["Fader 8"]={template="FAmber"},
		},
	},
	["RPG-8"]={
		["Default"]={
			["Button 5-1"]={template="BPerformancePage"},
			["Button 6-1"]={template="BPerformancePage"},
		},
		["Main"]={
			-- MIDI-CV Coverter
			["Fader 2"]={template="FYellow"},
			["Button 1-3"]={template="BRedOnOff"},
			["UDVButton 3-3_4-3"]={template="UDGreen"},
			-- Arpeggiator
			["Button 1-4"]={template="BRedOnOff"},
			["UDVButton 3-4_4-4"]={template="UDOrange"},
			["UDVButton 5-4_6-4"]={template="UDGreen"},
			["UDVButton 7-4_8-4"]={template="UDOrange"},
			-- Sync and Time
			["Button 1-6"]={template="BRedOnOff"},
			["Button 8-6"]={template="BRedOnOff"},
			["UDVButton 7-7_8-7"]={template="UDGreen"},
			["Fader 7"]={template="FGreen"},
			["Fader 8"]={template="FOrange"},
		},
		["Pattern"]={
			-- Pattern Step
			["Button 1-1"]={template="BRedOnOff"},
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 1-6"]={template="BRedOnOff"},
			["Button 1-7"]={template="BRedOnOff"},
			["Button 1-8"]={template="BRedOnOff"},
			["Button 2-1"]={template="BRedOnOff"},
			["Button 2-2"]={template="BRedOnOff"},
			["Button 2-3"]={template="BRedOnOff"},
			["Button 2-4"]={template="BRedOnOff"},
			["Button 2-5"]={template="BRedOnOff"},
			["Button 2-6"]={template="BRedOnOff"},
			["Button 2-7"]={template="BRedOnOff"},
			["Button 2-8"]={template="BRedOnOff"},
			-- Pattern Enable
			["Button 3-1"]={template="BRedOnOff"},
			-- Pattern Length Up
			["UDVButton 3-8_4-8"]={template="UDYellow"},
			-- Shuffle
			["Button 8-1"]={template="BRedOnOff"},
		},
	},
	["ID8"]={
		["Default"]={
		},
		["Main"]={
			["Button 7-1"]={template="BSelCat"},
			["Button 7-2"]={template="BSelCat"},
			["Button 8-1"]={template="BSelSound"},
			["Button 8-2"]={template="BSelSound"},
			["Button 8-3"]={template="BSelSound"},
			["Button 8-4"]={template="BSelSound"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FOrange"},
			["Fader 8"]={template="FRed"},
		},
	},
	["Malstrom"]={
		["Default"]={
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
		},
		["Main"]={
			["Fader 3"]={template="FYellow"},
			["Button 8-2"]={template="BYellowOnOff"},
			["Fader 7"]={template="FYellow"},
			["Fader 8"]={template="FAmber"},
		},
		["Osc *"]={
			["Button 8-1"]={template="BYellowOnOff"},
			["Fader 2"]={template="FAmber"},
			["Fader 3"]={template="FAmber"},
			["Knob V4"]={template="FAmber"},
			["UDVButton 7-5_8-5"]={template="UDGreen"},
			["UDVButton 7-6_8-6"]={template="UDGreen"},
			["UDVButton 7-7_8-7"]={template="UDGreen"},
			["Button 8-8"]={template="BYellowOnOff"},
		},
		["Osc A"]={
			["Button 7-8"]={template="BYellowOnOff"},
		},
		["Osc * Env"]={
			["Fader 3"]={template="FAmber"},
			["Fader 4"]={template="FAmber"},
			["Fader 5"]={template="FAmber"},
			["Fader 6"]={template="FAmber"},
			["Fader 8"]={template="FRed"},
		},
		["Filter *"]={
			["Button 5-1"]={template="BFilterPage"},
			["Button 6-1"]={template="BFilterPage"},
			["Button 1-2"]={template="BYellowOnOff"},
			["UDVButton 7-4_8-4"]={template="UDGreen", inverted=true},
			["Button 8-5"]={template="BYellowOnOff"},
			["Button 8-6"]={template="BYellowOnOff"},
			["Fader 7"]={template="FGreen"},
			["Fader 8"]={template="FOrange"},
		},
		["Filter Env"]={
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FGreen"},
			["Button 8-7"]={template="BYellowOnOff"},
			["Fader 8"]={template="FAmber"},
		},
		["Mod *"]={
			["Button 5-1"]={template="BLFOPage"},
			["Button 6-1"]={template="BLFOPage"},
			["Button 1-2"]={template="BYellowOnOff"},
			["UDVButton 3-2_4-2"]={template="UDYellow"},
			["Fader 3"]={template="FGreen"},
			["Knob V4"]={template="FYellow"},
			["Knob V5"]={template="FYellow"},
			["Knob V6"]={template="FYellow"},
			["Knob V7"]={template="FYellow"},
			["Button 1-8"]={template="BYellowOnOff"},
			["Button 2-8"]={template="BYellowOnOff"},
			["UDVButton 7-8_8-8"]={template="UDYellow"},
		},
		["Shaper"]={
			["Button 1-2"]={template="BYellowOnOff"},
			["UDVButton 5-2_6-2"]={template="FOrange", inverted=true},
			["Fader 8"]={template="FOrange"},
		},
		["Velocity"]={
			["UDVButton 7-8_8-8"]={template="UDYellow"},
		},
		["ModWheel"]={
			["UDVButton 7-8_8-8"]={template="UDYellow"},
		},
	},
	["NN19"]={
		["Default"]={
			["Button 1-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
	},
	["NN-XT"]={
		["Default"]={
			["Fader 1"]={template="FYellow"},
			["Knob V2"]={template="FGreen"},
			["Knob V3"]={template="FOrange"},
			["Knob V4"]={template="FRed"},
			["Knob V5"]={template="FRed"},
			["Knob V6"]={template="FRed"},
			["Knob V7"]={template="FYellow"},
			["Fader 8"]={template="FRed"},
		},
	},
	["Subtractor"]={
		["Default"]={
			["Button 1-1"]={template="BMainPage"},
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscModPage"},
			["Button 5-1"]={template="BFilterPage"},
		},
		["Main"]={
			["Button 8-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FYellow"},
			["Fader 8"]={template="FRed"},
		},
		["Osc *"]={
			["Knob V2"]={template="FAmber"},
			["UDVButton 1-3_2-3"]={template="UDAmber", inverted=true},
			["UDVButton 3-3_4-3"]={template="UDAmber"},
			["UDVButton 3-4_4-4"]={template="UDGreen"},
			["UDVButton 3-5_4-5"]={template="UDGreen"},
			["UDVButton 3-6_4-6"]={template="UDGreen"},
			["Button 8-3"]={template="BRedOnOff"},
			["Button 8-6"]={template="BRedOnOff"},
			["Fader 7"]={template="FAmber"},
			["Knob V8"]={template="FRed"},
		},
		["Osc 2"]={
			["Button 8-1"]={template="BRedOnOff"},
		},
		["Noise"]={
			["Fader 2"]={template="FGreen"},
			["Fader 3"]={template="FAmber"},
			["Fader 4"]={template="FRed"},
		},
		["Filter"]={
			["Fader 2"]={template="FGreen"},
			["Fader 3"]={template="FOrange"},
			["UDVButton 5-4_6-4"]={template="UDGreen",inverted=true},
			["Fader 5"]={template="FYellow"},
			["Button 8-6"]={template="BRedOnOff"},
		},
		["Filter 2"]={
			["Button 8-1"]={template="BRedOnOff"},
			["Fader 2"]={template="FGreen"},
			["Fader 3"]={template="FOrange"},
		},
		["Filter Env"]={
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FGreen"},
			["Button 8-7"]={template="BRedOnOff"},
			["Fader 8"]={template="FAmber"},
		},
		["Amp Env"]={
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FRed"},
			["Fader 5"]={template="FRed"},
			["Fader 6"]={template="FRed"},
		},
		["Mod Env"]={
			["Fader 2"]={template="FYellow"},
			["Fader 3"]={template="FYellow"},
			["Fader 4"]={template="FYellow"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FAmber"},
			["UDVButton 5-7_6-7"]={template="UDYellow", inverted=true},
			["Button 8-7"]={template="BRedOnOff"},
		},
		["LFO 1"]={
			["UDVButton 3-2_4-2"]={template="UDYellow", inverted=true},
			["UDVButton 7-2_8-2"]={template="UDYellow", inverted=true},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FAmber"},
			["Button 8-5"]={template="BRedOnOff"},
		},
		["LFO 2"]={
			["UDVButton 7-2_8-2"]={template="UDYellow", inverted=true},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FAmber"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FYellow"},
		},
		["ExtMod"]={
			["UDVButton 7-2_8-2"]={template="UDYellow", inverted=true},
		},
	},
	["Matrix"]={
		["Default"]={
			-- Pattern Enable
			["Button 3-1"]={template="BRedOnOff"},
			-- Bank
			["Button 3-5"]={template="BBank"},
			["Button 3-6"]={template="BBank"},
			["Button 3-7"]={template="BBank"},
			["Button 3-8"]={template="BBank"},
			-- Pattern
			["Button 4-1"]={template="BBank"},
			["Button 4-2"]={template="BBank"},
			["Button 4-3"]={template="BBank"},
			["Button 4-4"]={template="BBank"},
			["Button 4-5"]={template="BBank"},
			["Button 4-6"]={template="BBank"},
			["Button 4-7"]={template="BBank"},
			["Button 4-8"]={template="BBank"},
			-- Resolution
			["UDVButton 7-8_8-8"]={template="UDGreen"},
			-- Run
			["Button 8-1"]={template="BRedOnOff"},
		},
	},
	["Revival"]={
		["Default"]={
			["Button 1-1"]={template="BMainPage"},
			["Button 2-1"]={template="BOscPage"},
			["Button 3-1"]={template="BOscPage"},
			["Button 4-1"]={template="BOscPage"},
			["Button 5-1"]={template="BOscPage"},
			["Button 6-1"]={template="BFilterPage"},
			["Button 7-1"]={template="BFilterPage"},
			["Button 8-1"]={template="BFilterPage"},
			["Button 1-8"]={template="BMainEffectPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 5-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Button 8-8"]={template="BEffectPage"},
		},
		["Index"]={
			["Button 2-4"]={template="BFilterPage"},
			["Button 3-4"]={template="BFilterPage"},
			["Button 4-4"]={template="BFilterPage"},
			["Button 5-4"]={template="BFilterPage"},
			["Button 2-5"]={template="BFilterModPage"},
			["Button 3-5"]={template="BFilterModPage"},
			["Button 4-5"]={template="BFilterModPage"},
			["Button 5-5"]={template="BFilterModPage"},
			["Button 2-6"]={template="BFilterModPage"},
			["Button 3-6"]={template="BFilterModPage"},
			["Button 4-6"]={template="BFilterModPage"},
			["Button 5-6"]={template="BFilterModPage"},
			["Button 2-7"]={template="BFilterModPage"},
			["Button 3-7"]={template="BFilterModPage"},
			["Button 4-7"]={template="BFilterModPage"},
			["Button 5-7"]={template="BFilterModPage"},
		},
		["Main"]={
			-- S1/S2 switches
			["Button 6-2"]={template="BYellowOnOff"},
			["Button 6-3"]={template="BYellowOnOff"},
			-- Attack Vib/Trem switches
			["Button 7-2"]={template="BYellowOnOff"},
			["Button 7-3"]={template="BYellowOnOff"},
			-- Rotator switches
			["Button 8-2"]={template="BRedOnOff"},
			["Button 8-3"]={template="BRedOnOff"},
			-- R1/R2 knobs
			["Fader 4"]={template="FYellow"},
			["Fader 5"]={template="FYellow"},
			["BigFader 8"]={template="FRed"},
		},
		["Voicing 1"]={
			["Button 2-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="FAmber",inverted=true},
			["UDVButton 3-2_4-2"]={template="FAmber",inverted=true},
			["UDVButton 5-2_6-2"]={template="FYellow",inverted=true},
			["UDVButton 7-2_8-2"]={template="FAmber",inverted=true},
			["Fader 4"]={template="FYellow"},
			["Fader 7"]={template="FYellow"},
		},
		["Voicing 2"]={
			["Fader 1"]={template="FYellow"},
			["Fader 2"]={template="FOrange"},
			["Fader 3"]={template="FYellow"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FOrange"},
			["Fader 8"]={template="FGreen"},
		},
		["Pri/Sec"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 1-3_2-3"]={template="UDAmber",inverted=true},
			["Knob V4"]={template="FAmber"},
			["Fader 6"]={template="FGreen"},
			["Button 1-7"]={template="BRedOnOff"},
		},
		["Solos"]={
			["Button 8-2"]={template="BSoloRevival"},
			["Button 8-4"]={template="BSoloRevival"},
			["Button 8-6"]={template="BSoloRevival"},
			["Button 8-8"]={template="BSoloRevival"},
		},
		["Attack"]={
			["UDVButton 1-2_2-2"]={template="UDAmber",inverted=true},
			["Fader 3"]={template="FRed"},
			["Fader 5"]={template="FAmber"},
			["Fader 6"]={template="FAmber"},
			["Fader 7"]={template="FAmber"},
			["Button 1-8"]={template="BRedOnOff"},
		},
		["Primary"]={
			["UDVButton 1-2_2-2"]={template="UDAmber",inverted=true},
			["Fader 3"]={template="FRed"},
			["Fader 7"]={template="FAmber"},
		},
		["Secondary"]={
			["UDVButton 1-2_2-2"]={template="UDAmber",inverted=true},
			["Fader 3"]={template="FRed"},
			["Fader 7"]={template="FAmber"},
		},
		["Release"]={
			["UDVButton 1-2_2-2"]={template="UDAmber",inverted=true},
			["Fader 3"]={template="FRed"},
			["Fader 5"]={template="FAmber"},
			["Fader 6"]={template="FAmber"},
			["Fader 7"]={template="FAmber"},
			["Button 1-8"]={template="BRedOnOff"},
		},
		["* Drawbars Lower"]={
			["Button 7-1"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},
			["Drawbar 2"]={template="FAmber"},
			["Drawbar 3"]={template="FAmber"},
			["Drawbar 4"]={template="FGreen"},
			["Drawbar 5"]={template="FGreen"},
			["Drawbar 6"]={template="FYellow"},
			["Drawbar 7"]={template="FGreen"},
			["Drawbar 8"]={template="FYellow"},
		},
		["* Drawbars Upper"]={
			["Button 7-1"]={template="BOscPage"},
			["Button 8-1"]={template="BOscPage"},
			["Drawbar 2"]={template="FYellow"},
			["Drawbar 3"]={template="FOrange"},
			["Drawbar 4"]={template="FGreen"},
		},
		["* Mod Enable"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 1-6"]={template="BRedOnOff"},
			["Button 1-7"]={template="BRedOnOff"},
			["Button 1-8"]={template="BRedOnOff"},
			["Button 2-2"]={template="BRedOnOff"},
			["Button 2-3"]={template="BRedOnOff"},
			["Button 2-4"]={template="BRedOnOff"},
			["Button 3-2"]={template="BRedOnOff"},
			["Button 3-3"]={template="BRedOnOff"},
			["Button 3-4"]={template="BRedOnOff"},
			["Button 3-5"]={template="BRedOnOff"},
			["Button 3-6"]={template="BRedOnOff"},
			["Button 3-7"]={template="BRedOnOff"},
			["Button 3-8"]={template="BRedOnOff"},
			["Button 4-2"]={template="BRedOnOff"},
			["Button 4-3"]={template="BRedOnOff"},
			["Button 4-4"]={template="BRedOnOff"},
			["Button 5-2"]={template="BRedOnOff"},
			["Button 5-3"]={template="BRedOnOff"},
			["Button 5-4"]={template="BRedOnOff"},
			["Button 5-5"]={template="BRedOnOff"},
			["Button 5-6"]={template="BRedOnOff"},
			["Button 5-7"]={template="BRedOnOff"},
			["Button 5-8"]={template="BRedOnOff"},
			["Button 6-2"]={template="BRedOnOff"},
			["Button 6-3"]={template="BRedOnOff"},
			["Button 6-4"]={template="BRedOnOff"},
		},
		["* Mod *"]={
			["UDVButton 5-2_6-2"]={template="UDGreen", inverted=true},
			["UDVButton 7-2_8-2"]={template="UDOrange", inverted=true},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FYellow"},
			["Fader 7"]={template="FOrange"},
			["Fader 8"]={template="FGreen"},
		},
		["Effects"]={
			["Button 8-4"]={template="BRedOnOff"},
			["Fader 5"]={template="FOrange"},
			["Button 2-7"]={template="BRedOnOff"},
			["Button 3-7"]={template="BRedOnOff"},
			["Button 4-7"]={template="BRedOnOff"},
			["Button 5-7"]={template="BRedOnOff"},
			["Button 6-7"]={template="BRedOnOff"},
			["Button 7-7"]={template="BRedOnOff"},
		},
		["PreAmp"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDOrange", inverted=true},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FAmber"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
		},
		["Phaser"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDOrange", inverted=true},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
		},
		["ModFilter"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDOrange", inverted=true},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["UDVButton 1-5_2-5"]={template="UDGreen"},
			["UDVButton 7-5_8-5"]={template="UDYellow"},
			["Fader 6"]={template="FYellow"},
			["Fader 7"]={template="FGreen"},
			["UDVButton 7-7_8-7"]={template="UDGreen"},
		},
		["Speaker"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDOrange", inverted=true},
			["Fader 3"]={template="FOrange"},
			["Knob V4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
			["Knob V7"]={template="FOrange"},
		},
		["Reverb"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDOrange", inverted=true},
			["Fader 3"]={template="FOrange"},
			["Knob V4"]={template="FOrange"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FOrange"},
		},
		["Delay"]={
			["Button 1-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDOrange", inverted=true},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FOrange"},
		},
	},
	["Antidote"]={
		["Default"]={
			["Button 1-1"]={template="BMainPage", helptext="Goto Main"},
			["Button 2-1"]={template="BOscPage", helptext="Goto Osc 1"},
			["Button 3-1"]={template="BOscPage", helptext="Goto Osc 2"},
			["Button 4-1"]={template="BAmpPage", helptext="Goto Mixer"},
			["Button 5-1"]={template="BFilterPage", helptext="Goto Filter"},
			["Button 1-8"]={template="BMainEffectPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 5-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Button 8-8"]={template="BEffectPage"},
		},
		["Main"]={
			["Fader 3"]={template="FYellow"},
			["Fader 8"]={template="FRed"},
		},
		["Osc *"]={
			["UDVButton 1-2_2-2"]={template="UDAmber", inverted=true},
			["UDVButton 3-2_4-2"]={template="UDAmber", inverted=true},
			["UDVButton 5-2_6-2"]={template="UDAmber", inverted=true},
			["UDVButton 1-3_2-3"]={template="UDGreen"},
			["UDVButton 3-3_4-3"]={template="UDGreen"},
			["UDVButton 5-3_6-3"]={template="UDGreen"},
			["Fader 4"]={template="FAmber"},
			["Fader 5"]={template="FAmber"},
			["Fader 6"]={template="FAmber"},
			["Fader 7"]={template="FYellow"},
			["Knob V8"]={template="FRed"},
		},
		["Mixer"]={
			["Fader 2"]={template="FRed"},
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FAmber"},
			["Fader 5"]={template="FAmber"},
			["Fader 6"]={template="FYellow"},
		},
		["Filter"]={
			["UDVButton 1-2_2-2"]={template="UDGreen", inverted=true},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 4"]={template="FYellow"},
		},
		["Filter Env"]={
			["Fader 2"]={template="FAmber"},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FGreen"},
		},
		["Effects"]={
			["Fader 2"]={template="FAmber"},
			["Button 2-7"]={template="BGreenOnOff"},
			["Button 3-7"]={template="BGreenOnOff"},
			["Button 4-7"]={template="BGreenOnOff"},
			["Button 5-7"]={template="BGreenOnOff"},
			["Button 6-7"]={template="BGreenOnOff"},
			["Button 7-7"]={template="BGreenOnOff"},
			["Button 8-7"]={template="BGreenOnOff"},
		},
		["EQ/Bass"]={ --EQBass
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDGreen"},
			["UDVButton 5-1_6-1"]={template="UDOrange"},
			["Fader 2"]={template="UDRed"},
			["Fader 3"]={template="UDGreen"},
			["Fader 4"]={template="UDOrange"},
			["Fader 5"]={template="UDRed"},
			["Fader 6"]={template="UDRed"},
			["Fader 7"]={template="UDOrange"},
		},
		["Dist"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDOrange"},
			["UDVButton 5-1_6-1"]={template="UDOrange"},
			["Fader 2"]={template="FAmber"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FAmber"},
			["Fader 7"]={template="FOrange"},
		},
		["Phaser"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDOrange"},
			["UDVButton 5-1_6-1"]={template="UDGreen"},
			["Fader 2"]={template="FGreen"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FOrange"},
		},
		["Chorus"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["Fader 2"]={template="FGreen"},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FOrange"},
		},
		["Delay"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDOrange"},
			["UDVButton 5-1_6-1"]={template="UDGreen"},
			["UDVButton 7-1_8-1"]={template="UDGreen"},
			["Fader 2"]={template="FOrange"},
			["Fader 3"]={template="FOrange"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FAmber"},
			["Fader 7"]={template="FOrange"},
		},
		["Reverb"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDOrange"},
			["Fader 2"]={template="FOrange"},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FYellow"},
			["Fader 7"]={template="FOrange"},
		},
		["Comp"]={
			["Button 1-1"]={template="BGreenOnOff"},
			["UDVButton 3-1_4-1"]={template="UDOrange"},
			["Fader 2"]={template="FOrange"},
			["Fader 4"]={template="FAmber"},
			["Fader 5"]={template="FAmber"},
			["Fader 7"]={template="FOrange"},
		},
		["LFO *"]={
                        ["Fader 3"]={template="FGreen"},
                        ["UDVButton 7-3_8-3"]={template="UDGreen"},
                        ["Knob V4"]={template="FAmber"},
			["Button 1-5"]={template="BGreenOnOff"},
			["Button 1-6"]={template="BGreenOnOff"},
                        ["UDHButton 3-5_3-6"]={template="UDYellow"},
                        ["UDHButton 5-5_5-6"]={template="UDYellow"},
		},
		["Amp Env"]={
                        ["Fader 3"]={template="FRed"},
                        ["Fader 4"]={template="FRed"},
                        ["Fader 5"]={template="FRed"},
                        ["Fader 6"]={template="FRed"},
		},
		["Mod Env"]={
                        ["UDVButton 3-1_4-1"]={template="UDYellow"},
                        ["Fader 3"]={template="FYellow"},
                        ["Fader 4"]={template="FYellow"},
                        ["Fader 5"]={template="FYellow"},
                        ["Fader 5"]={template="FYellow"},
                        ["Knob V8"]={template="FAmber"},
		},
		["Arpeggiator"]={
                        ["UDHButton 3-1_3-2"]={template="UDYellow"},
                        ["UDHButton 5-1_5-2"]={template="UDYellow"},
                        ["UDHButton 6-1_6-2"]={template="UDGreen"},
                        ["UDHButton 7-1_7-2"]={template="UDYellow"},
                        ["Button 8-1"]={template="BGreenOnOff"},
		},
	},
	["PX7"]={
		["Default"]={
			["Button 1-1"]={template="BMainPage", helptext="Goto Main"},
			["Button 2-1"]={template="BOscPage", helptext="Goto OP 6"},
			["Button 3-1"]={template="BOscPage", helptext="Goto OP 5"},
			["Button 4-1"]={template="BOscPage", helptext="Goto OP 4"},
			["Button 5-1"]={template="BOscPage", helptext="Goto OP 3"},
			["Button 6-1"]={template="BOscPage", helptext="Goto OP 2"},
			["Button 7-1"]={template="BOscPage", helptext="Goto OP 1"},
		},
		["Main"]={
			["UDVButton 1-2_2-2"]={template="FAmber"},
			["Fader 3"]={template="FYellow"},
			["Fader 8"]={template="FRed"},
		},
		["Op*"]={
			["Button 8-2"]={template="BGreenOnOff"},
			["UDVButton 7-3_8-3"]={template="UDGreen"},
			["UDVButton 7-4_8-4"]={template="UDGreen"},
			["UDVButton 7-5_8-5"]={template="UDGreen"},
			["Knob V7"]={template="FRed"},
			["Fader 8"]={template="FRed"},
		},
		["LFO"]={
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FGreen"},
			["UDVButton 7-3_8-3"]={template="UDGreen"},
			["Fader 4"]={template="FYellow"},
			["UDVButton 1-5_2-5"]={template="UDYellow", inverted=true},
		},
	},
	["Parsec"]={
		["Default"]={
			["Fader 7"]={template="FYellow"},
			["Fader 8"]={template="FRed"},
		},
	},
	["Europa"]={
		["Default"]={
			["Button 1-1"]={template="BMainPage", helptext="Goto Main"},
			["Button 2-1"]={template="BOscPage", helptext="Goto Engine 1"},
			["Button 3-1"]={template="BOscPage", helptext="Goto Engine 2"},
			["Button 4-1"]={template="BOscPage", helptext="Goto Engine 3"},
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-8"]={template="BMainEffectPage"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 5-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
		},
		["Main"]={
			["Fader 5"]={template="FYellow"},
			["Fader 8"]={template="FRed"},
		},
		["Index"]={
			["Button 5-5"]={template="BFilterPage"},
			["Button 2-7"]={template="BEffectPage"},
			["Button 3-7"]={template="BEffectPage"},
			["Button 4-7"]={template="BEffectPage"},
		},
		["Mixer"]={
			["Fader 2"]={template="FRed"},
			["Knob V3"]={template="FRed"},
			["Fader 4"]={template="FRed"},
			["Knob V5"]={template="FRed"},
			["Fader 6"]={template="FRed"},
			["Knob V7"]={template="FRed"},
		},
		["Filter"]={
			["Button 5-1"]={template="BRedOnOff"},
			["Button 6-1"]={template="BRedOnOff"},
			["Button 7-1"]={template="BRedOnOff"},
			["UDVButton 1-2_2-2"]={template="UDGreen", inverted=true},
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FGreen"},
			["UDVButton 1-6_2-6"]={template="UDYellow"},
			["UDVButton 3-6_4-6"]={template="UDYellow"},
			["UDVButton 5-6_6-6"]={template="UDYellow"},
			["UDVButton 3-7_4-7"]={template="UDYellow", inverted=true},
		},
		["Amp"]={
			["Knob V2"]={template="FRed"},
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FYellow"},
			["Fader 5"]={template="FRed"},
			["Fader 6"]={template="FRed"},
			["Fader 7"]={template="FRed"},
			["Fader 8"]={template="FRed"},
		},
		["Eng *"]={
			["UDVButton 1-3_2-3"]={template="UDGreen"},
			["UDVButton 3-3_4-3"]={template="UDGreen"},
			["UDVButton 5-3_6-3"]={template="UDGreen"},
			["UDVButton 1-4_2-4"]={template="UDAmber", inverted=true},
			["UDVButton 7-6_8-6"]={template="UDYellow", inverted=true},
			["Fader 5"]={template="FAmber"},
			["Fader 7"]={template="FYellow"},
			["Fader 8"]={template="FYellow"},
		},
		["Eng * Mod *"]={
			["UDVButton 1-3_2-3"]={template="UDAmber", inverted=true},
			["Fader 4"]={template="FAmber"},
			["Fader 5"]={template="FYellow"},
			["UDVButton 7-6_8-6"]={template="UDYellow", inverted=true},
		},
		["Eng * Spectral Filter"]={
			["UDVButton 3-2_4-2"]={template="UDGreen", inverted=true},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FYellow"},
			["UDVButton 7-7_8-7"]={template="UDYellow", inverted=true},
			["Fader 8"]={template="FYellow"},
		},
		["Eng * Harmonics"]={
			["UDVButton 1-3_2-3"]={template="UDAmber", inverted=true},
			["Fader 4"]={template="FYellow"},
			["Fader 5"]={template="FAmber"},
		},
		["Eng * Unison"]={
			["UDVButton 1-3_2-3"]={template="UDOrange", inverted=true},
			["UDVButton 1-4_2-4"]={template="UDOrange"},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FGreen"},
			["Fader 7"]={template="FOrange"},
		},
		["LFO *"]={
			["Button 5-1"]={template="BLFOPage", helptext="Goto LFO 1"},
			["Button 6-1"]={template="BLFOPage", helptext="Goto LFO 2"},
			["Button 7-1"]={template="BLFOPage", helptext="Goto LFO 3"},
			["UDVButton 1-2_2-2"]={template="UDYellow"},
			["Button 6-2"]={template="BRedOnOff"},
			["Button 7-2"]={template="BRedOnOff"},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FGreen"},
			["UDVButton 7-3_8-3"]={template="UDGreen"},
			["Fader 4"]={template="FOrange"},
		},
		["Env *"]={
			["Button 5-1"]={template="BEnvPage", helptext="Goto Env 1"},
			["Button 6-1"]={template="BEnvPage", helptext="Goto Env 2"},
			["Button 7-1"]={template="BEnvPage", helptext="Goto Env 3"},
			["Button 8-1"]={template="BEnvPage", helptext="Goto Env 4"},
			["Fader 3"]={template="FGreen"},
			["UDVButton 7-4_8-4"]={template="UDGreen"},
		},
		["Effects"]={
			["Button 2-7"]={template="BRedOnOff"},
			["Button 3-7"]={template="BRedOnOff"},
			["Button 4-7"]={template="BRedOnOff"},
			["Button 5-7"]={template="BRedOnOff"},
			["Button 6-7"]={template="BRedOnOff"},
			["Button 7-7"]={template="BRedOnOff"},
		},
		["Phaser"]={
			["UDVButton 5-1_6-1"]={template="UDOrange"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FAmber"},
		},
		["Dist"]={
			["UDVButton 5-1_6-1"]={template="UDOrange"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FGreen"},
			["Fader 7"]={template="FAmber"},
		},
		["Eq"]={
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FYellow"},
			["Fader 7"]={template="FAmber"},
		},
		["Delay"]={
			["Button 4-1"]={template="BRedOnOff"},
			["Button 6-1"]={template="BRedOnOff"},
			["UDVButton 3-2_4-2"]={template="UDGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
			["Fader 7"]={template="FAmber"},
		},
		["Comp"]={
			["Fader 3"]={template="FYellow"},
			["Fader 4"]={template="FYellow"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FOrange"},
		},
		["Reverb"]={
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FYellow"},
			["Fader 7"]={template="FAmber"},
		},
	},
	["ECF-42 Filter"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-2_2-2"]={template="UDGreen", inverted=true},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FAmber"},
			["Fader 6"]={template="FYellow"},
		},
	},
	["Audiomatic"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 2"]={template="FRed"},
			["UDVButton 1-3_2-3"]={template="UDOrange"},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FRed"},
		},
	},
	["Pulveriser"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 7-1_8-1"]={template="UDYellow"},
			["Fader 2"]={template="FOrange"},
			["Fader 3"]={template="FYellow"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FYellow"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FRed"},
		},
		["Filter"]={
			["UDVButton 1-2_2-2"]={template="UDGreen"},
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
			["Knob V7"]={template="FYellow"},
			["Knob V8"]={template="FYellow"},
		},
		["Follower"]={
			["Button 8-1"]={template="BRedOnOff"},
			["Fader 2"]={template="FOrange"},
			["Fader 4"]={template="FYellow"},
			["Fader 5"]={template="FYellow"},
		},
		["Tremor"]={
			["Fader 2"]={template="FGreen"},
			["UDVButton 7-2_8-2"]={template="UDGreen"},
			["Button 1-3"]={template="BGreenOnOff"},
			["UDVButton 1-4_2-4"]={template="UDOrange"},
			["Button 1-5"]={template="BGreenOnOff"},
			["Fader 6"]={template="FYellow"},
			["Knob V8"]={template="FYellow"},
		},
	},
	["Scream 4 Distortion"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["UDVButton 1-4_2-4"]={template="UDOrange", inverted=true},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FRed"},
		},
		["Cut"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Knob V4"]={template="FGreen"},
			["Knob V5"]={template="FGreen"},
			["Knob V6"]={template="FGreen"},
		},
		["Body"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["UDVButton 1-7_2-7"]={template="UDOrange", inverted=true},
		},
	},
	["The Echo"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-2_2-2"]={template="UDOrange"},
			["Button 1-3"]={template="BYellowOnOff"},
			["Fader 4"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FOrange"},
		},
		["Delay"]={
			["Fader 2"]={template="FGreen"},
			["UDVButton 7-2_8-2"]={template="UDGreen"},
			["Fader 3"]={template="FGreen"},
			["Button 1-4"]={template="BYellowOnOff"},
			["Button 4-4"]={template="BYellowOnOff"},
			["Button 8-5"]={template="BYellowOnOff"},
			["Knob V6"]={template="FOrange"},
		},
		["Feedback"]={
			["Fader 2"]={template="FOrange"},
			["Knob V3"]={template="FOrange"},
			["Button 1-5"]={template="BYellowOnOff"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FAmber"},
		},
		["Color"]={
			["Fader 2"]={template="FAMber"},
			["UDVButton 1-3_2-3"]={template="UDAmber"},
			["Button 1-5"]={template="BYellowOnOff"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FOrange"},
		},
		["Modulation"]={
			["Knob V2"]={template="FYellow"},
			["Fader 3"]={template="FOrange"},
			["Fader 5"]={template="FGreen"},
			["Fader 6"]={template="FYellow"},
		},
	},
	["RV7000 Advanced Reverb"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 1-2"]={template="BRedOnOff"},
			["Button 2-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FGreen"},
			["Knob V5"]={template="FGreen"},
			["Fader 7"]={template="FOrange"},
		},
		["Reverb"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["SmallSpace"]={
				["Fader 2"]={template="FOrange"},
				["Fader 3"]={template="FYellow"},
				["UDVButton 7-4_8-4"]={template="UDOrange"},
				["Fader 5"]={template="FGreen"},
				["Fader 6"]={template="FOrange"},
				["Fader 7"]={template="FGreen"},
				["Fader 8"]={template="FYellow"},
			},
			["Room"]={
				["Fader 2"]={template="FOrange"},
				["Fader 3"]={template="FOrange"},
				["UDVButton 7-4_8-4"]={template="UDOrange"},
				["Fader 5"]={template="FOrange"},
				["Fader 6"]={template="FOrange"},
				["Fader 7"]={template="FGreen"},
				["Fader 8"]={template="FYellow"},
			},
			["Hall"]={
				["Fader 2"]={template="FOrange"},
				["Fader 3"]={template="FOrange"},
				["UDVButton 7-4_8-4"]={template="UDOrange"},
				["Fader 5"]={template="FOrange"},
				["Fader 6"]={template="FOrange"},
				["Fader 7"]={template="FGreen"},
				["Fader 8"]={template="FYellow"},
			},
			["Arena"]={
				["Fader 2"]={template="FOrange"},
				["Fader 3"]={template="FOrange"},
				["Fader 4"]={template="FGreen"},
				["Fader 5"]={template="FGreen"},
				["Fader 6"]={template="FAmber"},
				["Fader 7"]={template="FGreen"},
				["Fader 8"]={template="FAmber"},
			},
			["Plate"]={
				["Fader 5"]={template="FGreen"},
				["Fader 7"]={template="FGreen"},
			},
			["Spring"]={
				["Fader 2"]={template="FOrange"},
				["Fader 3"]={template="FOrange"},
				["Fader 4"]={template="FGreen"},
				["Fader 5"]={template="FGreen"},
				["Button 8-6"]={template="BRedOnOff"},
				["Fader 7"]={template="FGreen"},
				["Fader 8"]={template="FAmber"},
			},
			["Echo"]={
				["Fader 2"]={template="FOrange"},
				["UDVButton 7-2_8-2"]={template="UDOrange"},
				["Fader 3"]={template="FOrange"},
				["Button 8-4"]={template="BRedOnOff"},
				["Fader 5"]={template="FGreen"},
				["Fader 6"]={template="FOrange"},
				["Fader 7"]={template="FGreen"},
			},
			["MultiTap"]={
				["Button 8-2"]={template="BRedOnOff"},
				["Fader 3"]={template="FOrange"},
				["Fader 4"]={template="FGreen"},
				["UDVButton 7-5_8-5"]={template="UDOrange"},
				["Fader 6"]={template="FGreen"},
				["UDVButton 7-6_8-6"]={template="UDGreen"},
				["Fader 7"]={template="FAmber"},
				["Knob V8"]={template="FAmber"},
			},
			["Reverse"]={
				["Fader 2"]={template="FOrange"},
				["UDVButton 7-2_8-2"]={template="UDOrange"},
				["Fader 3"]={template="FOrange"},
				["Button 8-6"]={template="BRedOnOff"},
				["Fader 5"]={template="FOrange"},
			},
			["Convolution"]={
				["UDVButton 7-2_8-2"]={template="UDOrange"},
				["Fader 3"]={template="FOrange"},
				["Knob V4"]={template="FOrange"},
				["Fader 5"]={template="FGreen"},
				["UDVButton 7-6_8-6"]={template="UDAmber"},
				["Knob V7"]={template="FGreen"},
				["Fader 8"]={template="FRed"},
			},
		},
		["Eq"]={
			["Knob V2"]={template="FRed"},
			["Fader 3"]={template="FGreen"},
			["Knob V5"]={template="FRed"},
			["Fader 6"]={template="FGreen"},
			["Fader 7"]={template="FOrange"},
		},
		["Gate"]={
			["Fader 1"]={template="FOrange"},
			["Fader 2"]={template="FOrange"},
			["Button 8-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FOrange"},
		},
	},
	["Alligator"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 1-2"]={template="BRedOnOff"},
			["Button 3-2"]={template="BGreenOnOff"},
			["UDVButton 5-2_6-2"]={template="UDOrange"},
			["UDVButton 7-2_8-2"]={template="UDGreen"},
			["UDVButton 7-3_8-3"]={template="UDOrange"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 3-4"]={template="BRedOnOff"},
			["Button 5-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 3-5"]={template="BRedOnOff"},
			["Button 5-5"]={template="BRedOnOff"},
			["Fader 7"]={template="FRed"},
		},
		["HPFilter"]={
			["Button 2-1"]={template="BFilterPage"},
			["Button 3-1"]={template="BFilterPage"},
			["Button 4-1"]={template="BFilterPage"},
			["Knob V3"]={template="FYellow"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Knob V6"]={template="FYellow"},
		},
		["BPFilter"]={
			["Button 2-1"]={template="BFilterPage"},
			["Button 3-1"]={template="BFilterPage"},
			["Button 4-1"]={template="BFilterPage"},
			["Knob V3"]={template="FYellow"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Knob V6"]={template="FYellow"},
		},
		["LPFilter"]={
			["Button 2-1"]={template="BFilterPage"},
			["Button 3-1"]={template="BFilterPage"},
			["Button 4-1"]={template="BFilterPage"},
			["Knob V3"]={template="FYellow"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Knob V6"]={template="FYellow"},
		},
		["HPEffects"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Fader 2"]={template="FAmber"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FOrange"},
			["Knob V6"]={template="FRed"},
			["Fader 7"]={template="FRed"},
		},
		["BPEffects"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Fader 2"]={template="FAmber"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FOrange"},
			["Knob V6"]={template="FRed"},
			["Fader 7"]={template="FRed"},
		},
		["LPEffects"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Fader 2"]={template="FAmber"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FOrange"},
			["Knob V6"]={template="FRed"},
			["Fader 7"]={template="FRed"},
		},
		["Delay"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Fader 2"]={template="FGreen"},
			["UDVButton 7-2_8-2"]={template="UDGreen"},
			["Button 1-3"]={template="BGreenOnOff"},
			["Fader 4"]={template="FOrange"},
			["Knob V5"]={template="FOrange"},
		},
		["Phaser"]={
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 6-8"]={template="BEffectPage"},
			["Button 7-8"]={template="BEffectPage"},
			["Fader 2"]={template="FGreen"},
			["Fader 4"]={template="FOrange"},
		},
		["AmpEnv"]={
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FRed"},
			["Fader 5"]={template="FRed"},
		},
		["DryLevels"]={
			["Fader 2"]={template="FOrange"},
			["Knob V4"]={template="FRed"},
			["Fader 5"]={template="FRed"},
		},
		["FilterEnv"]={
			["Fader 3"]={template="FGreen"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FGreen"},
		},
		["LFO"]={
			["UDVButton 1-2_2-2"]={template="UDYellow"},
			["Fader 4"]={template="FGreen"},
			["UDVButton 7-4_8-4"]={template="UDGreen"},
			["Button 1-5"]={template="BGreenOnOff"},
		},
	},
	["Softtube Amp"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-2_2-2"]={template="UDOrange"},
			["UDVButton 3-2_4-2"]={template="UDOrange"},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FRed"},
			["Fader 7"]={template="FRed"},
			["Fader 8"]={template="FRed"},
		},
		["Eq"]={
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FRed"},
			["Fader 5"]={template="FRed"},
		},
	},
	["Softtube Bass Amp"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["UDVButton 1-2_2-2"]={template="UDOrange"},
			["UDVButton 3-2_4-2"]={template="UDOrange"},
			["Fader 3"]={template="FOrange"},
			["Fader 8"]={template="FRed"},
		},
		["Eq"]={
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FRed"},
			["Fader 4"]={template="FRed"},
			["UDVButton 7-5_8-5"]={template="UDGreen"},
			["Button 8-6"]={template="BRedOnOff"},
			["Fader 7"]={template="FRed"},
		},
	},
	["Synchronous"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Fader 3"]={template="FRed"},
			["Button 8-4"]={template="BRedOnOff"},
			["Fader 6"]={template="FOrange"},
			["Fader 7"]={template="FRed"},
		},
		["Dist"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 3-2_4-2"]={template="UDOrange"},
			["Button 8-2"]={template="BRedOnOff"},
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
		},
		["Filter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["UDVButton 3-2_4-2"]={template="UDOrange"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Fader 7"]={template="FYellow"},
		},
		["Delay"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 3-2"]={template="BRedOnOff"},
			["Button 4-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FGreen"},
			["UDVButton 7-4_8-4"]={template="UDGreen"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 8-5"]={template="BRedOnOff"},
			["Fader 6"]={template="FOrange"},
			["Button 8-7"]={template="BRedOnOff"},
			["Knob V8"]={template="FOrange"},
		},
		["Reverb"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
			["Fader 4"]={template="FGreen"},
			["Fader 5"]={template="FOrange"},
			["Fader 7"]={template="FYellow"},
			["Button 8-8"]={template="BRedOnOff"},
		},
	},
	["BV512 Digital Vocoder"]={
		["Default"]={
			["Fader 1"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 2"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 3"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 4"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 5"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 6"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 7"]={template="FVCGreen", bvmap="Fader VC"},
			["Fader 8"]={template="FVCGreen", bvmap="Fader VC"},
		},
		["Index"]={
			["UDVButton 7-1_8-1"]={template="UDNocolor"},
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 4-1"]={template="BRedOnOff"},
			["UDVButton 5-1_6-1"]={template="UDOrange"},
			["UDVButton 7-1_8-1"]={template="UDOrange"},
			["Fader 4"]={template="FAmber"},
			["Fader 5"]={template="FAmber"},
			["Knob V6"]={template="FRed"},
			["Fader 7"]={template="FGreen"},
			["Fader 8"]={template="FOrange"},
		},
	},
	["MClass Equalizer"]={
		["Default"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 1-3"]={template="BRedOnOff"},
			["Fader 4"]={template="FGreen"},
			["Knob V5"]={template="FRed"},
			["Fader 6"]={template="FYellow"},
			["Button 2-8"]={template="BEffectPage"},
			["Button 3-8"]={template="BEffectPage"},
			["Button 4-8"]={template="BEffectPage"},
			["Button 5-8"]={template="BEffectPage"},
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Button 1-3"]={template="BRedOnOff"},
			["Button 1-4"]={template="BRedOnOff"},
			["Button 1-5"]={template="BRedOnOff"},
			["Button 1-6"]={template="BRedOnOff"},
			["Button 1-7"]={template="BRedOnOff"},
		},
	},
	["MClass Compressor"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["Button 7-1"]={template="BRedLed"},
			["Button 8-1"]={template="BRedOnOff"},
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Knob V3"]={template="FRed"},
			["Fader 4"]={template="FOrange"},
			["Button 1-5"]={template="BRedOnOff"},
			["Fader 6"]={template="FOrange"},
			["Meter 7"]={template="InvMeter"},
			["Knob V8"]={template="FRed"},
		},
		["Env"]={
			["Fader 4"]={template="FOrange"},
			["Fader 5"]={template="FOrange"},
			["Button 1-6"]={template="BRedOnOff"},
		},
	},
	["MClass Maximizer"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Knob V3"]={template="FRed"},
			["Button 1-6"]={template="BRedOnOff"},
		},
		["Limiter"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Button 4-2"]={template="BRedOnOff"},
			["Meter 3"]={template="InvMeter"},
			["UDVButton 1-4_2-4"]={template="UDOrange", inverted=true},
			["UDVButton 1-5_2-5"]={template="UDOrange", inverted=true},
			["Knob V6"]={template="FRed"},
		},
		["SoftCLip"]={
			["Button 1-2"]={template="BRedOnOff"},
			["Fader 3"]={template="FOrange"},
		},
	},
	["MClass Stereo Imager"]={
		["Default"]={
		},
		["Index"]={
		},
		["Main"]={
			["UDVButton 1-1_2-1"]={template="UDOrange"},
			["Knob V3"]={template="FOrange"},
			["Meter 4"]={template="FRed", bvmap="MeterSI"},
			["Fader 5"]={template="FGreen", bvmap="Fader64"},
			["Knob V6"]={template="FOrange"},
			["Meter 7"]={template="FRed", bvmap="MeterSI"},
			["Button 1-6"]={template="BRedOnOff"},
			["UDVButton 1-8_2-8"]={template="UDYellow"},
			["UDVButton 7-8_8-8"]={template="UDOrange"},
		},
	},
}	

local items = {
	{name = "Keyboard", input = "keyboard"},
	{name = "DeviceScope", output = "text" },
	{name = "DeviceName", output = "text" },
	{name = "PatchName", output = "text" },
	{name = "PageName", output = "text" },
	{name = "SubPageName", output = "text" },
	{name = "PlayingStep", output = "text" },
	{name = "BarPosition", input= "button", output = "value", min = 0, max = 127},
	{name = "BeatPosition", input= "button", output = "value", min = 0, max = 127},
	{name = "EngineSelect", input= "value", output = "value", min = 0, max = 2},
	{name = "EffectSelect", input= "value", output = "value", min = 0, max = 5},
	{name = "EditSelect", input= "value", output = "value", min = 0, max = 2},
	{name = "LFOSelect", input= "value", output = "value", min = 0, max = 2},
	{name = "EnvSelect", input= "value", output = "value", min = 0, max = 3},
	{name = "Hidden", input = "delta", output = "value", min = 0, max = 127, modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}},
	{name = "Fader 1", input = "value", output = "value", min = 0, max = 127},
	{name = "Fader 2", input = "value", output = "value", min = 0, max = 127},
	{name = "Fader 3", input = "value", output = "value", min = 0, max = 127},
	{name = "Fader 4", input = "value", output = "value", min = 0, max = 127},
	{name = "Fader 5", input = "value", output = "value", min = 0, max = 127},
	{name = "Fader 6", input = "value", output = "value", min = 0, max = 127},
	{name = "Fader 7", input = "value", output = "value", min = 0, max = 127},
	{name = "Fader 8", input = "value", output = "value", min = 0, max = 127},
	{name = "BigFader 1", input = "value", output = "value", min = 0, max = 1023},
	{name = "BigFader 2", input = "value", output = "value", min = 0, max = 1023},
	{name = "BigFader 3", input = "value", output = "value", min = 0, max = 1023},
	{name = "BigFader 4", input = "value", output = "value", min = 0, max = 1023},
	{name = "BigFader 5", input = "value", output = "value", min = 0, max = 1023},
	{name = "BigFader 6", input = "value", output = "value", min = 0, max = 1023},
	{name = "BigFader 7", input = "value", output = "value", min = 0, max = 1023},
	{name = "BigFader 8", input = "value", output = "value", min = 0, max = 1023},
	{name = "Drawbar 1", input = "value", output = "value", min = 0, max = 127},
	{name = "Drawbar 2", input = "value", output = "value", min = 0, max = 127},
	{name = "Drawbar 3", input = "value", output = "value", min = 0, max = 127},
	{name = "Drawbar 4", input = "value", output = "value", min = 0, max = 127},
	{name = "Drawbar 5", input = "value", output = "value", min = 0, max = 127},
	{name = "Drawbar 6", input = "value", output = "value", min = 0, max = 127},
	{name = "Drawbar 7", input = "value", output = "value", min = 0, max = 127},
	{name = "Drawbar 8", input = "value", output = "value", min = 0, max = 127},
	{name = "Meter 1", output = "value", min = 0, max = 68},
	{name = "Meter 2", output = "value", min = 0, max = 68},
	{name = "Meter 3", output = "value", min = 0, max = 68},
	{name = "Meter 4", output = "value", min = 0, max = 68},
	{name = "Meter 5", output = "value", min = 0, max = 68},
	{name = "Meter 6", output = "value", min = 0, max = 68},
	{name = "Meter 7", output = "value", min = 0, max = 68},
	{name = "Meter 8", output = "value", min = 0, max = 68},
	{name = "Knob V1", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob V2", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob V3", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob V4", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob V5", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob V6", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob V7", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob V8", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob H1", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob H2", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob H3", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob H4", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob H5", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob H6", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob H7", input = "value", output = "value", min = 0, max = 127},
	{name = "Knob H8", input = "value", output = "value", min = 0, max = 127},
}

local inputs = {}
local outputs = {}

local itemsindex = {}
local itemsmodeindex = {}

local function hex_encode_text(text)
	local hexstring = ""
	
	for i = 1, #text do
		hexstring = hexstring..string.format("%02x ", string.byte(text:sub(i,i)))
	end

	return hexstring
end

function gen_scroll_string(string, color, speed)
	return(string.format("%s %02x %02x %s F7", MIDI_OUT_SCROLL, color, speed, hex_encode_text(string)))
end

function get_item_bvmap(itemname)
	local itemtype = string.match(itemname, "(.+%w)%s*%d")

	local item_conf_map = get_item_conf_map(itemname, g_colorscheme, get_current_page())

	if(item_conf_map.bvmap ~= nil) then
		itemtype = item_conf_map.bvmap
	end

	if(item_bvmap[itemtype] == nil) then
		itemtype = "Default"
	end

	return(item_bvmap[itemtype])
end

function get_item_conf_map(itemname, context, page)
	if(string.match(get_current_page(), "Internal")) then
		context = "Default"
	end
	
	if(item_conf_map[context] == nil) then
		context = "Default"
	end

	if((item_conf_map[context][page] ~= nil) and (item_conf_map[context][page][get_current_subpage()] ~= nil) and (item_conf_map[context][page][get_current_subpage()][itemname] ~= nil)) then
		return(item_conf_map[context][page][get_current_subpage()][itemname])
	end

	if(item_conf_map[context][page] == nil or item_conf_map[context][page][itemname] == nil) then
		wildpage = string.gsub(page, "%d+", "*")
		-- Parsec and Malstrom uses A/B naming
		wildpage = string.gsub(wildpage, " A", " *")
		wildpage = string.gsub(wildpage, " B", " *")
		-- Revival uses alternate naming of sections
		wildpage = string.gsub(wildpage, "Attack", "*")
		wildpage = string.gsub(wildpage, "Primary", "*")
		wildpage = string.gsub(wildpage, "Secondary", "*")
		wildpage = string.gsub(wildpage, "Release", "*")
		if((item_conf_map[context][wildpage] ~= nil) and (item_conf_map[context][wildpage][get_current_subpage()] ~= nil) and (item_conf_map[context][wildpage][get_current_subpage()][itemname] ~= nil)) then
			return(item_conf_map[context][wildpage][get_current_subpage()][itemname])
		end
		if(item_conf_map[context][wildpage] == nil or item_conf_map[context][wildpage][itemname] == nil) then
			if(item_conf_map[context]["Default"][itemname] == nil) then
				if(item_conf_map["Default"][page] == nil or item_conf_map["Default"][page][itemname] == nil) then
					context = "Default"
					page = "Default"
				else
					context = "Default"
				end	
			else
				page = "Default"
			end
		else
			page = wildpage
		end
	end

	local citem_conf_map = item_conf_map[context][page][itemname]

	if(not citem_conf_map) then
		local defaultitemname = string.gsub(itemname, " .+", " *")
		citem_conf_map = item_conf_map[context][page][defaultitemname]
	end

	return(citem_conf_map)
end

function get_button_color(context, itemname, buttonname, value)
	local color
	local buttonindex
	local buttonvalue = 0

	local enabled = remote.is_item_enabled(itemsindex[itemname])
	local value = remote.get_item_state(itemsindex[itemname]).value

	local citem_conf_map = get_item_conf_map(itemname, context, get_current_page())

	if(citem_conf_map.template ~= nil) then
		citem_conf_map_template = color_templates[citem_conf_map.template]	
	end

	-- Colors
	local activecolor = citem_conf_map.activecolor
	local enabledcolor = citem_conf_map.enabledcolor
	local disabledcolor = citem_conf_map.disabledcolor
	local dactivecolor = citem_conf_map.dactivecolor
	local denabledcolor = citem_conf_map.denabledcolor
	local maxcolor = citem_conf_map.maxcolor
	--Config
	local defaultvalue = citem_conf_map.defaultvalue

	if(citem_conf_map_template ~= nil) then
		if(activecolor == nil) then
			activecolor = citem_conf_map_template.activecolor
		end
		if(enabledcolor == nil) then
			enabledcolor = citem_conf_map_template.enabledcolor
		end
		if(disabledcolor == nil) then
			disabledcolor = citem_conf_map_template.disabledcolor
		end
		if(dactivecolor == nil) then
			dactivecolor = citem_conf_map_template.dactivecolor
		end
		if(denabledcolor == nil) then
			denabledcolor = citem_conf_map_template.denabledcolor
		end
		if(maxcolor == nil) then
			maxcolor = citem_conf_map_template.maxcolor
		end
		if(defaultvalue == nil) then
			defaultvalue = citem_conf_map_template.defaultvalue
		end
	end

	if(denabledcolor == nil) then
		denabledcolor = enabledcolor
	end
	if(dactivecolor == nil) then
		dactivecolor = activecolor
	end

	local value = remote.get_item_value(itemsindex[itemname])
	local textvalue = tonumber(remote.get_item_text_value(itemsindex[itemname]))
	local text = remote.get_item_text_value(itemsindex[itemname])

	if(string.find(itemname, "UDHButton %d%-%d_%d%-%d") or string.find(itemname, "UDVButton %d%-%d_%d%-%d")) then
        	if(enabled) then
                	if(value) then
                        	color = activecolor
                	else
                        	color = enabledcolor
                	end
        	else
                	color = disabledcolor
        	end
	elseif(string.find(itemname, "Button %d%-%d") or string.find(itemname, "Button C%d") or string.find(itemname, "Button %a")) then
		if(g_scopetext == "Redrum" and string.match(get_current_page(), "Main") and (string.match(itemname, "Button [12]%-%d"))) then
			if(g_playingbutton == itemname and (tonumber(remote.get_item_text_value(itemsindex["Button 3-8"])) == 1)) then
                       		color = RED
			else 
				if(textvalue == 1) then
                       			color = YELLOW
				elseif(textvalue == 2) then
                       			color = AMBER
				elseif(textvalue == 3) then
                       			color = ORANGE
				else
                       			color = WGREEN
				end
			end
		elseif(g_scopetext == "Redrum" and string.match(get_current_page(), "Main") and (string.match(itemname, "Button 4%-6"))) then
			if(textvalue == 1) then
                       		color = YELLOW
			elseif(textvalue == 2) then
                       		color = AMBER
			elseif(textvalue == 3) then
                       		color = ORANGE
			else
                       		color = NOCOLOR
			end
		elseif(g_scopetext == "Thor" and string.match(get_current_page(), "Step Sequencer") and (string.match(itemname, "Button [12]%-%d"))) then
			if(g_playingbutton == itemname and (tonumber(remote.get_item_value(itemsindex["Button 8-1"])) == 1)) then
                       		color = YELLOW
			else 
				if(value == 1) then
                       			color = RED
				else
                       			color = WGREEN
				end
			end
		else
        		if(enabled) then
                		if(value == 1) then
                        		color = activecolor
                		else
                        		color = enabledcolor
                		end
        		else
                		color = disabledcolor
        		end
		end
	elseif(string.find(itemname, "Knob H%d")) then
		buttonindex = tonumber(string.sub(buttonname, -1,-1))
		if(value > 64) then
			if(buttonindex >= 5) then
				buttonvalue = get_item_bvmap(itemname)[buttonindex-1]
				if(value > buttonvalue) then
					color = activecolor
				else 
					color = enabledcolor
				end
			else
				color = enabledcolor
			end
		elseif(value < 64) then
			if(buttonindex <= 4) then
				buttonvalue = get_item_bvmap(itemname)[buttonindex]
				if(value <= buttonvalue) then
					color = activecolor
				else 
					color = enabledcolor
				end
			else
				color = enabledcolor
			end
		else
			if(buttonindex == 4 or buttonindex == 5) then
				color = activecolor
			else
				color = enabledcolor
			end
		end
	elseif(string.find(itemname, "Knob V%d")) then
		buttonindex = tonumber(string.sub(buttonname, -3,-3))
		if(value > 64) then
			if(buttonindex <= 4) then
				buttonvalue = get_item_bvmap(itemname)[buttonindex+1]
				if(value > buttonvalue) then
					color = activecolor
				else 
					color = enabledcolor
				end
			else
				color = enabledcolor
			end
		elseif(value < 64) then
			if(buttonindex >= 5) then
				buttonvalue = get_item_bvmap(itemname)[buttonindex-1]
				if(value < buttonvalue) then
					color = activecolor
				else 
					color = enabledcolor
				end
			else
				color = enabledcolor
			end
		else
			if(buttonindex == 4 or buttonindex == 5) then
				color = activecolor
			else
				color = enabledcolor
			end
		end
	else
		if(string.find(itemname, "Drawbar %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "Meter %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "BigFader %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "Fader %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))
			buttonvalue = get_item_bvmap(itemname)[buttonindex]
		end

		if(value >= buttonvalue) then
			if(string.find(itemname, "Meter %d") and buttonindex == 0) then
				color = maxcolor
			else 
				if((string.find(itemname, "BigFader %d") or string.find(itemname, "Fader %d")) and buttonvalue == defaultvalue) then
					color = dactivecolor
				else
					color = activecolor
				end
			end
		else 
			if((string.find(itemname, "BigFader %d") or string.find(itemname, "Fader %d")) and buttonvalue == defaultvalue) then
				color = denabledcolor
			else
				color = enabledcolor
			end
		end
	end

	return color
end

function get_item_by_button(buttonname) 
        for i=1,8 do
		local fadername = "Fader "..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button %d%-"..tostring(i))) then
				return fadername
			end
		end
	end
        for i=1,8 do
		local fadername = "BigFader "..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button %d%-"..tostring(i))) then
				return fadername
			end
		end
	end
        for i=1,8 do
		local fadername = "Drawbar "..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button %d%-"..tostring(i))) then
				return fadername
			end
		end
	end
        for i=1,8 do
		local fadername = "Meter "..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button %d%-"..tostring(i))) then
				return fadername
			end
		end
	end
        for i=1,8 do
		local fadername = "Knob H"..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button "..tostring(i).."%-%d")) then
				return fadername
			end
		end
	end
        for i=1,8 do
		local fadername = "Knob V"..tostring(i)
		if(remote.is_item_enabled(itemsindex[fadername])) then
			if(string.find(buttonname, "Button %d%-"..tostring(i))) then
				return fadername
			end
		end
	end
	for row=1,8 do
		for column=1,8,2 do
			local udhbuttonname = "UDHButton "..row.."-"..column.."_"..row.."-"..tostring(column+1)
			if(remote.is_item_enabled(itemsindex[udhbuttonname])) then
				if(string.find(buttonname, "Button "..row.."%-"..column)) then
					return udhbuttonname
				elseif(string.find(buttonname, "Button "..row.."%-"..tostring(column+1))) then
					return udhbuttonname
				end
			end
		end
	end
	for row=1,8,2 do
		for column=1,8 do
			local udvbuttonname = "UDVButton "..row.."-"..column.."_"..tostring(row+1).."-"..column
			if(remote.is_item_enabled(itemsindex[udvbuttonname])) then
				if(string.find(buttonname, "Button "..row.."%-"..column)) then
					return udvbuttonname
				elseif(string.find(buttonname, "Button "..tostring(row+1).."%-"..column)) then
					return udvbuttonname
				end
			end
		end
	end
	return buttonname
end

function get_current_page()
	local pagename = "Unknown"

	if(remote.is_item_enabled(itemsindex["PageName"])) then
		pagename = remote.get_item_text_value(itemsindex["PageName"])
	end

	return pagename
end

function get_current_subpage()
	local subpagename = "Unknown"

	if(remote.is_item_enabled(itemsindex["SubPageName"])) then
		subpagename = remote.get_item_text_value(itemsindex["SubPageName"])
	end

	return subpagename
end

function lightshow_bars(buttonname, cyclelength, orientation) 
	local color
	
	if(g_updatetime + cyclelength < remote.get_time_ms()) then
		g_lightshowcycle = g_lightshowcycle + 1
		if(g_lightshowcycle > 8) then
			g_lightshowcycle = 1
		end
		g_updatetime = remote.get_time_ms()
	end

	if(string.match(buttonname, "Button C%d") or string.match(buttonname, "Button %a")) then
		color = NOCOLOR
	else
		local row
		local col
		row, col = string.match(buttonname, "Button (%d)%-(%d)")
		local dim
		if(orientation == 1) then
			dim = row
		else 
			dim = col
		end
		local cloop = tonumber(dim) - g_lightshowcycle
		if(cloop < 1) then
			cloop = cloop + 8
		end
		color = gradient[cloop]
	end
	return color
end

function lightshow_center(buttonname, cyclelength) 
	local color
	
	if(g_updatetime + cyclelength < remote.get_time_ms()) then
		g_lightshowcycle = g_lightshowcycle + 1
		if(g_lightshowcycle > 4) then
			g_lightshowcycle = 1
			g_lightshowloop = g_lightshowloop + 1
			if(g_lightshowloop > 8) then
				g_lightshowloop = 1
			end
		end
		g_updatetime = remote.get_time_ms()
	end

	if(string.match(buttonname, "Button C%d") or string.match(buttonname, "Button %a")) then
		color = NOCOLOR
	else
		local row
		local col
		row, col = string.match(buttonname, "Button (%d)%-(%d)")

		local x
		local y

		if(tonumber(row) >= 5) then
			x = tonumber(row) - 4
		else 
			x = 5-tonumber(row)
		end
		if(tonumber(col) >= 5) then
			y = tonumber(col) - 4
		else 
			y = 5-tonumber(col)
		end
		if(x <= g_lightshowcycle and y <= g_lightshowcycle) then
			color = gradient[g_lightshowloop]
		else
			color = NOCOLOR
		end
	end
	return color
end

function remote_init()
	for buttonname,buttonmidi in pairs(buttons) do
		table.insert(items, {name = buttonname, input = "button", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}})
		table.insert(inputs, {pattern=buttonmidi .. " ?<???x>", name=buttonname})
	end

	for row=1,8 do
		for column=1,8,2 do
			table.insert(items, {name = "UDHButton "..row.."-"..column.."_"..row.."-"..tostring(column+1), input = "delta", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}})
		end
	end

	for sel=1,4 do
		for val=0,127 do
			table.insert(items, {name = "Sel"..sel.."_"..val, input= "button", output = "value", min = 0, max = 1})
		end
	end

	for row=1,8,2 do
		for column=1,8 do
			table.insert(items, {name = "UDVButton "..row.."-"..column.."_"..tostring(row+1).."-"..column, input = "delta", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1", "SEL2", "SEL3", "SEL4"}})
		end
	end

	for index,item in ipairs(items) do
		itemsindex[item.name] = index
		itemsmodeindex[item.name] = {}
		if(item.modes ~= nil) then
			for mindex,mode in ipairs(item.modes) do
				itemsmodeindex[item.name][mode] = mindex
			end
		end
	end

	remote.define_items(items)
	remote.define_auto_inputs(inputs)
end

function remote_release_from_use()
	local ret_events={}

	return ret_events;
end

function remote_prepare_for_use()
	local ret_events={}

	table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0,DBUPDATE1,DBCOPY))))

	return ret_events;
end

function remote_set_state(changed_items)
	for i,citemindex in ipairs(changed_items)do
		local citemname = items[citemindex].name

		g_updateditems[citemname] = true

		if(citemname ~= nil) then
			if(remote.get_item_mode(citemindex) == itemsmodeindex[citemname]["SEL1"]) then
				g_sel1 = remote.get_item_value(citemindex)
			elseif(remote.get_item_mode(citemindex) == itemsmodeindex[citemname]["SEL2"]) then
				g_sel2 = remote.get_item_value(citemindex)
			elseif(remote.get_item_mode(citemindex) == itemsmodeindex[citemname]["SEL3"]) then
				g_sel3 = remote.get_item_value(citemindex)
			elseif(remote.get_item_mode(citemindex) == itemsmodeindex[citemname]["SEL4"]) then
				g_sel4 = remote.get_item_value(citemindex)
			end
			if(string.match(citemname, "DeviceScope")) then
				-- g_scrolltext = remote.get_item_text_value(itemsindex["DeviceScope"])
				g_updateall = true
       				if(remote.is_item_enabled(itemsindex["DeviceScope"])) then
               				local newscope = remote.get_item_text_value(itemsindex["DeviceScope"])
					g_scopetext = newscope
					g_colorscheme = g_scopetext
       				else
               				local newscope = ""
					g_scopetext = newscope
       				end
			elseif(string.match(citemname, "BarPosition")) then
				g_startbar = true
			elseif(string.match(citemname, "BeatPosition")) then
				if(not g_barupdate and not g_startbar) then
					g_startbeat = true
				end
			elseif(string.match(citemname, "PlayingStep")) then
				if(g_scopetext == "Redrum") then
               				local playingstep = tonumber(remote.get_item_text_value(itemsindex["PlayingStep"]))
					local editsteps = math.floor(remote.get_item_value(itemsindex["UDVButton 5-8_6-8"])/42)+1
					local cstep = (playingstep-1)%16
					local cpage = math.floor(((playingstep-1))/16)+1
					local crowstep = (cstep)%8+1
					local crow = math.floor((cstep)/8)+1

					if(editsteps == cpage) then
						-- Old playing button
						g_updateditems[g_playingbutton] = true
						g_playingbutton = "Button "..tostring(crow).."-"..tostring(crowstep)
						-- New playing button
						g_updateditems[g_playingbutton] = true
					else
						g_playingbutton = "Other page"	
					end
				elseif(g_scopetext == "Thor") then
               				local playingstep = tonumber(remote.get_item_text_value(itemsindex["PlayingStep"]))
					local crowstep = (playingstep)%8+1
					local crow = math.floor((playingstep)/8)+1

					-- Old playing button
					g_updateditems[g_playingbutton] = true
					g_playingbutton = "Button "..tostring(crow).."-"..tostring(crowstep)
					-- New playing button
					g_updateditems[g_playingbutton] = true
				end
			elseif(string.match(citemname, "PageName")) then
				g_updateall = true
				if(g_scopetext == "Europa") then
					g_enginenumnew = tonumber(string.match(get_current_page(), "Eng (%d)"))
					g_lfonumnew = tonumber(string.match(get_current_page(), "LFO (%d)"))
					g_envnumnew = tonumber(string.match(get_current_page(), "Env (%d)"))
					if(string.match(get_current_page(), "Phaser")) then
						g_effectnumnew = 5
					elseif(string.match(get_current_page(), "Dist")) then
						g_effectnumnew = 3
					elseif(string.match(get_current_page(), "Eq")) then
						g_effectnumnew = 6
					elseif(string.match(get_current_page(), "Delay")) then
						g_effectnumnew = 2
					elseif(string.match(get_current_page(), "Comp")) then
						g_effectnumnew = 4
					elseif(string.match(get_current_page(), "Reverb")) then
						g_effectnumnew = 1
					end
				elseif(g_scopetext == "RV7000 Advanced Reverb") then
					if(string.match(get_current_page(), "Reverb")) then
						g_editnumnew = 0
					elseif(string.match(get_current_page(), "Eq")) then
						g_editnumnew = 1
					elseif(string.match(get_current_page(), "Gate")) then
						g_editnumnew = 2
					end
				end
			elseif(string.match(citemname, "SubPageName")) then
				g_updateall = true
			end
		end
	end
end

function remote_deliver_midi(maxbytes, port)
	local ret_events = {}
	local send_event={}

	if(g_lightshow == 0 and not g_flashing) then
		local curdisp
		local curupdate

		local swapbuffers = false

		for buttonname,buttonmidi in pairs(buttons) do
			local color
			local itemname = get_item_by_button(buttonname)

			if((g_updateditems[itemname] ~= nil) or g_updateall) then
				color = get_button_color(g_colorscheme, itemname, buttonname)
				table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttonmidi, color)))
				if(not swapbuffers) then
					swapbuffers = true
				end
			end
		end

		if(swapbuffers) then
			if(g_currentbuffer == 0) then
				newdisp = DBDISP1
				newupdate = DBUPDATE0
				g_currentbuffer = 1
				-- table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons['Button H'], bit.bor(GREEN, COPY))))
			else
				newdisp = DBDISP0
				newupdate = DBUPDATE1
				g_currentbuffer = 0
				-- table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons['Button H'], bit.bor(RED, COPY))))
			end

			table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(newdisp,newupdate,DBCOPY))))
			swapbuffers = false

			g_updateditems = {}
			g_updateall = false
		end
	end

	if(g_brightness ~= g_brightness_new) then
		g_brightness = g_brightness_new
		table.insert(ret_events, remote.make_midi(MIDI_OUT_BRIGHTNESS.." "..brightness[g_brightness]))
	end

	if(g_flashing) then
		if(g_flashtime + g_flashlength < remote.get_time_ms()) then
			g_flashtime = remote.get_time_ms()

			if(g_flashstate == 1) then
				g_flashstate = 0
				table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0))))
			else
				g_flashstate = 1
				table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP1))))
			end
		end
	end

	if(g_stopflashing) then
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0,DBUPDATE1,DBCOPY))))
		g_currentbuffer = 0
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button C8"], bit.bor(GREEN, COPY))))
		g_flashing = false
		g_stopflashing = false
		g_flashstate = 0
		g_updateall = true
	end

	if(g_startflashing) then
		local helpcolor = RED
		g_flashlength = 250
		if(g_valuemode) then
			helpcolor = AMBER
			g_flashlength = 100
		end
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(DBDISP0,DBUPDATE1,DBCOPY))))
		for buttonname,buttonmidi in pairs(buttons) do
			table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttonmidi, 0)))
		end
		table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button C8"], bit.bor(helpcolor, COPY))))
		g_flashing = true
		g_startflashing = false
		g_flashstate = 0
		g_flashtime = remote.get_time_ms()
	end

	if(g_scrolltext ~= nil) then
		table.insert(ret_events, remote.make_midi(gen_scroll_string(g_scrolltext, g_scrollcolor, g_scrollspeed)))
		g_scrolling = true
		g_scrolltime = remote.get_time_ms()
		g_scrolltext = nil
		g_scrollcolor = g_scrollcolor_default
		g_scrollspeed = g_scrollspeed_default
	end

	if(g_endscroll) then
		table.insert(ret_events, remote.make_midi(MIDI_OUT_ENDSCROLL))
		g_endscroll = false
		g_scrolling = false
		g_updateall = true
	end

	if(g_lightshow > 0) then
		for buttonname,buttonmidi in pairs(buttons) do
			local color 

			if(g_lightshow == 1) then
				color = lightshow_bars(buttonname, 50, 1)
			elseif(g_lightshow == 2) then
				color = lightshow_bars(buttonname, 50, 0)
			elseif(g_lightshow == 3) then
				color = lightshow_bars(buttonname, 500, 0)
			elseif(g_lightshow == 4) then
				color = lightshow_center(buttonname, 50)
			end

			table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttonmidi, color)))
		end

		if(g_currentbuffer == 0) then
			newdisp = DBDISP1
			newupdate = DBUPDATE0
			g_currentbuffer = 1
		else
			newdisp = DBDISP0
			newupdate = DBUPDATE1
			g_currentbuffer = 0
		end

		table.insert(ret_events, remote.make_midi(string.format("%s %02x", MIDI_OUT_DOUBLEBUFF, bit.bor(newdisp,newupdate,DBCOPY))))
	end

	if(remote.get_item_value(itemsindex["Button A"]) > 0) then
		if(g_startbar) then
			g_barupdatetime = remote.get_time_ms()
			g_startbar = false	
			g_barupdate = true
			table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button A"], bit.bor(RED, COPY))))
		elseif(g_startbeat) then
			g_beatupdatetime = remote.get_time_ms()
			g_startbeat = false	
			g_beatupdate = true
			table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button A"], bit.bor(WAMBER, COPY))))
		end
	
		if(g_barupdate) then
			if(g_barupdatetime + 200 < remote.get_time_ms()) then
				g_barupdate = false
				table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button A"], bit.bor(WGREEN, COPY))))
			end
		elseif(g_beatupdate) then
			if(g_beatupdatetime + 200 < remote.get_time_ms()) then
				g_beatupdate = false
				table.insert(ret_events, remote.make_midi(string.format("%s %02x", buttons["Button A"], bit.bor(WGREEN, COPY))))
			end
		end
	else
		g_startbar = false
		g_startbeat = false
		g_barupdate = false
		g_beatupdate = false
	end

	-- If sel* is updated trigger midi event by sending get version sysex
	if(g_sel1 ~= -1 or g_sel2 ~= -1 or g_sel3 ~= -1 or g_sel4 ~= -1) then
		table.insert(ret_events, remote.make_midi(MIDI_OUT_GETVERSION))
	end

	return ret_events
end

function remote_process_midi(event)
        local pad = "none"
        local pad_note = 0
        local pad_item = 0

	if(g_sel1 ~= -1) then
		local msg = { time_stamp = event.time_stamp, item = itemsindex["Sel1_"..g_sel1], value = 1 }
		remote.handle_input(msg)
		g_sel1 = -1
		g_updateall = true
	end

	if(g_sel2 ~= -1) then
		local msg = { time_stamp = event.time_stamp, item = itemsindex["Sel2_"..g_sel2], value = 1 }
		remote.handle_input(msg)
		g_sel2 = -1
		g_updateall = true
	end

	if(g_sel3 ~= -1) then
		local msg = { time_stamp = event.time_stamp, item = itemsindex["Sel3_"..g_sel3], value = 1 }
		remote.handle_input(msg)
		g_sel3 = -1
		g_updateall = true
	end

	if(g_sel4 ~= -1) then
		local msg = { time_stamp = event.time_stamp, item = itemsindex["Sel4_"..g_sel4], value = 1 }
		remote.handle_input(msg)
		g_sel4 = -1
		g_updateall = true
	end

	if(g_enginenumnew ~= nil and g_enginenumnew ~= g_enginenum) then
		g_enginenum = g_enginenumnew
		g_enginenumnew = nil
		local msg = { time_stamp = event.time_stamp, item = itemsindex["EngineSelect"], value = g_enginenum-1 }
		remote.handle_input(msg)
	end

	if(g_effectnumnew ~= nil and g_effectnumnew ~= g_effectnum) then
		g_effectnum = g_effectnumnew
		g_effectnumnew = nil
		local msg = { time_stamp = event.time_stamp, item = itemsindex["EffectSelect"], value = g_effectnum-1 }
		remote.handle_input(msg)
	end

	if(g_editnumnew ~= nil and g_editnumnew ~= remote.get_item_value(itemsindex["EditSelect"])) then
		local msg = { time_stamp = event.time_stamp, item = itemsindex["EditSelect"], value = g_editnumnew }
		g_editnumnew = nil
		remote.handle_input(msg)
	end

	if(g_lfonumnew ~= nil and g_lfonumnew ~= g_lfonum) then
		g_lfonum = g_lfonumnew
		g_lfonumnew = nil
		local msg = { time_stamp = event.time_stamp, item = itemsindex["LFOSelect"], value = g_lfonum-1 }
		remote.handle_input(msg)
	end

	if(g_envnumnew ~= nil and g_envnumnew ~= g_envnum) then
		g_envnum = g_envnumnew
		g_envnumnew = nil
		local msg = { time_stamp = event.time_stamp, item = itemsindex["EnvSelect"], value = g_envnum-1 }
		remote.handle_input(msg)
	end

	local msg_scrollend = remote.match_midi(MIDI_IN_SCROLLEND, event)
	if(msg_scrollend ~= nil) then
		g_scrolling = false
		g_updateall = true
		return true
	end

	if(g_scrolling) then
		for buttonname,buttonmidi in pairs(buttons) do
			local button = remote.match_midi(buttonmidi.." 7f", event)
			if(button ~= nil) then
				return true
			end
			local button = remote.match_midi(buttonmidi.." 00", event)
			if(button ~= nil) then
				if(g_scrolltime + 1000 < remote.get_time_ms()) then
					g_endscroll = true
				end
				return true
			end
		end
	end

	if(g_lightshow > 0) then
		for buttonname,buttonmidi in pairs(buttons) do
			local button = remote.match_midi(buttonmidi.." 7f", event)
			if(button ~= nil) then
				return true
			end
			local button = remote.match_midi(buttonmidi.." 00", event)
			if(button ~= nil) then
				if(g_lightshowtime + 500 < remote.get_time_ms()) then
					g_lightshow = 0
					g_updateall = true
				end
				return true
			end
		end
	end

	if(not g_helpmode and not g_valuemode) then
        	if(g_scopetext == "Kong" and string.match(get_current_page(), "Main")) then
			for button,padnote in pairs(button_to_padnote) do
                		pad = remote.match_midi("<100x>? "..tostring(button).." zz", event)
                		if(pad ~= nil) then
                        		remote.handle_input({ time_stamp = event.time_stamp, item = 1, value = pad.x, note = padnote, velocity = pad.z })
					return true
				end
			end
		end
	
        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["Fader "..i])) then
				button = remote.match_midi("90 x"..tostring(i-1).." 7f", event)
				if(button ~= nil) then
					local msg = { time_stamp = event.time_stamp, item = itemsindex["Fader "..i], value = get_item_bvmap("Fader "..i)[button.x+1] }
					remote.handle_input(msg)
					return true
				end
			end
		end
	
        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["BigFader "..i])) then
				button = remote.match_midi("90 x"..tostring(i-1).." 7f", event)
				if(button ~= nil) then
					local msg = { time_stamp = event.time_stamp, item = itemsindex["BigFader "..i], value = get_item_bvmap("BigFader "..i)[button.x+1] }
					remote.handle_input(msg)
					return true
				end
			end
		end
	
        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["Drawbar "..i])) then
				button = remote.match_midi("90 x"..tostring(i-1).." 7f", event)
				if(button ~= nil) then
					local msg = { time_stamp = event.time_stamp, item = itemsindex["Drawbar "..i], value = get_item_bvmap("Drawbar "..i)[button.x+1] }
					remote.handle_input(msg)
					return true
				end
			end
		end
	
        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["Knob H"..i])) then
				button = remote.match_midi("90 "..tostring(i-1).."x 7f", event)
				if(button ~= nil) then
					local oldvalue = remote.get_item_value(itemsindex["Knob H"..i])
					local value = get_item_bvmap("Knob H"..i)[button.x+1]
					if((oldvalue < 64 and button.x+1 == 5) or (oldvalue > 64 and button.x+1 == 4)) then
						value = 64
					end
					local msg = { time_stamp = event.time_stamp, item = itemsindex["Knob H"..i], value = value }
					remote.handle_input(msg)
					return true
				end
			end
		end

        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["Knob V"..i])) then
				button = remote.match_midi("90 x"..tostring(i-1).." 7f", event)
				if(button ~= nil) then
					local oldvalue = remote.get_item_value(itemsindex["Knob V"..i])
					local value = get_item_bvmap("Knob V"..i)[button.x+1]
					if((oldvalue > 64 and button.x+1 == 5) or (oldvalue < 64 and button.x+1 == 4)) then
						value = 64
					end
					local msg = { time_stamp = event.time_stamp, item = itemsindex["Knob V"..i], value = value }
					remote.handle_input(msg)
					return true
				end
			end
		end

		for row=1,8 do
			for column=1,8,2 do
				local udhbuttonname = "UDHButton "..row.."-"..column.."_"..row.."-"..tostring(column+1)
				local button_down_name = "Button "..row.."-"..column
				local button_up_name = "Button "..row.."-"..column+1
				if(remote.is_item_enabled(itemsindex[udhbuttonname])) then
					local button_down = remote.match_midi(buttons[button_down_name].." 7f", event)
					if(button_down ~= nil) then
						local value = -1
						local msg = { time_stamp = event.time_stamp, item = itemsindex[udhbuttonname], value = value }
						remote.handle_input(msg)
						return true
					end
					local button_up = remote.match_midi(buttons[button_up_name].." 7f", event)
					if(button_up ~= nil) then
						local value = 1
						local msg = { time_stamp = event.time_stamp, item = itemsindex[udhbuttonname], value = value }
						remote.handle_input(msg)
						return true
					end
				end
			end
		end
	
		for row=1,8,2 do
			for column=1,8 do
				local udvbuttonname = "UDVButton "..row.."-"..column.."_"..tostring(row+1).."-"..column
				local button_up_name = "Button "..row.."-"..column
				local button_down_name = "Button "..tostring(row+1).."-"..column
				if(remote.is_item_enabled(itemsindex[udvbuttonname])) then
					local button_down = remote.match_midi(buttons[button_down_name].." 7f", event)
					if(button_down ~= nil) then
						local value = -1
						if(get_item_conf_map(udvbuttonname, g_colorscheme, get_current_page()).inverted) then
							value = 1
						end
						local msg = { time_stamp = event.time_stamp, item = itemsindex[udvbuttonname], value = value }
						remote.handle_input(msg)
						return true
					end
					local button_up = remote.match_midi(buttons[button_up_name].." 7f", event)
					if(button_up ~= nil) then
						local value = 1
						if(get_item_conf_map(udvbuttonname, g_colorscheme, get_current_page()).inverted) then
							value = -1
						end
						local msg = { time_stamp = event.time_stamp, item = itemsindex[udvbuttonname], value = value }
						remote.handle_input(msg)
						return true
					end
				end
			end
		end
	end
	
	if(g_helpmode) then
		for buttonname,buttonmidi in pairs(buttons) do
			local color
			local button = remote.match_midi(buttonmidi.." 7f", event)

			if(button ~= nil) then
				g_helpmode = false
				g_stopflashing = true
				g_scrollcolor = RED
				local itemname = get_item_by_button(buttonname)

				if(itemname == "Button C1" or itemname == "Button C2") then
					g_scrolltext = g_scopetext
				elseif(itemname == "Button C3" or itemname == "Button C4") then
					g_scrolltext = remote.get_item_text_value(itemsindex["PatchName"])
				elseif(itemname == "Button C7") then
					g_scrolltext = get_current_page()
				elseif(itemname == "Button C8") then
					g_valuemode = true
					g_startflashing = true
				-- This is used to debug a value
				elseif(itemname == "Button H") then
					g_scrolltext = tostring(remote.get_item_value(itemsindex["Button 5-8"]))
				else
					g_scrolltext = remote.get_item_name(itemsindex[itemname])
				end
				if(g_scrolltext == "") then
					g_scrolltext = get_item_conf_map(itemname, g_colorscheme, get_current_page()).helptext
					if(g_scrolltext == nil) then
						g_scrolltext = "Unknown"
					end
				end
				return true
			end
		end
	end

	if(g_valuemode) then
		for buttonname,buttonmidi in pairs(buttons) do
			local color
			local button = remote.match_midi(buttonmidi.." 7f", event)

			if(button ~= nil) then
				g_valuemode = false
				g_stopflashing = true
				g_scrollcolor = YELLOW
				local itemname = get_item_by_button(buttonname)

				if(itemname == "Button C1" or itemname == "Button C2") then
					g_scrolltext = remote.get_item_text_value(itemsindex["DeviceName"])
				elseif(itemname == "Button C8") then
					return true
				else
					g_scrolltext = tostring(remote.get_item_value(itemsindex[itemname]))
				end

				if(g_scrolltext == "") then
					g_scrolltext = "Unknown"
				end
				return true
			end
		end
	end

	if(string.match(get_current_page(), "Internal")) then
		local button_brightnessup = remote.match_midi(buttons["Button 7-8"].." 7f", event)
		local button_brightnessdown = remote.match_midi(buttons["Button 8-8"].." 7f", event)
		if(button_brightnessup ~= nil) then
			if(g_brightness_new < 5) then
				g_brightness_new = g_brightness_new+1
			end
			return true
		elseif(button_brightnessdown ~= nil) then
			if(g_brightness_new > 1) then
				g_brightness_new = g_brightness_new-1
			end
			return true
		end
		local button_lightshow1 = remote.match_midi(buttons["Button 1-6"].." 7f", event)
		if(button_lightshow1 ~= nil) then
			g_lightshow = 1
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			return true
		end
		local button_lightshow2 = remote.match_midi(buttons["Button 1-7"].." 7f", event)
		if(button_lightshow2 ~= nil) then
			g_lightshow = 2
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			return true
		end
		local button_lightshow3 = remote.match_midi(buttons["Button 1-8"].." 7f", event)
		if(button_lightshow3 ~= nil) then
			g_lightshow = 3
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			return true
		end
		local button_lightshow4 = remote.match_midi(buttons["Button 2-8"].." 7f", event)
		if(button_lightshow4 ~= nil) then
			g_lightshow = 4
			g_lightshowtime = remote.get_time_ms()
			g_updatetime = remote.get_time_ms()
			g_lightshowcycle = 1
			g_lightshowloop = 1
			return true
		end
	end

	local button_helpmode = remote.match_midi(buttons["Button C8"].." 7f", event)
	if(button_helpmode ~= nil) then
		g_helpmode = true
		g_startflashing = true
		return true
	end

	if(g_helpmode or g_valuemode) then
		return true
	end

	return false
end

function remote_probe(manufacturer,model,prober)
	local controlRequest="F0 7E 7F 06 01 F7"
	local controlResponse="F0 7E 00 06 02 00 20 29 36 00 ?? ?? ?? ?? ?? ??  F7"

	return {
                request=controlRequest,
                response=controlResponse
        }
end
