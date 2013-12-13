#!/bin/bash

TMP_DIR=/tmp/publish_$$
mkdir -p $TMP_DIR
cd $TMP_DIR

REPO=$1
VERSION=$2
USER=$3

if [ -z "$USER" ]; then
  echo "Usage: publish.sh <repo> <version> <gh-user>"
  exit 1
fi

echo "Repository: $REPO"
echo "Version: $VERSION"

echo "Cloning git repos"
git clone -b gh-pages https://$USER@github.com/$REPO.git gh-pages
git clone -b $VERSION https://$USER@github.com/$REPO.git source
git clone -b $VERSION https://$USER@github.com/$REPO-documentation.git doco-source

if [ $VERSION == "master" ]; then
  echo "Need to parse pom.xml"
#  exit 1
fi

# todo: removing old master content? Manual for now
if [ -d gh-pages/$VERSION ]; then
  echo "Cleaning out old site content for branch $VERSION"
  cd gh-pages
  git rm -rf $VERSION
  cd ..
fi

PAGES_DIR=gh-pages/$VERSION
if [ $VERSION == "master" ]; then
  PAGES_DIR=gh-pages
fi

echo "Generating maven site"
mkdir -p $PAGES_DIR/maven
cd source
mvn site:site site:deploy -Dsite.deploy.dir=$TMP_DIR/$PAGES_DIR/maven
cd ..

echo "Copying maven site into place"
find doco-source -type d -name ".git" -exec rm -rf {} \;
cp -R doco-source/* $PAGES_DIR

echo "Telling git about our changes"
cd gh-pages
if [ $VERSION == "master" ]; then
  find . -exec git add {} \;
else
  find $VERSION -exec git add {} \;
fi
cd ..

echo "Pushing to live"
cd gh-pages
git commit -a -m "Pushing latest site updates"
git push origin gh-pages
cd ..

echo "Cleanup.."
rm -rf $TMP_DIR
