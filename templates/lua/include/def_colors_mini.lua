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

-- Short name color style
S_RED=RED
S_WRED=WRED
S_YELLOW=YELLOW
S_WYELLOW=YELLOW1
S_NOCOLOR=0

{% import "devicelist.j2" as d %}
{% for device in d.devices %}
{% include "devices/" + device.type + "/" + device.name + "/hooks/def_colors_mini.lua" ignore missing %}
{% endfor %}

