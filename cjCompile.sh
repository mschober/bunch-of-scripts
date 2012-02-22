#!/bin/bash
mvn clean install -Dmaven.test.skip=true -Ddelta.skip=true -Dcleanup.skip=true -Dadd.folders=common-test,rest-specifications
notify-send "Build Done"
