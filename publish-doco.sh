#!/bin/bash

git clone https://github.com/betfair/gh-pages-publishing.git
cd gh-pages-publishing
./publish.sh $REPO_SLUG master eswdd
