#!/bin/bash
cd /usr/share/jenkins/
ls -l
java -Dhudson.model.DirectoryBrowserSupport.CSP="sandbox allow-scripts; default-src 'self'; style-src 'self' 'unsafe-inline';" -jar jenkins.war
