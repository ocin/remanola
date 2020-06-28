g_scopetext = "none"
g_colorscheme = "Default"
g_scopetext_saved = ""
g_colorscheme_saved = ""
g_brightness = 4
g_brightness_new = 4
g_helpmode = false
g_valuemode = false
g_scrolltext = nil
g_scrollcolor_default = 13
g_scrollcolor = g_scrollcolor_default
g_scrolling = false
g_scrollspeed_default = 6
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
g_sel = {}
g_selcount = 4
g_select = {}
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
g_basekey = 2
g_kbdvel = 100
g_buttondown = {}
g_velofaderbuttons = {}
g_velofaderlastupdate = 0
g_repeatudbuttons = {}
g_repeatudlastupdate = 0
g_debugupdate = 0

g_updateditems = {}

local inputs = {}
local outputs = {}

local itemsindex = {}
local itemsmodeindex = {}

midi_to_button = {}

{% import "devicelist.j2" as d %}
{% for device in d.devices %}
{% include "devices/" + device.type + "/" + device.name + "/hooks/def_globals.lua" ignore missing %}
{% endfor %}
