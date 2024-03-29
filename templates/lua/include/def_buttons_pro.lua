local buttons = {
	["Button 1-1"]="90 51",
	["Button 1-2"]="90 52",
	["Button 1-3"]="90 53",
	["Button 1-4"]="90 54",
	["Button 1-5"]="90 55",
	["Button 1-6"]="90 56",
	["Button 1-7"]="90 57",
	["Button 1-8"]="90 58",

	["Button 2-1"]="90 47",
	["Button 2-2"]="90 48",
	["Button 2-3"]="90 49",
	["Button 2-4"]="90 4a",
	["Button 2-5"]="90 4b",
	["Button 2-6"]="90 4c",
	["Button 2-7"]="90 4d",
	["Button 2-8"]="90 4e",

	["Button 3-1"]="90 3d",
	["Button 3-2"]="90 3e",
	["Button 3-3"]="90 3f",
	["Button 3-4"]="90 40",
	["Button 3-5"]="90 41",
	["Button 3-6"]="90 42",
	["Button 3-7"]="90 43",
	["Button 3-8"]="90 44",

	["Button 4-1"]="90 33",
	["Button 4-2"]="90 34",
	["Button 4-3"]="90 35",
	["Button 4-4"]="90 36",
	["Button 4-5"]="90 37",
	["Button 4-6"]="90 38",
	["Button 4-7"]="90 39",
	["Button 4-8"]="90 3a",

	["Button 5-1"]="90 29",
	["Button 5-2"]="90 2a",
	["Button 5-3"]="90 2b",
	["Button 5-4"]="90 2c",
	["Button 5-5"]="90 2d",
	["Button 5-6"]="90 2e",
	["Button 5-7"]="90 2f",
	["Button 5-8"]="90 30",

	["Button 6-1"]="90 1f",
	["Button 6-2"]="90 20",
	["Button 6-3"]="90 21",
	["Button 6-4"]="90 22",
	["Button 6-5"]="90 23",
	["Button 6-6"]="90 24",
	["Button 6-7"]="90 25",
	["Button 6-8"]="90 26",

	["Button 7-1"]="90 15",
	["Button 7-2"]="90 16",
	["Button 7-3"]="90 17",
	["Button 7-4"]="90 18",
	["Button 7-5"]="90 19",
	["Button 7-6"]="90 1a",
	["Button 7-7"]="90 1b",
	["Button 7-8"]="90 1c",

	["Button 8-1"]="90 0b",
	["Button 8-2"]="90 0c",
	["Button 8-3"]="90 0d",
	["Button 8-4"]="90 0e",
	["Button 8-5"]="90 0f",
	["Button 8-6"]="90 10",
	["Button 8-7"]="90 11",
	["Button 8-8"]="90 12",

	-- Bottom
	["Button A0"]="b0 00", -- Hidden
	["Button A1"]="b0 01",
	["Button A2"]="b0 02",
	["Button A3"]="b0 03",
	["Button A4"]="b0 04",
	["Button A5"]="b0 05",
	["Button A6"]="b0 06",
	["Button A7"]="b0 07",
	["Button A8"]="b0 08",
	["Button A9"]="b0 09", -- Hidden

	-- Left
	["Button B1"]="b0 50",
	["Button B2"]="b0 46",
	["Button B3"]="b0 3c",
	["Button B4"]="b0 32",
	["Button B5"]="b0 28",
	["Button B6"]="b0 1e",
	["Button B7"]="b0 14",
	["Button B8"]="b0 0a",

	-- Top
	["Button C0"]="b0 5a", -- Hidden
	["Button C1"]="b0 5b",
	["Button C2"]="b0 5c",
	["Button C3"]="b0 5d",
	["Button C4"]="b0 5e",
	["Button C5"]="b0 5f",
	["Button C6"]="b0 60",
	["Button C7"]="b0 61",
	["Button C8"]="b0 62",
	["Button C9"]="b0 63", -- Hidden

	-- Right
	["Button D1"]="b0 59",
	["Button D2"]="b0 4f",
	["Button D3"]="b0 45",
	["Button D4"]="b0 3b",
	["Button D5"]="b0 31",
	["Button D6"]="b0 27",
	["Button D7"]="b0 1d",
	["Button D8"]="b0 13",
}

local efsactive = {
	[1] = WHITE,
	[2] = GREEN,
	[3] = RED,
}

local efsinactive = {
	[1] = DGREY,
	[2] = DGREEN,
	[3] = DRED,
}