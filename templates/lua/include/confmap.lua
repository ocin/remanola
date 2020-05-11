local item_conf_map = {
{% include "lua/include/confmap_default.lua" %}
{% import "devices.j2" as d %}
{% for device in d.devices %}
{% include "devices/" + device.type + "/" + device.name + "/confmap_" + device.name + ".lua" %}
{% endfor -%}
}
