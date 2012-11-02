#!/usr/bin/env python
import os

class Create():
    def __init__(self, app_name):
        self.create(app_name)
        self.package(app_name)

    def create(self, app_name):
        print "Creating app structure"
        self.create_directories(app_name)
        os.system("tree %r" % app_name)

    def package(self, app_name):
        print "Making into packages"
        self.to_packages(app_name)
        os.system("tree %r" % app_name)

    def create_directories(self, app_name):
        if not os.path.exists(app_name + "/src"):
            os.makedirs(app_name + "/src")

        if not os.path.exists(app_name + "/test"):
            os.makedirs(app_name + "/test")

    def to_packages(self, app_name):
        open(app_name + "/src/" + "__init__.py", 'w')
        open(app_name + "/test/" + "__init__.py", 'w')
