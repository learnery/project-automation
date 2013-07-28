 #!/bin/bash
 for t in default coderdojo railsgirls webdev; do
  cd learnery-$t
  git pull origin master
  cd ..
 done
