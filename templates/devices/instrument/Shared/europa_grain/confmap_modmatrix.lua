                ["Mod Matrix *"]={
                        ["UDVButton 1-2_2-2"]={template="UDAmount", inverted=true},
                        ["Knob V3"]={template="FAmount"},
                        ["UDVButton 1-4_2-4"]={template="UDEffect", inverted=true},
                        ["Knob V5"]={template="FEffect"},
                        ["UDVButton 1-6_2-6"]={template="UDEffect", inverted=true},
                        ["Knob V7"]={template="FEffect"},
                        ["UDVButton 1-8_2-8"]={template="UDMisc", inverted=true},
{% if lptype == "pro" %}
{% include "devices/instrument/Shared/europa_grain/pro/confmap_submenu_perf.lua" %}
{% else %}
                        ["Button 1-1"]={template="BPerformancePage"},
                        ["Button 2-1"]={template="BPerformancePage"},
                        ["Button 3-1"]={template="BPerformancePage"},
                        ["Button 4-1"]={template="BPerformancePage"},
                        ["Button 5-1"]={template="BPerformancePage"},
                        ["Button 6-1"]={template="BPerformancePage"},
                        ["Button 7-1"]={template="BPerformancePage"},
                        ["Button 8-1"]={template="BPerformancePage"},
{% endif %}
                },
