#!/bin/bash

jadelet -d templates -r "require('jadelet')" | grep -v "\(no changes\)"