#!/bin/bash

#git clone https://github.com/betfair/gh-pages-publishing.git
#cd gh-pages-publishing
bash -x ./publish.sh $TRAVIS_REPO_SLUG $TRAVIS_BRANCH $PUBLISH_USERNAME
