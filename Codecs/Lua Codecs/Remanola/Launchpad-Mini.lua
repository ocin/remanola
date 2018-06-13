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
g_sel1 = -1
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

fader_bvmap={
	["Default"]={
		[0]=127,
		[1]=113,
		[2]=100,
		[3]=75,
		[4]=63,
		[5]=40,
		[6]=20,
		[7]=0,
	},
	["BigFader"]={
		[0]=1023,
		[1]=876,
		[2]=751,
		[3]=631,
		[4]=511,
		[5]=340,
		[6]=170,
		[7]=0,
	},
}

knobvbutton_to_value={
	[1]=127,
	[2]=111,
	[3]=95,
	[4]=79,
	[5]=47,
	[6]=31,
	[7]=15,
	[8]=0,
}

knobhbutton_to_value={
	[1]=0,
	[2]=15,
	[3]=31,
	[4]=47,
	[5]=79,
	[6]=95,
	[7]=111,
	[8]=127,
}

drawbarbutton_to_value={
	[0]=0,
	[1]=20,
	[2]=40,
	[3]=63,
	[4]=80,
	[5]=100,
	[6]=113,
	[7]=127,
}

meterbutton_to_value={
	[7]=1,
	[6]=8,
	[5]=15,
	[4]=21,
	[3]=27,
	[2]=33,
	[1]=39,
	[0]=45,
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

local item_conf_map = {
	["Default"]={
		["Default"]={
			["Button *"]={enabledcolor=YELLOW,    activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Fader *"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=100},
			["BigFader *"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=751},
			["Drawbar *"]={enabledcolor=NOCOLOR,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Meter *"]={enabledcolor=WGREEN,      activecolor=GREEN,     disabledcolor=NOCOLOR, maxcolor=RED},
			["Knob *"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
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
			["Button 1-1"]={enabledcolor=RED,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Main"},
			["Button 2-1"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-1"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-1"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-1"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-1"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-1"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},

			["Button 1-2"]={enabledcolor=WRED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-2"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},

			["Button 1-3"]={enabledcolor=WRED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-3"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-3"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-3"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},

			["Button 1-4"]={enabledcolor=WRED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},

			["Button 1-5"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-5"]={enabledcolor=GREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-5"]={enabledcolor=GREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-5"]={enabledcolor=GREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-5"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-5"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-5"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-5"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},

			["Button 1-6"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-6"]={enabledcolor=WGREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-6"]={enabledcolor=WGREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-6"]={enabledcolor=WGREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-6"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-6"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-6"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-6"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},

			["Button 1-7"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},

			["Button 1-8"]={enabledcolor=RED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Internal"]={
			["Button 1-1"]={enabledcolor=RED,    activecolor=RED,  disabledcolor=NOCOLOR},
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
			["Button 2-1"]={enabledcolor=GREEN,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=GREEN,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=GREEN,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=AMBER,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=AMBER,    activecolor=RED,  disabledcolor=NOCOLOR},
		},
		["Main"]={
		},
		["Channel Mutes & Solos"]={
			["Button 1-1"]={enabledcolor=YELLOW,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 1-2"]={enabledcolor=YELLOW,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 1-3"]={enabledcolor=YELLOW,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 1-4"]={enabledcolor=YELLOW,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 1-5"]={enabledcolor=YELLOW,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 1-6"]={enabledcolor=YELLOW,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 1-7"]={enabledcolor=YELLOW,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 1-8"]={enabledcolor=YELLOW,    activecolor=RED,  disabledcolor=NOCOLOR},
	
			["Button 2-1"]={enabledcolor=WAMBER,    activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=WAMBER,    activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=WAMBER,    activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=WAMBER,    activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-5"]={enabledcolor=WAMBER,    activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-6"]={enabledcolor=WAMBER,    activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-7"]={enabledcolor=WAMBER,    activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=WAMBER,    activecolor=GREEN,  disabledcolor=NOCOLOR},

			["Button 3-1"]={enabledcolor=YELLOW,    activecolor=RED,  disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=WAMBER,    activecolor=GREEN,  disabledcolor=NOCOLOR},

			["Button 7-7"]={enabledcolor=ORANGE,    activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,    activecolor=GREEN,  disabledcolor=NOCOLOR},
		},
		["Channel Faders"]={
		},

	},
	["Mix Channel"]={
		["Default"]={
		},
		["Main"]={
			["Button 1-1"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 1-2"]={enabledcolor=WAMBER,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 5-1"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
		},
		["Send"]={
			["Button 1-1"]={enabledcolor=WAMBER,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 2-1"]={enabledcolor=WAMBER,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 3-1"]={enabledcolor=WAMBER,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 4-1"]={enabledcolor=WAMBER,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 5-1"]={enabledcolor=WAMBER,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 6-1"]={enabledcolor=WAMBER,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=WAMBER,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 8-1"]={enabledcolor=WAMBER,   activecolor=GREEN,    disabledcolor=NOCOLOR},
		},
	},
	["Kong"]={
		["Default"]={
			-- Pads
			["Button 5-1"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 5-2"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 5-3"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 5-4"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 6-1"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 6-3"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 6-4"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 7-3"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 7-4"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 8-1"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 8-4"]={enabledcolor=WGREEN,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
		},
		["Main"]={
			-- Pads
			["Button 5-1"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 5-2"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 5-3"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 5-4"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 6-1"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 6-3"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 6-4"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 7-3"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 7-4"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 8-1"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 8-4"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
		},
		["Mutes & Solos"]={
			-- Mute
			["Button 1-1"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 1-2"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 1-3"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 1-4"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 2-1"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 3-1"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 4-1"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			-- Solo
			["Button 1-5"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 1-6"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 1-7"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 1-8"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-5"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-6"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-7"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 3-5"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 3-6"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 4-5"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 4-6"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
		},
	},
	["Redrum"]={
		["Default"]={
			-- Goto Main or Performance
			["Button 1-1"]={enabledcolor=WAMBER, activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 1-2"]={enabledcolor=WAMBER, activecolor=AMBER,   disabledcolor=NOCOLOR},
			-- Goto Drum edit/main
			["Button 2-1"]={enabledcolor=YELLOW, activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=YELLOW, activecolor=RED,   disabledcolor=NOCOLOR},
			-- Play, Mute, Solo
			["Button 3-1"]={enabledcolor=WGREEN,   activecolor=GREEN,    disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=YELLOW,   activecolor=RED,    disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=WAMBER,   activecolor=GREEN,  disabledcolor=NOCOLOR},
			-- Select Drum
			["Button 6-1"]={enabledcolor=WGREEN, activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WGREEN, activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=WGREEN, activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=WGREEN, activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-3"]={enabledcolor=WGREEN, activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-4"]={enabledcolor=WGREEN, activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-1"]={enabledcolor=WGREEN, activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=WGREEN, activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=WGREEN, activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-4"]={enabledcolor=WGREEN, activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 5-4_6-4"]={enabledcolor=YELLOW, activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Fader 5"]={enabledcolor=WGREEN,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 6"]={enabledcolor=WGREEN,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
			["Knob V7"]={enabledcolor=WAMBER, activecolor=ORANGE,   disabledcolor=NOCOLOR},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
		},
		["Main"]={
			-- Sequence Step and toggle selected drum step
			["Button 1-1"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 1-2"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 1-3"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 1-4"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 1-5"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 1-6"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 1-7"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 1-8"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-1"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-5"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-6"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-7"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=WGREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			-- Drum Select
			["Button 3-1"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Button 4-1"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Button 5-1"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Button 5-2"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Button 5-3"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Button 5-4"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			-- Drum Play, Solo, Mute
			["Button 6-1"]={enabledcolor=WGREEN, activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WGREEN, activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=WGREEN, activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=WGREEN, activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-3"]={enabledcolor=WGREEN, activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-4"]={enabledcolor=WGREEN, activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 8-1"]={enabledcolor=WGREEN, activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=WGREEN, activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=WGREEN, activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 8-4"]={enabledcolor=WGREEN, activecolor=GREEN,   disabledcolor=NOCOLOR},
			-- Edit Steps, Accent
			["Button 3-5"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 3-6"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["UDVButton 5-8_6-8"]={enabledcolor=GREEN,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			-- Flam
			["UDHButton 7-5_7-6"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			-- Run
			["Button 3-8"]={enabledcolor=RED,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			-- Play, Solo, Mute
			["Button 8-6"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 8-7"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
		},
		["Performance"]={
			-- Pattern enable
			["Button 1-1"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Button 1-2"]={enabledcolor=WAMBER,    activecolor=AMBER,     disabledcolor=NOCOLOR},
			-- Resolution, Shuffle
			["UDVButton 7-1_8-1"]={enabledcolor=YELLOW,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["UDHButton 8-3_8-4"]={enabledcolor=GREEN,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 8-5"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			-- Pattern 1-4
			["Button 2-1"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			-- Pattern 5-8
			["Button 3-1"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			-- Bank A-D
			["Button 4-1"]={enabledcolor=WAMBER,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=WAMBER,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=WAMBER,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=WAMBER,    activecolor=RED,     disabledcolor=NOCOLOR},
		},
	},
	["Thor"]={
		["Default"]={
			["Button 1-1"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-1"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-1"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-1"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-1"]={enabledcolor=GREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-1"]={enabledcolor=GREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=GREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Main"]={
			["UDVButton 3-2_4-2"]={enabledcolor=YELLOW,     activecolor=YELLOW,   disabledcolor=YELLOW},
			["Button 6-2"]={enabledcolor=YELLOW,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Fader 2"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=40},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=GREEN, dactivecolor=GREEN, defaultvalue=40},
			["Button 8-4"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-5"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 7"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
		},
		["Osc 1"]={
			["Button 1-2"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=YELLOW},
			["Fader 2"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=40},
			["UDVButton 3-2_4-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=YELLOW},
			["UDVButton 5-2_6-2"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=YELLOW},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
		},
		["Osc 3"]={
			["Button 1-2"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=YELLOW},
			["Fader 2"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=40},
			["UDVButton 3-2_4-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=YELLOW},
			["UDVButton 5-2_6-2"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=YELLOW},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
		},
		["Osc 3"]={
			["Button 1-2"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=YELLOW},
			["Fader 2"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=40},
			["UDVButton 3-2_4-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=YELLOW},
			["UDVButton 5-2_6-2"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=YELLOW},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
		},
		["Filter 1"]={ -- Filter 1
			["Button 1-2"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=YELLOW},
			["Button 5-2"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=YELLOW},
			["UDVButton 3-2_4-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=YELLOW, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 7"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=64},
		},
		["Filter 2"]={ -- Filter 2
			["Button 1-2"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=YELLOW},
			["Button 5-2"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 3-2_4-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=YELLOW, inverted=true},
			["Button 8-2"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=YELLOW},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 7"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
		},
		["Filter 3"]={ -- Filter 3
			["Button 1-2"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=YELLOW},
			["UDVButton 3-2_4-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=YELLOW, inverted=true},
			["Button 8-2"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=YELLOW},
			["UDVButton 3-2_4-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=YELLOW, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 7"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
		},
		["Filter Env"]={ -- Filter Env
			["Button 2-2"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=YELLOW},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
		},
		["Amp"]={ -- Amp
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=100},
			["Knob V5"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR,},
		},
		["Amp Env"]={ -- Amp Env
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
		},
		["Mod Env"]={ -- Mod Env
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
		},
		["Global Env"]={ -- Global Env
			["Button 2-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 3-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Fader 2"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 7"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
		},
		["LFO 1"]={
                        ["UDVButton 3-1_4-1"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 6-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
                        ["Fader 3"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=40},
                        ["Fader 4"]={enabledcolor=WGREEN,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=20},
                        ["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=20},
		},
		["LFO 2"]={
                        ["UDVButton 3-1_4-1"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 6-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
                        ["Fader 3"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=40},
                        ["Fader 4"]={enabledcolor=WGREEN,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=20},
		},
		["Step Sequencer"]={
			-- Sequence Step
			["Button 3-1"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-5"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-6"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-1"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-5"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-6"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=GREEN,    activecolor=RED,     disabledcolor=NOCOLOR},
			-- Sequence select
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 5-2"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 5-3"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 5-4"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 5-5"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 5-6"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 6-1"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 6-3"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 6-4"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 6-5"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 6-6"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 6-7"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			-- Run
			["Button 7-1"]={enabledcolor=RED,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 2-1"]={enabledcolor=YELLOW,     activecolor=GREEN,   disabledcolor=NOCOLOR},
		},
		["Shaper"]={
			["Button 3-1"]={enabledcolor=YELLOW,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
                        ["UDVButton 5-1_6-1"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
                        ["Fader 2"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=20},
		},
		["Delay"]={
			["Button 3-1"]={enabledcolor=YELLOW,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 5-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
                        ["Fader 2"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=40},
                        ["Fader 3"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=40},
                        ["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=20},
                        ["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=20},
                        ["Fader 7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=AMBER, defaultvalue=40},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Chorus"]={
			["Button 3-1"]={enabledcolor=YELLOW,     activecolor=GREEN,   disabledcolor=NOCOLOR},
                        ["Fader 2"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=40},
                        ["Fader 3"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=40},
                        ["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=20},
                        ["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=20},
                        ["Fader 7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=AMBER, defaultvalue=40},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
	},
	["Combinator"]={
		["Default"]={
			-- Run
			["Button 5-1"]={enabledcolor=RED,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			-- Buttons
			["Button 8-1"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-4"]={enabledcolor=YELLOW,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-7"]={enabledcolor=RED,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
	},
	["DrOctoRex"]={
		["Default"]={
			-- Run
			["Button 5-7"]={enabledcolor=RED,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 8-1"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
		},
	},
	["RPG-8"]={
		["Default"]={
			-- Pattern Enable
			["Button 2-1"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			-- Pattern Length Up
			["Button 2-3"]={enabledcolor=GREEN,    activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=GREEN,    activecolor=GREEN,     disabledcolor=NOCOLOR},
			-- Pattern Step
			["Button 3-1"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-5"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-6"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-1"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-5"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-6"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			-- Toggles
			["Button 7-1"]={enabledcolor=GREEN,   activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=GREEN,   activecolor=GREEN,   disabledcolor=NOCOLOR},
			-- Base
			["Button 8-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-4"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-5"]={enabledcolor=GREEN,   activecolor=GREEN,   disabledcolor=NOCOLOR},
		},
	},
	["ID8"]={
		["Default"]={
			["Button 1-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=WGREEN,  activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=WGREEN,  activecolor=GREEN,   disabledcolor=NOCOLOR},
		},
	},
	["Malstrom"]={
		["Default"]={
			["Button 1-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Main"]={ -- Main
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=40},
			["Button 8-2"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Fader 7"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
		},
		["Osc A"]={
			["Fader 2"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Knob V4"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["UDVButton 7-5_8-5"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 7-6_8-6"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 7-7_8-7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
		},
		["Osc A Env"]={
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=80},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=127},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
		},
		["Osc B"]={
			["Fader 2"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Knob V4"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["UDVButton 7-5_8-5"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 7-6_8-6"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 7-7_8-7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
		},
		["Osc B Env"]={
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=80},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=127},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
		},
		["Filter A"]={
			["Button 8-4"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 8-5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 8-6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Fader 7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=RED, defaultvalue=0},
		},
		["Filter B"]={
			["Button 8-4"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 8-5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 8-6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Fader 7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=RED, defaultvalue=0},
		},
		["Filter Env"]={
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Button 8-7"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
		},
		["Mod A"]={
			["Button 8-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["UDVButton 3-1_4-1"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Fader 2"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Button 4-8"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 8-7"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
		},
		["Mod B"]={
			["Button 8-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["UDVButton 3-1_4-1"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Fader 2"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Button 4-8"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 8-7"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
		},
		["Shaper"]={
			["Button 8-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 4-1"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
		},
		["Velocity"]={
			["Button 8-8"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
		},
		["ModWheel"]={
			["Button 8-8"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
		},
	},
	["NN19"]={
		["Default"]={
			["Button 1-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
	},
	["NN-XT"]={
		["Default"]={
			["Fader 1"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
			["Knob V2"]={enabledcolor=WAMBER,      activecolor=YELLOW,      disabledcolor=NOCOLOR},
			["Knob V3"]={enabledcolor=WAMBER,      activecolor=YELLOW,      disabledcolor=NOCOLOR},
			["Knob V4"]={enabledcolor=WAMBER,      activecolor=ORANGE,      disabledcolor=NOCOLOR},
			["Knob V5"]={enabledcolor=WAMBER,      activecolor=ORANGE,    disabledcolor=NOCOLOR},
			["Knob V6"]={enabledcolor=WAMBER,      activecolor=ORANGE,    disabledcolor=NOCOLOR},
			["Knob V7"]={enabledcolor=WAMBER,      activecolor=YELLOW,    disabledcolor=NOCOLOR},
		},
	},
	["Subtractor"]={
		["Default"]={
			["Button 1-1"]={enabledcolor=AMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-1"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Main"]={
			["Button 1-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=80},
		},
		["Osc 1"]={
			["Button 5-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Knob V2"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR},
			["UDVButton 3-3_4-3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR},
			["UDVButton 3-4_4-4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["UDVButton 3-5_4-5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["UDVButton 3-6_4-6"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Button 6-3"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Knob V8"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR},
		},
		["Osc 2"]={
			["Button 5-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-1"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Knob V2"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR},
			["UDVButton 3-3_4-3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR},
			["UDVButton 3-4_4-4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["UDVButton 3-5_4-5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["UDVButton 3-6_4-6"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Button 6-3"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Knob V8"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR},
		},
		["Noise"]={
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=127},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=127},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=127},
		},
		["Filter"]={
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=RED,      disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=0},
			["UDVButton 5-4_6-4"]={enabledcolor=WAMBER,      activecolor=AMBER,      disabledcolor=NOCOLOR,inverted=true},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,      disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Button 8-6"]={enabledcolor=WAMBER,      activecolor=RED,      disabledcolor=NOCOLOR},
		},
		["Filter 2"]={
			["Button 8-1"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=RED,      disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=0},
		},
		["Filter Env"]={
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=GREEN,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=GREEN,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=GREEN,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
			["Button 8-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=AMBER,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
		},
		["Amp Env"]={
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=ORANGE,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=ORANGE,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=ORANGE,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=ORANGE,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=100},
		},
		["Mod Env"]={
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=YELLOW,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=YELLOW,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=AMBER,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=100},
			["UDVButton 5-7_6-7"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Button 8-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["LFO 1"]={
			["UDVButton 3-2_4-2"]={enabledcolor=AMBER,      activecolor=AMBER,    disabledcolor=NOCOLOR, inverted=true},
			["UDVButton 7-2_8-2"]={enabledcolor=AMBER,      activecolor=AMBER,    disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,    disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 4"]={enabledcolor=WGREEN,      activecolor=AMBER,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Button 8-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["LFO 2"]={
			["UDVButton 7-2_8-2"]={enabledcolor=AMBER,      activecolor=AMBER,    disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,    disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 4"]={enabledcolor=WGREEN,      activecolor=AMBER,    disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=AMBER, defaultvalue=0},
			["Fader 6"]={enabledcolor=WGREEN,      activecolor=YELLOW,    disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 7"]={enabledcolor=WGREEN,      activecolor=YELLOW,    disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
		},
		["ExtMod"]={
			["UDVButton 7-2_8-2"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
		},
	},
	["Matrix"]={
		["Default"]={
			-- Pattern Enable
			["Button 3-1"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			-- Pattern Length Up
			["Button 3-1"]={enabledcolor=YELLOW,    activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=YELLOW,    activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=YELLOW,    activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=YELLOW,    activecolor=GREEN,     disabledcolor=NOCOLOR},
			-- Pattern Step
			["Button 4-1"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-5"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-6"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=YELLOW,    activecolor=RED,     disabledcolor=NOCOLOR},
			-- Resolution
			["Button 7-1"]={enabledcolor=WGREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			-- Run
			["Button 8-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
	},
	["Revival"]={
		["Default"]={
			["Button 1-1"]={enabledcolor=AMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Drawbar 2"]={enabledcolor=NOCOLOR,      activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Drawbar 3"]={enabledcolor=NOCOLOR,      activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Drawbar 4"]={enabledcolor=NOCOLOR,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Drawbar 5"]={enabledcolor=NOCOLOR,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Drawbar 6"]={enabledcolor=NOCOLOR,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["Drawbar 7"]={enabledcolor=NOCOLOR,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Drawbar 8"]={enabledcolor=NOCOLOR,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["Button 1-8"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 5-2_6-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["UDVButton 7-2_8-2"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
		},
		["Index"]={
			["Button 1-5"]={enabledcolor=YELLOW,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-2"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-3"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=GREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=GREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=GREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-4"]={enabledcolor=GREEN,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-5"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-5"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-5"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-5"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-6"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-6"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-6"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-6"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-7"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=GREEN2,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Main"]={
			["Button 8-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["BigFader 8"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=511},
		},
		["Voicing 1"]={
			["Button 2-1"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR,inverted=true},
			["UDVButton 3-2_4-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR,inverted=true},
			["UDVButton 5-2_6-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR,inverted=true},
			["UDVButton 7-2_8-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR,inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
		},
		["Voicing 2"]={
			["Fader 1"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=ORANGE,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=0},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=ORANGE,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=0},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=ORANGE,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=0},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
		},
		["Pri/Sec"]={
			["Button 1-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 1-3_2-3"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR,inverted=true},
			["Knob V4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Button 1-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Solos"]={
			["Button 8-2"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 8-4"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 8-6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
		},
		["Attack"]={
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR,inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Button 1-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Primary"]={
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR,inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
		},
		["Secondary"]={
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR,inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
		},
		["Release"]={
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR,inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Button 1-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Attack Drawbars Upper"]={
			["Drawbar 2"]={enabledcolor=NOCOLOR,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["Drawbar 3"]={enabledcolor=NOCOLOR,      activecolor=WGREEN,     disabledcolor=NOCOLOR},
			["Drawbar 4"]={enabledcolor=NOCOLOR,      activecolor=GREEN,     disabledcolor=NOCOLOR},
		},
		["Primary Drawbars Upper"]={
			["Drawbar 2"]={enabledcolor=NOCOLOR,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["Drawbar 3"]={enabledcolor=NOCOLOR,      activecolor=WGREEN,     disabledcolor=NOCOLOR},
			["Drawbar 4"]={enabledcolor=NOCOLOR,      activecolor=GREEN,     disabledcolor=NOCOLOR},
		},
		["Secondary Drawbars Upper"]={
			["Drawbar 2"]={enabledcolor=NOCOLOR,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["Drawbar 3"]={enabledcolor=NOCOLOR,      activecolor=WGREEN,     disabledcolor=NOCOLOR},
			["Drawbar 4"]={enabledcolor=NOCOLOR,      activecolor=GREEN,     disabledcolor=NOCOLOR},
		},
		["Release Drawbars Upper"]={
			["Drawbar 2"]={enabledcolor=NOCOLOR,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["Drawbar 3"]={enabledcolor=NOCOLOR,      activecolor=WGREEN,     disabledcolor=NOCOLOR},
			["Drawbar 4"]={enabledcolor=NOCOLOR,      activecolor=GREEN,     disabledcolor=NOCOLOR},
		},
		["Attack Mod Enable"]={
			["Button 1-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Primary Mod Enable"]={
			["Button 1-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Secondary Mod Enable"]={
			["Button 1-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Release Mod Enable"]={
			["Button 1-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-5"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-6"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-3"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-4"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Attack Mod 1"]={
		},
		["Effects"]={
			["Button 8-4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Button 2-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["PreAmp"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Button 8-2"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
		},
		["Phaser"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
		},
		["ModFilter"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=0},
			["UDVButton 1-5_2-5"]={enabledcolor=GREEN,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 7-5_8-5"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["UDVButton 7-7_8-7"]={enabledcolor=GREEN,     activecolor=GREEN,   disabledcolor=NOCOLOR},
		},
		["Speaker"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Knob V4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Knob V7"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
		},
		["Reverb"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Knob V4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
		},
		["Delay"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=0},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
		},
	},
	["Antidote"]={
		["Default"]={
			["Button 1-1"]={enabledcolor=AMBER,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Main"},
			["Button 2-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Osc 1"},
			["Button 3-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Osc 2"},
			["Button 4-1"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Mixer"},
			["Button 5-1"]={enabledcolor=GREEN,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Filter"},
			["Button 1-8"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Main"]={
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Osc 1"]={
			["UDVButton 1-2_2-2"]={enabledcolor=YELLOW,      activecolor=AMBER,     disabledcolor=NOCOLOR, inverted=true},
			["UDVButton 3-2_4-2"]={enabledcolor=YELLOW,      activecolor=GREEN,     disabledcolor=NOCOLOR, inverted=true},
			["UDVButton 3-2_4-2"]={enabledcolor=YELLOW,      activecolor=YELLOW,     disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=127},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=127},
			["Knob V8"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW},
		},
		["Osc 2"]={
			["UDVButton 1-2_2-2"]={enabledcolor=YELLOW,      activecolor=AMBER,     disabledcolor=NOCOLOR, inverted=true},
			["UDVButton 3-2_4-2"]={enabledcolor=YELLOW,      activecolor=GREEN,     disabledcolor=NOCOLOR, inverted=true},
			["UDVButton 3-2_4-2"]={enabledcolor=YELLOW,      activecolor=YELLOW,     disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=127},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=127},
			["Knob V8"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW},
		},
		["Mixer"]={
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
		},
		["Filter"]={
			["UDVButton 1-2_2-2"]={enabledcolor=YELLOW,      activecolor=AMBER,     disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=100},
			["Fader 8"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
		},
		["Filter Env"]={
			["Fader 2"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 4"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 5"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
			["Fader 6"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=100},
		},
		["Effects"]={ --Effects
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
			["Button 2-7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 6-7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 7-7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 8-7"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 1-8"]={enabledcolor=RED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["EQ/Bass"]={ --EQBass
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 3-1_4-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 5-1_6-1"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=127},
			["Button 1-8"]={enabledcolor=RED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Dist"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 3-1_4-1"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["UDVButton 5-1_6-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=0},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=127},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=127},
			["Button 1-8"]={enabledcolor=RED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Phaser"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 3-1_4-1"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["UDVButton 5-1_6-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=127},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=GREEN, dactivecolor=AMBER, defaultvalue=63},
			["Button 1-8"]={enabledcolor=RED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Chorus"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=80},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=20},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=GREEN, dactivecolor=AMBER, defaultvalue=63},
			["Button 1-8"]={enabledcolor=RED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Delay"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 3-1_4-1"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
			["UDVButton 5-1_6-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["UDVButton 7-1_8-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=20},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=GREEN, dactivecolor=AMBER, defaultvalue=63},
			["Button 1-8"]={enabledcolor=RED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Reverb"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
                        ["UDVButton 3-1_4-1"]={enabledcolor=WAMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
                        ["UDVButton 5-1_6-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
                        ["UDVButton 7-1_8-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
                        ["Fader 2"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
                        ["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=127},
                        ["Fader 4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
                        ["Fader 5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=127},
                        ["Fader 6"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
                        ["Fader 7"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=GREEN, dactivecolor=AMBER, defaultvalue=63},
			["Button 1-8"]={enabledcolor=RED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Comp"]={
			["Button 1-1"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
                        ["UDVButton 3-1_4-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
                        ["Fader 2"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
                        ["Fader 4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
                        ["Fader 5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=80},
                        ["Fader 7"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=GREEN, dactivecolor=AMBER, defaultvalue=127},
			["Button 1-8"]={enabledcolor=RED,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["LFO 1"]={ -- LFO1
                        ["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
                        ["UDVButton 7-3_8-3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
                        ["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
			["Button 1-5"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 1-6"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
                        ["UDHButton 3-5_3-6"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
                        ["UDHButton 5-5_5-6"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=NOCOLOR},
		},
		["LFO 2"]={ -- LFO2
                        ["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
                        ["UDVButton 7-3_8-3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
                        ["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
			["Button 1-5"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Button 1-6"]={enabledcolor=WAMBER,     activecolor=GREEN,   disabledcolor=NOCOLOR},
                        ["UDHButton 3-5_3-6"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
                        ["UDHButton 5-5_5-6"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=NOCOLOR},
		},
		["Amp Env"]={
                        ["Fader 3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=0},
                        ["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
                        ["Fader 5"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=127},
                        ["Fader 6"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Mod Env"]={
                        ["UDVButton 3-1_4-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
                        ["Fader 3"]={enabledcolor=WGREEN,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
                        ["Fader 4"]={enabledcolor=WGREEN,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
                        ["Fader 5"]={enabledcolor=WGREEN,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=127},
                        ["Fader 5"]={enabledcolor=WGREEN,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=127},
                        ["Fader 8"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Arpeggiator"]={ -- Arp
                        ["UDHButton 3-1_3-2"]={enabledcolor=AMBER,     activecolor=AMBER,   disabledcolor=NOCOLOR},
                        ["UDHButton 5-1_5-2"]={enabledcolor=ORANGE,     activecolor=ORANGE,   disabledcolor=NOCOLOR},
                        ["UDHButton 6-1_6-2"]={enabledcolor=GREEN,     activecolor=GREEN,   disabledcolor=NOCOLOR},
                        ["UDHButton 7-1_7-2"]={enabledcolor=YELLOW,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
                        ["Button 8-1"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR},
		},
	},
	["PX7"]={
		["Default"]={
			["Button 1-1"]={enabledcolor=AMBER,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Main"},
			["Button 2-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto OP 6"},
			["Button 3-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto OP 5"},
			["Button 4-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto OP 4"},
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto OP 3"},
			["Button 6-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto OP 2"},
			["Button 7-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto OP 1"},
			["Button 8-2"]={enabledcolor=WAMBER,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 7-3_8-3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["UDVButton 7-4_8-4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["UDVButton 7-5_8-5"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
		},
		["Main"]={
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR},
			["Fader 3"]={enabledcolor=WAMBER,     activecolor=YELLOW,   disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=40},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=0},
		},
		["LFO"]={
			["Button 8-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=20},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["UDVButton 1-5_2-5"]={enabledcolor=AMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, inverted=true},
		},
	},
	["Parsec"]={
		["Default"]={
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=0},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=63},
		},
	},
	["Europa"]={
		["Default"]={
			["Button 1-1"]={enabledcolor=RED,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Main"},
			["Button 2-1"]={enabledcolor=AMBER,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Engine 1"},
			["Button 3-1"]={enabledcolor=AMBER,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Engine 2"},
			["Button 4-1"]={enabledcolor=AMBER,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Engine 3"},
			["Button 1-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Engine 3"},
			["UDVButton 1-3_2-3"]={enabledcolor=WAMBER,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 3-3_4-3"]={enabledcolor=WAMBER,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 5-3_6-3"]={enabledcolor=WAMBER,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["UDVButton 1-4_2-4"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR},
			["UDVButton 7-6_8-6"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
			["Button 2-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-7"]={enabledcolor=WAMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 1-8"]={enabledcolor=AMBER,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 2-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-8"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Main"]={
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=GREEN, defaultvalue=63},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WGREEN, dactivecolor=YELLOW, defaultvalue=80},
		},
		["Index"]={
			["Button 2-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 3-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 4-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 5-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-7"]={enabledcolor=ORANGE,     activecolor=RED,   disabledcolor=NOCOLOR},
		},
		["Mixer"]={
			["Fader 2"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Knob V3"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Knob V5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Knob V7"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
		},
		["Filter"]={
			["Button 5-1"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 6-1"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-1"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["UDVButton 1-2_2-2"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=63},
			["UDVButton 1-6_2-6"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["UDVButton 3-6_4-6"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["UDVButton 5-6_6-6"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR},
			["UDVButton 3-7_4-7"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
		},
		["Amp"]={
			["Knob V2"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=ORANGE,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=ORANGE,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=63},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=ORANGE,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=63},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=ORANGE,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=63},
		},
		["Eng 1"]={
			["UDVButton 1-4_2-4"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Eng 2"]={
			["UDVButton 1-4_2-4"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Eng 3"]={
			["UDVButton 1-4_2-4"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Eng 1 Mod 1"]={
			["UDVButton 1-3_2-3"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["UDVButton 7-6_8-6"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
		},
		["Eng 2 Mod 1"]={
			["UDVButton 1-3_2-3"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["UDVButton 7-6_8-6"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
		},
		["Eng 3 Mod 1"]={
			["UDVButton 1-3_2-3"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["UDVButton 7-6_8-6"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
		},
		["Eng 1 Mod 2"]={
			["UDVButton 1-3_2-3"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["UDVButton 7-6_8-6"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
		},
		["Eng 2 Mod 2"]={
			["UDVButton 1-3_2-3"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["UDVButton 7-6_8-6"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
		},
		["Eng 3 Mod 2"]={
			["UDVButton 1-3_2-3"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["UDVButton 7-6_8-6"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
		},
		["Eng 1 Harmonics"]={
			["UDVButton 1-3_2-3"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
		},
		["Eng 2 Harmonics"]={
			["UDVButton 1-3_2-3"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
		},
		["Eng 3 Harmonics"]={
			["UDVButton 1-3_2-3"]={enabledcolor=WAMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=AMBER,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=AMBER, defaultvalue=63},
		},
		["Eng 1 Spectral Filter"]={
			["UDVButton 3-2_4-2"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["UDVButton 7-7_8-7"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Eng 2 Spectral Filter"]={
			["UDVButton 3-2_4-2"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["UDVButton 7-7_8-7"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Eng 3 Spectral Filter"]={
			["UDVButton 3-2_4-2"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=RED,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=RED, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["UDVButton 7-7_8-7"]={enabledcolor=YELLOW,    activecolor=YELLOW,   disabledcolor=NOCOLOR, inverted=true},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Eng 1 Unison"]={
			["UDVButton 1-3_2-3"]={enabledcolor=ORANGE,    activecolor=ORANGE,   disabledcolor=NOCOLOR, inverted=true},
			["UDVButton 1-4_2-4"]={enabledcolor=ORANGE,    activecolor=ORANGE,   disabledcolor=NOCOLOR},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=ORANGE,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Eng 2 Unison"]={
			["UDVButton 1-3_2-3"]={enabledcolor=ORANGE,    activecolor=ORANGE,   disabledcolor=NOCOLOR, inverted=true},
			["UDVButton 1-4_2-4"]={enabledcolor=ORANGE,    activecolor=ORANGE,   disabledcolor=NOCOLOR},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=ORANGE,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Eng 3 Unison"]={
			["UDVButton 1-3_2-3"]={enabledcolor=ORANGE,    activecolor=ORANGE,   disabledcolor=NOCOLOR, inverted=true},
			["UDVButton 1-4_2-4"]={enabledcolor=ORANGE,    activecolor=ORANGE,   disabledcolor=NOCOLOR},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=ORANGE,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=ORANGE, defaultvalue=63},
			["Fader 5"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 6"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 7"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
			["Fader 8"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["LFO 1"]={
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto LFO 1"},
			["Button 6-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto LFO 2"},
			["Button 7-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto LFO 3"},
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["UDVButton 7-3_8-3"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["LFO 2"]={
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto LFO 1"},
			["Button 6-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto LFO 2"},
			["Button 7-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto LFO 3"},
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["UDVButton 7-3_8-3"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["LFO 3"]={
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto LFO 1"},
			["Button 6-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto LFO 2"},
			["Button 7-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto LFO 3"},
			["UDVButton 1-2_2-2"]={enabledcolor=AMBER,    activecolor=AMBER,   disabledcolor=NOCOLOR},
			["Button 6-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 7-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Button 8-2"]={enabledcolor=WAMBER,    activecolor=RED,   disabledcolor=NOCOLOR},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["UDVButton 7-3_8-3"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
			["Fader 4"]={enabledcolor=WAMBER,      activecolor=YELLOW,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=YELLOW, defaultvalue=63},
		},
		["Env 1"]={
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 1"},
			["Button 6-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 2"},
			["Button 7-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 3"},
			["Button 8-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 4"},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["UDVButton 7-4_8-4"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
		},
		["Env 2"]={
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 1"},
			["Button 6-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 2"},
			["Button 7-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 3"},
			["Button 8-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 4"},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["UDVButton 7-4_8-4"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
		},
		["Env 3"]={
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 1"},
			["Button 6-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 2"},
			["Button 7-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 3"},
			["Button 8-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 4"},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["UDVButton 7-4_8-4"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
		},
		["Env 4"]={
			["Button 5-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 1"},
			["Button 6-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 2"},
			["Button 7-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 3"},
			["Button 8-1"]={enabledcolor=YELLOW,    activecolor=RED,   disabledcolor=NOCOLOR, helptext="Goto Env 4"},
			["Fader 3"]={enabledcolor=WAMBER,      activecolor=GREEN,     disabledcolor=NOCOLOR, denabledcolor=WAMBER, dactivecolor=GREEN, defaultvalue=63},
			["UDVButton 7-4_8-4"]={enabledcolor=GREEN,    activecolor=GREEN,   disabledcolor=NOCOLOR},
		},
	},
}	

local items = {
	{name = "Keyboard", input = "keyboard"},
	{name = "DeviceScope", output = "text" },
	{name = "PatchName", output = "text" },
	{name = "PageName", output = "text" },
	{name = "PlayingStep", output = "text" },
	{name = "BarPosition", input= "button", output = "value", min = 0, max = 127},
	{name = "BeatPosition", input= "button", output = "value", min = 0, max = 127},
	{name = "EngineSelect", input= "value", output = "value", min = 0, max = 2},
	{name = "EffectSelect", input= "value", output = "value", min = 0, max = 5},
	{name = "LFOSelect", input= "value", output = "value", min = 0, max = 2},
	{name = "EnvSelect", input= "value", output = "value", min = 0, max = 3},
	{name = "Sel1_0", input= "button", output = "value", min = 0, max = 1},
	{name = "Sel1_1", input= "button", output = "value", min = 0, max = 1},
	{name = "Sel1_42", input= "button", output = "value", min = 0, max = 1},
	{name = "Sel1_85", input= "button", output = "value", min = 0, max = 1},
	{name = "Sel1_127", input= "button", output = "value", min = 0, max = 1},
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

function get_fader_bvmap(fadername)
	local fadertype = "Default"

	if(string.find(fadername, "BigFader %d")) then
		fadertype = "BigFader"
	end

	return(fader_bvmap[fadertype])
end

function get_item_conf_map(itemname, context, page)
	if(string.match(get_current_page(), "Internal")) then
		context = "Default"
	end
	
	if(item_conf_map[context] == nil) then
		context = "Default"
	end
	if(item_conf_map[context][page] == nil or item_conf_map[context][page][itemname] == nil) then
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
	-- Colors
	local activecolor = citem_conf_map.activecolor
	local enabledcolor = citem_conf_map.enabledcolor
	local disabledcolor = citem_conf_map.disabledcolor
	local dactivecolor = citem_conf_map.dactivecolor
	local denabledcolor = citem_conf_map.denabledcolor
	local maxcolor = citem_conf_map.maxcolor
	--Config
	local defaultvalue = citem_conf_map.defaultvalue

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
		elseif(g_scopetext == "Redrum" and string.match(get_current_page(), "Main") and (string.match(itemname, "Button 4%-7"))) then
			if(textvalue == 1) then
                       		color = YELLOW
			elseif(textvalue == 2) then
                       		color = AMBER
			elseif(textvalue == 3) then
                       		color = ORANGE
			else
                       		color = NOCOLOR
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
				buttonvalue = knobhbutton_to_value[buttonindex-1]
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
				buttonvalue = knobhbutton_to_value[buttonindex]
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
				buttonvalue = knobvbutton_to_value[buttonindex+1]
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
				buttonvalue = knobvbutton_to_value[buttonindex-1]
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
			buttonindex = tonumber(string.sub(buttonname, -3,-3))-1
			buttonvalue = drawbarbutton_to_value[buttonindex]
		elseif(string.find(itemname, "Meter %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))-1
			buttonvalue = meterbutton_to_value[buttonindex]
		elseif(string.find(itemname, "BigFader %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))-1
			buttonvalue = get_fader_bvmap(itemname)[buttonindex]
		elseif(string.find(itemname, "Fader %d")) then
			buttonindex = tonumber(string.sub(buttonname, -3,-3))-1
			buttonvalue = get_fader_bvmap(itemname)[buttonindex]
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
		table.insert(items, {name = buttonname, input = "button", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1"}})
		table.insert(inputs, {pattern=buttonmidi .. " ?<???x>", name=buttonname})
	end

	for row=1,8 do
		for column=1,8,2 do
			table.insert(items, {name = "UDHButton "..row.."-"..column.."_"..row.."-"..tostring(column+1), input = "delta", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1"}})
		end
	end

	for row=1,8,2 do
		for column=1,8 do
			table.insert(items, {name = "UDVButton "..row.."-"..column.."_"..tostring(row+1).."-"..column, input = "delta", output="value", min = 0, max = 127, modes={"NORMAL", "SEL1"}})
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
				end
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
					local msg = { time_stamp = event.time_stamp, item = itemsindex["Fader "..i], value = get_fader_bvmap("Fader "..i)[button.x] }
					remote.handle_input(msg)
					return true
				end
			end
		end
	
        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["BigFader "..i])) then
				button = remote.match_midi("90 x"..tostring(i-1).." 7f", event)
				if(button ~= nil) then
					local msg = { time_stamp = event.time_stamp, item = itemsindex["BigFader "..i], value = get_fader_bvmap("BigFader "..i)[button.x] }
					remote.handle_input(msg)
					return true
				end
			end
		end
	
        	for i=1,8 do
			if(remote.is_item_enabled(itemsindex["Drawbar "..i])) then
				button = remote.match_midi("90 x"..tostring(i-1).." 7f", event)
				if(button ~= nil) then
					local msg = { time_stamp = event.time_stamp, item = itemsindex["Drawbar "..i], value = drawbarbutton_to_value[button.x] }
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
					local value = knobhbutton_to_value[button.x+1]
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
					local value = knobvbutton_to_value[button.x+1]
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
				g_scrollcolor = AMBER
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

				if(itemname == "Button C8") then
					return true
				else
					g_scrolltext = "Value: "..tostring(remote.get_item_value(itemsindex[itemname]))
				end

				if(g_scrolltext == "") then
					g_scrolltext = "Value: Unknown"
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
