#!/bin/bash

#git clone https://github.com/betfair/gh-pages-publishing.git
#cd gh-pages-publishing

# NOTE: Never run this -x otherwise it will expose our github password, which is bad!
./publish.sh cougar $TRAVIS_BRANCH
