#!/usr/bin/python

from jinja2 import Environment, FileSystemLoader
env = Environment(
    loader=FileSystemLoader('Maps/Remanola/templates')
)

remotefilename = '/tmp/remanola-out/Launchpad-Mini.remotemap'

template = env.get_template('Launchpad-Mini.remotemap.j2')

remotefile = open(remotefilename, 'w')

remotefile.write(template.render(version='1.0.1'))

remotefilename = '/tmp/remanola-out/Launchpad-Pro.remotemap'

template = env.get_template('Launchpad-Pro.remotemap.j2')

remotefile = open(remotefilename, 'w')

remotefile.write(template.render(version='1.0.1'))
