#!/usr/bin/env python

from jinja2 import Environment, FileSystemLoader
env = Environment(
    loader=FileSystemLoader('templates/')
)

env.lstrip_blocks = True
env.trim_blocks = True
env.keep_trailing_newline = True

remotefilename = '/tmp/remanola-out/Launchpad-Mini-withconfmap.remotemap'

template = env.get_template('remotemap/Launchpad-Mini.remotemap')

remotefile = open(remotefilename, 'w')

remotefile.write(template.render(version='1.0.1'))

remotefilename = '/tmp/remanola-out/Launchpad-Pro-withconfmap.remotemap'

template = env.get_template('remotemap/Launchpad-Pro.remotemap')

remotefile = open(remotefilename, 'w')

remotefile.write(template.render(version='1.0.1'))
