#!/usr/bin/env python
#http://docs.python.org/library/optparse.html

from sys import argv
import os
from create import Create
from destroy import Destroy
from optparse import OptionParser

parser = OptionParser()
parser.add_option('-c', '--create', dest='create_action', help="create a new app")
parser.add_option('-d', '--destroy', dest='destroy_action', help="destroy an existing app")
(options, args) = parser.parse_args(argv)

if options.create_action:
    app_name = options.create_action
    Create(app_name)
elif options.destroy_action:
    app_name = options.destroy_action
    Destroy(app_name)
else: 
    parser.print_help()
