#!/usr/bin/python

import re

def buildconfmap(infile, confmapfile):
	i = open(infile, 'r')
	c = open(confmapfile, 'w')

	device = "Unknown"
	deviceprinted = False
	page = "Unknown"
	subpage = "Unknown"
	pageprinted = False
	genhelptext = False

	lines = i.readlines()	

	for line in lines:
		m = re.search('Map\tDeviceScope\t\t"([^"]+)"', line)
		if m:
			if subpage is not 'Unknown' and subpageprinted:
				c.write('\t\t\t},\n')
				subpage = "Unknown"
			if page is not 'Unknown' and pageprinted:
				c.write('\t\t},\n')
			if device is not 'Unknown' and deviceprinted:
				c.write('\t},\n')
			device = m.group(1)
			page = "Unknown"
			subpage = "Unknown"
			deviceprinted = False
			pageprinted = False
			subpageprinted = False
			genhelptext = False
			continue

		m = re.search('Map\tPageName\t\t"([^"]+)"', line)
		if not m:
			m = re.search('// confmap: Map.*PageName.*"(Default)"', line)
		if m:
			if page is not 'Unknown' and pageprinted:
				if subpage is not 'Unknown' and subpageprinted:
					c.write('\t\t\t},\n')
					subpageprinted = False
				c.write('\t\t},\n')
			page = m.group(1)
			subpage = "Unknown"
			pageprinted = False
			if page == 'Default':
				if not deviceprinted:
					c.write('\t["' + device + '"]={\n')
					deviceprinted = True
				c.write('\t\t["' + page + '"]={\n')
				pageprinted = True
			continue

		m = re.search('Map\tSubPageName\t\t"([^"]+)"', line)
		if m:
			if subpage is not 'Unknown' and subpageprinted:
				c.write('\t\t\t},\n')
			subpage = m.group(1)
			subpageprinted = False
			continue

		m = re.search('// End SubPage', line)
		if m:
			if subpage is not 'Unknown' and subpageprinted:
				c.write('\t\t\t},\n')
			subpageprinted = False
			subpage = 'Unknown'
			continue

		m = re.search('Map\t([^\t]+)\t.*// (.*)', line)
		hm = re.search('Map\t([^\t]+)\t\tPage=([^\t]+).*\n', line)
		if not m:
			m = re.search('// confmap: Map\t([^\t]+)\t(.*)', line)
		if m or hm:
			confmap = None
			item = None
			gotopage = None
			if m:
				item = m.group(1)
				confmap = m.group(2)
			if hm:
				item = hm.group(1)
				gotopage = hm.group(2)
			if hm and not item:
				item = hm.group(1)
			if not deviceprinted:
				c.write('\t["' + device + '"]={\n')
				deviceprinted = True
			if page is not 'Unknown' and not pageprinted:
				c.write('\t\t["' + page + '"]={\n')
				pageprinted = True
			if subpage is not 'Unknown' and not subpageprinted:
				c.write('\t\t\t["' + subpage + '"]={\n')
				subpageprinted = True
			if subpage is not 'Unknown':
				c.write('\t')
			if page is not 'Unknown':
				outstr = '\t\t\t["' + item + '"]={'
				if confmap:
					outstr = outstr + confmap
				if gotopage:
					if confmap:
						outstr = outstr + ', '
					outstr = outstr + 'helptext="Goto ' + gotopage + '"'
				outstr = outstr + '},\n'
				c.write(outstr)
			continue

	if subpage is not 'Unknown' and subpageprinted:
		c.write('\t\t\t},\n')
	if page is not 'Unknown' and pageprinted:
		c.write('\t\t},\n')
	if device is not 'Unknown' and deviceprinted:
		c.write('\t},\n')

buildconfmap("/tmp/remanola-out/Launchpad-Pro-withconfmap.remotemap", "templates/tmp/confmap_generated.lua")
