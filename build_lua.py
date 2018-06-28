#!/usr/bin/python

from jinja2 import Environment, FileSystemLoader
env = Environment(
    loader=FileSystemLoader('Codecs/Lua Codecs/Remanola/templates')
)

remotefilename = '/tmp/remanola-out/Launchpad-Mini.lua'

template = env.get_template('Launchpad-Mini.lua.j2')

remotefile = open(remotefilename, 'w')

remotefile.write(template.render(version='1.0.1'))
