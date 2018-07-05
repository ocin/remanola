                ["Env *"]={
                        ["Fader 3"]={template="FFreq"},
                        ["UDVButton 7-4_8-4"]={template="UDFreq"},
{% if lptype == "pro" %}
{% include "devices/instrument/Shared/europa_grain/pro/confmap_bottommenu_mod.lua" %}
{% else %}
                        ["Button 5-1"]={template="BEnvPage", helptext="Goto Env 1"},
                        ["Button 6-1"]={template="BEnvPage", helptext="Goto Env 2"},
                        ["Button 7-1"]={template="BEnvPage", helptext="Goto Env 3"},
                        ["Button 8-1"]={template="BEnvPage", helptext="Goto Env 4"},
{% endif %}
                },
