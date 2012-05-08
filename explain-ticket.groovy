#!/usr/bin/groovy

def dataList = [:]
def theInfoName = "/home/mschober/.change_lists"

File theInfoFile = new File(theInfoName)

def words
def cls
def value

if (!theInfoFile.exists()) {
     println "File does not exist"

} else {

 theInfoFile.eachLine { line ->

 if (line.trim().size() == 0) {
  return null

 } else {

      words = line.split(", ")
      cls=words[0]
      dataList[cls]=value

      println "${cls[0]}=${cls[1]}"
  }

 }
}

