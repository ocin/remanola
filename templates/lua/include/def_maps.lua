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
	["MFader"]={
		[1]=127,
		[2]=63,
		[3]=127,
		[4]=63,
		[5]=127,
		[6]=63,
		[7]=127,
		[8]=63,
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
	["MeterPeak"]={
		[1]=127,
		[2]=111,
		[3]=95,
		[4]=79,
		[5]=47,
		[6]=31,
		[7]=15,
		[8]=0,
	},
}

button_to_padnote={
        ["Button 8-1"]=36,
        ["Button 8-2"]=37,
        ["Button 8-3"]=38,
        ["Button 8-4"]=39,
        ["Button 7-1"]=40,
        ["Button 7-2"]=41,
        ["Button 7-3"]=42,
        ["Button 7-4"]=43,
        ["Button 6-1"]=44,
        ["Button 6-2"]=45,
        ["Button 6-3"]=46,
        ["Button 6-4"]=47,
        ["Button 5-1"]=48,
        ["Button 5-2"]=49,
        ["Button 5-3"]=50,
        ["Button 5-4"]=51,
}

button_to_fullpadnote={
	-- DL
        ["Button 8-1"]=36,
        ["Button 8-2"]=37,
        ["Button 8-3"]=38,
        ["Button 8-4"]=39,
        ["Button 7-1"]=40,
        ["Button 7-2"]=41,
        ["Button 7-3"]=42,
        ["Button 7-4"]=43,
        ["Button 6-1"]=44,
        ["Button 6-2"]=45,
        ["Button 6-3"]=46,
        ["Button 6-4"]=47,
        ["Button 5-1"]=48,
        ["Button 5-2"]=49,
        ["Button 5-3"]=50,
        ["Button 5-4"]=51,
	-- UL
        ["button 4-1"]=52,
        ["button 4-2"]=53,
        ["button 4-3"]=54,
        ["button 4-4"]=55,
        ["button 3-1"]=56,
        ["button 3-2"]=57,
        ["button 3-3"]=58,
        ["button 3-4"]=59,
        ["button 2-1"]=60,
        ["button 2-2"]=61,
        ["button 2-3"]=62,
        ["button 2-4"]=63,
        ["button 1-1"]=64,
        ["button 1-2"]=65,
        ["button 1-3"]=66,
        ["button 1-4"]=67,
	-- DR
        ["Button 8-5"]=68,
        ["Button 8-6"]=69,
        ["Button 8-7"]=70,
        ["Button 8-8"]=71,
        ["Button 7-5"]=72,
        ["Button 7-6"]=73,
        ["Button 7-7"]=74,
        ["Button 7-8"]=75,
        ["Button 6-5"]=76,
        ["Button 6-6"]=77,
        ["Button 6-7"]=78,
        ["Button 6-8"]=79,
        ["Button 5-5"]=80,
        ["Button 5-6"]=81,
        ["Button 5-7"]=82,
        ["Button 5-8"]=83,
	-- UR
        ["Button 4-5"]=84,
        ["Button 4-6"]=85,
        ["Button 4-7"]=86,
        ["Button 4-8"]=87,
        ["Button 3-5"]=88,
        ["Button 3-6"]=89,
        ["Button 3-7"]=90,
        ["Button 3-8"]=91,
        ["Button 2-5"]=92,
        ["Button 2-6"]=93,
        ["Button 2-7"]=94,
        ["Button 2-8"]=95,
        ["Button 1-5"]=96,
        ["Button 1-6"]=97,
        ["Button 1-7"]=98,
        ["Button 1-8"]=99,
}

button_to_keynote={
	-- C0
	["Button 8-2"]=24,
       	["Button 7-2"]=25,
	["Button 8-3"]=26,
       	["Button 7-3"]=27,
      	["Button 8-4"]=28,
       	["Button 8-5"]=29,
       	["Button 7-5"]=30,
       	["Button 8-6"]=31,
       	["Button 7-6"]=32,
       	["Button 8-7"]=33,
       	["Button 7-7"]=34,
       	["Button 8-8"]=35,
	-- C1
	["Button 6-2"]=36,
       	["Button 5-2"]=37,
	["Button 6-3"]=38,
       	["Button 5-3"]=39,
      	["Button 6-4"]=40,
       	["Button 6-5"]=41,
       	["Button 5-5"]=42,
       	["Button 6-6"]=43,
       	["Button 5-6"]=44,
       	["Button 6-7"]=45,
       	["Button 5-7"]=46,
       	["Button 6-8"]=47,
	-- C2
	["Button 4-2"]=48,
       	["Button 3-2"]=49,
	["Button 4-3"]=50,
       	["Button 3-3"]=51,
      	["Button 4-4"]=52,
       	["Button 4-5"]=53,
       	["Button 3-5"]=54,
       	["Button 4-6"]=55,
       	["Button 3-6"]=56,
       	["Button 4-7"]=57,
       	["Button 3-7"]=58,
       	["Button 4-8"]=59,
}

