 #!/bin/bash
 for t in coderdojo railsgirls webdev; do
  cd learnery-$t

#  git rm --cached .ruby-version
#  git rm --cached .ruby-gemset
#  echo "# ignore the rvm version files, as we"     >> .gitignore
#  echo "# want an easy entry for new developers"  >> .gitignore
#  echo ".ruby-version"  >> .gitignore
#  echo ".ruby-gemset"  >> .gitignore
#
#  git add .gitignore
  git add .
  git commit -m "travis calls version generator"
  cd ..
 done
