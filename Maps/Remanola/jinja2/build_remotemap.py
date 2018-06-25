#!/usr/bin/python

from jinja2 import Environment, FileSystemLoader
env = Environment(
    loader=FileSystemLoader('templates')
)

remotefilename = 'out/Launchpad-Mini.remotemap'

template = env.get_template('Launchpad-Mini.remotemap.j2')

remotefile = open(remotefilename, 'w')

remotefile.write(template.render(version='1.0.1'))
