#!/usr/bin/python

from jinja2 import Environment, FileSystemLoader
env = Environment(
    loader=FileSystemLoader('templates/')
)

#env.lstrip_blocks = True
#env.trim_blocks = True

remotefilename = '/tmp/remanola-out/Launchpad-Mini.lua'

template = env.get_template('lua/Launchpad-Mini.lua.j2')

remotefile = open(remotefilename, 'w')

remotefile.write(template.render(version='1.0.1'))

remotefilename = '/tmp/remanola-out/Launchpad-Pro.lua'

template = env.get_template('lua/Launchpad-Pro.lua.j2')

remotefile = open(remotefilename, 'w')

remotefile.write(template.render(version='1.0.0'))
