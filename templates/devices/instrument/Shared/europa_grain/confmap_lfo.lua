                ["LFO *"]={
                        ["Button 5-1"]={template="BLFOPage", helptext="Goto LFO 1"},
                        ["Button 6-1"]={template="BLFOPage", helptext="Goto LFO 2"},
                        ["Button 7-1"]={template="BLFOPage", helptext="Goto LFO 3"},
                        ["UDVButton 1-2_2-2"]={template="UDMisc"},
                        ["Button 6-2"]={template="BRedOnOff"},
                        ["Button 7-2"]={template="BRedOnOff"},
                        ["Button 8-2"]={template="BRedOnOff"},
                        ["Fader 3"]={template="FFreq"},
                        ["UDVButton 7-3_8-3"]={template="UDFreq"},
                        ["Fader 4"]={template="FEffect"},
{% if lptype == "pro" %}
{% include "devices/instrument/Shared/europa_grain/pro/confmap_submenu_mod.lua" %}
{% endif %}
                },
