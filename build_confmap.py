#!/usr/bin/python

import re

def buildconfmap(infile, confmapfile):
	i = open(infile, 'r')
	c = open(confmapfile, 'w')

	device = "Unknown"
	deviceprinted = False
	page = "Unknown"
	pageprinted = False
	genhelptext = False

	lines = i.readlines()	

	for line in lines:
		m = re.search('Map\tDeviceScope\t\t"([^"]+)"', line)
		if m:
			if page is not 'Unknown' and pageprinted:
				c.write('\t\t},\n')
			if device is not 'Unknown' and deviceprinted:
				c.write('\t},\n')
			device = m.group(1)
			page = "Unknown"
			deviceprinted = False
			pageprinted = False
			genhelptext = False
			continue

		m = re.search('Map\tPageName\t\t"([^"]+)"', line)
		if not m:
			m = re.search('// confmap: Map.*PageName.*"(Default)"', line)
		if m:
			if page is not 'Unknown' and pageprinted:
				c.write('\t\t},\n')
			page = m.group(1)
			pageprinted = False
			if page == 'Default':
				if not deviceprinted:
					c.write('\t["' + device + '"]={\n')
					deviceprinted = True
				c.write('\t\t["' + page + '"]={\n')
				pageprinted = True
			continue

		m = re.search('// confmap: genhelptext', line)
		if m:
			genhelptext = True
			continue

		m = re.search('Map\t([^\t]+)\t\tPage=([^\t]+).*\n', line)
		if m and genhelptext:
			item = m.group(1)
			gotopage = m.group(2)
			if not deviceprinted:
				c.write('\t["' + device + '"]={\n')
				deviceprinted = True
			if not pageprinted:
				c.write('\t\t["' + page + '"]={\n')
				pageprinted = True
			c.write('\t\t\t["' + item + '"]={helptext="Goto ' + gotopage + '"},\n')
			continue

		m = re.search('Map\t([^\t]+)\t.*// (.*)', line)
		if not m:
			m = re.search('// confmap: Map\t([^\t]+)\t(.*)', line)
		if m:
			item = m.group(1)
			confmap = m.group(2)
			if not deviceprinted:
				c.write('\t["' + device + '"]={\n')
				deviceprinted = True
			if not pageprinted:
				c.write('\t\t["' + page + '"]={\n')
				pageprinted = True
			c.write('\t\t\t["' + item + '"]={' + confmap + '},\n')
			continue

buildconfmap("/tmp/remanola-out/Launchpad-Pro-withconfmap.remotemap", "templates/tmp/confmap_generated.lua")
