#!/bin/bash
# takes the hash of the commit as parameter
# updates the Gemfiles (!) in all themes to depend on this
# call it with
# pull-all.sh
# update-learnery.sh
# push-all.sh

REF_L=`cd learnery; git rev-parse HEAD; cd ..`
echo "updating learnery to REF ${REF_L:0:7}"

for theme in default railsgirls webdev coderdojo ;  do
  cd learnery-$theme
  ruby -pi -e  "gsub(/(gem\s+['\"]learnery['\"]).*git.*/,\"gem 'learnery', :git => 'git://github.com/learnery/learnery.git', ref: '$REF_L'\")" Gemfile
  bundle update learnery learnerydeploy
  git add .
  git commit -m "updated to learnery/learnery@${REF_L:0:7}"
  cd ..
done
