#!/bin/bash
# takes the hash of the commit as parameter
# updates the Gemfiles (!) in all themes to depend on this
# call it with
# pull-all.sh
# update-all.sh
# push-all.sh

REF_D=`cd deployment; git rev-parse HEAD; cd ..`
echo "updating deployment to REF ${REF_D:0:7}"
REF_L=`cd learnery; git rev-parse HEAD; cd ..`
echo "updating learnery to REF ${REF_L:0:7}"

for theme in default railsgirls webdev coderdojo ;  do
  cd learnery-$theme
  ruby -pi -e  "gsub(/(gem\s+['\"]learnery['\"]).*git.*/,\"gem 'learnery', :git => 'git://github.com/learnery/learnery.git', ref: '$REF_L'\")" Gemfile
  ruby -pi -e  "gsub(/(gem\s+['\"]learnerydeploy['\"]).*git.*/,\"gem 'learnerydeploy', :git => 'git://github.com/learnery/deployment.git', ref: '$REF_D'\")" Gemfile
  bundle update learnery learnerydeploy
  git add .
  git commit -m "updated to learnery/learnery@${REF_L:0:7} and learnery/deployment@#${REF_D:0:7}"
  cd ..
done
