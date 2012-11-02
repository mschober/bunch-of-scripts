#!/usr/bin/env python
import os

from shutil import rmtree
class Destroy():
    def __init__(self, app_name):
        self.destroy_directories(app_name)

    def destroy_directories(self, app_name):
        if os.path.exists(app_name):
            print "Deleting app structure '%s'" % app_name
            rmtree(app_name)
        else:
            print "No app named '%s'" % app_name
