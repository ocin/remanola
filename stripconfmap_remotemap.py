#!/usr/bin/env python

import re

def stripconfmap(infile, strippedfile):
	i = open(infile, 'r')
	s = open(strippedfile, 'w')

	lines = i.readlines()	

	for line in lines:
		line = re.sub(r"\t// template.*", "", line)
		s.write(line)

stripconfmap("/tmp/remanola-out/Launchpad-Mini-withconfmap.remotemap", "/tmp/remanola-out/Launchpad-Mini.remotemap")
stripconfmap("/tmp/remanola-out/Launchpad-Pro-withconfmap.remotemap", "/tmp/remanola-out/Launchpad-Pro.remotemap")
