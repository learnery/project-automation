#!/bin/bash
# takes the hash of the commit as parameter
# updates the Gemfiles (!) in all themes to depend on this
# call it with
# pull-all.sh
# update-deploy.sh
# push-all.sh

REF_D=`cd deployment; git rev-parse HEAD; cd ..`
echo "updating deployment to REF ${REF_D:0:7}"

for theme in default railsgirls webdev coderdojo ;  do
  cd learnery-$theme
  ruby -pi -e  "gsub(/(gem\s+['\"]learnerydeploy['\"]).*git.*/,\"gem 'learnerydeploy', :git => 'git://github.com/learnery/deployment.git', ref: '$REF_D'\")" Gemfile
  bundle update learnerydeploy
  git add .
  git commit -m "updated to learnery/deployment@#${REF_D:0:7}"
  cd ..
done
