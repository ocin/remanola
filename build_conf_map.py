#!/usr/bin/python

import re

f = open ("Maps/Remanola/jinja2/templates/instrument/thor.j2", 'r')

itemconf = {}

pageprinted = False
subpageprinted = False

page = None
subpage = None

for line in f:
	m = re.search("devicename=\"([^\"]+)\"",line)
	if(m):
		devicename = m.group(1)
		print('\t["%s"]={' % devicename)
	if re.match("^Map",line):
		l = re.split(r"\t",line, maxsplit=4)
		cmd = l[0]
		item = l[1]
		note = l[2]
		remoteable = l[3]
		tail = None
		if(len(l) > 4):
			tail = l[4]
			if(item == "PageName"):
				if(subpage and subpageprinted):
					print('\t\t\t},')
				if(page and pageprinted):
					print('\t\t},')
				m = re.search("\"([^\"]+)\"", remoteable)
				page = re.sub("{{[^}]+}}", "*", m.group(1))
				subpage = None
				pageprinted = False
			if(item == "SubPageName"):
				if(subpage and subpageprinted):
					print('\t\t\t},')
				m = re.search("\"([^\"]+)\"", remoteable)
				subpage = re.sub("{{[^}]+}}", "*", m.group(1))
				subpageprinted = False
			m = re.search("#- ic: ([^#]+) #", tail)
			if(m):
				c = m.group(1)
				if(not pageprinted):
					pageprinted = True
					print('\t\t["%s"]={' % page)
				if(subpage):
					if(not subpageprinted):
						print('\t\t\t["%s"]={' % subpage)
						subpageprinted = True
					indent = '\t\t\t\t'
				else:
					indent = '\t\t\t'
				print('%s["%s"]={%s},' % (indent,item,c))
print('\t},')
