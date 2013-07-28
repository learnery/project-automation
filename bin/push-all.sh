 #!/bin/bash
 for t in default coderdojo railsgirls webdev; do
  cd learnery-$t
  git push origin master
  cd ..
 done
