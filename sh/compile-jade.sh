#!/bin/bash

jadelet -d src/templates -r "require('jadelet')" | grep -v "\(no changes\)"