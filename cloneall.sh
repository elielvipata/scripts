#!/bin/bash

DIR = "$HOME/Programming"

if [ -z "$USERNAME" ]; then
    echo "Your git username is empty. Please create an environment variable (export USERNAME = [git username]) before running this script"
    exit 1  
fi

if [ -z "$TOKEN" ]; then
    echo "Your git personal access token is empty. Please create an environment variable (export TOKEN = [git token]) before running this script"
    exit 1  
fi

JEWEL="https://$USERNAME:$TOKEN@github.com/elielvipata/Jewel.git"
RESUME_FILTER="https://$USERNAME:$TOKEN@github.com/MedellaTechnologies/ResumeFilter.git"
CNN="https://$USERNAME:$TOKEN@github.com/elielvipata/simpleCNN.git"
REDUNDANCY="https://$USERNAME:$TOKEN@github.com/elielvipata/redundancyResearch.git"
BIBLE_TRANSLATOR="https://$USERNAME:$TOKEN@github.com/elielvipata/BibleTranslator.git"
XINU="https://$USERNAME:$TOKEN@github.com/elielvipata/xinuOS.git"
UX="https://$USERNAME:$TOKEN@github.com/MedellaTechnologies/unifi-ux.git"
UI="https://$USERNAME:$TOKEN@github.com/MedellaTechnologies/UI-ResumeFiltering.git"

git clone $JEWEL ../Jewel 
git clone $RESUME_FILTER ../ResumeFilter
git clone $CNN ../simepleCNN
git clone $REDUNDANCY ../redundancyResearch 
git clone $BIBLE_TRANSLATOR ../BibleTranslator 
git clone $XINU ../xinuOS 
git clone $UX ../unifi-ux 
git clone $UI ../UI-ResumeFiltering

