
Project Automation for Learnery
===============================

This is a collection of scripts automating tasks for developing learnery.
Add bin/ to your path and you're ready to go

''warning'': these are very simple scripts, with no error checks etc!!
read them before you use them.

Tasks for all Themes
---------------------

all these are meant to call from a directory containing all 4 themes.

* checkout.sh: clones all 4 themes to the current directoy
* pull-all.sh: pulls in all 4 themes
* push-all.sh: pushs to origin in all 4 themes
* update.sh: takes a git ref as parameter and updates all themes to this version. see head of script for usage.
* all.sh: example for manipulating a file in all repositories
