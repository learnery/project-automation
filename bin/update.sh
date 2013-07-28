#!/bin/bash
# takes the hash of the commit as parameter
# updates the Gemfiles (!) in all themes to depend on this
# call it with
# pull-all.sh
# update.sh `cd learnery; git rev-parse HEAD; cd ..`
# push-all.sh

REF=$1
for theme in default railsgirls webdev coderdojo ;  do
  cd learnery-$theme
  ruby -pi -e  "gsub(/(gem\s+['\"]learnery['\"]).*git.*/,\"gem 'learnery', :git => 'git://github.com/learnery/learnery.git', ref: '$REF'\")" Gemfile
  bundle update learnery
  # git add .
  # git commit -m "updated to learnery ref $REF"
  cd ..
done

