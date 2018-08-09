#!/bin/bash
# virtualenv-auto-activate.sh
# 
# Installation:
#   Add this line to your .bashrc or .bash-profile:
#
#       source /path/to/virtualenv-auto-activate.sh
#
#   Go to your project folder, run "virtualenv .venv", so your project folder
#   has a .venv folder at the top level, next to your version control directory.
#   For example:
#   .
#   ├── .git
#   │   ├── HEAD
#   │   ├── config
#   │   ├── description
#   │   ├── hooks
#   │   ├── info
#   │   ├── objects
#   │   └── refs
#   └── .venv
#       ├── bin
#       ├── include
#       └── lib
#
#   The virtualenv will be activated automatically when you enter the directory.
export _VENV_NAME=""

_virtualenv_auto_activate() {
      if [ -e ".venv" ]; then
          # Check to see if already activated to avoid redundant activating
          if [ "$VIRTUAL_ENV" = "" ]; then
              export _VENV_NAME=" (venv)"
              VIRTUAL_ENV_DISABLE_PROMPT=1
              source .venv/bin/activate
           fi
     else
       if [ "$VIRTUAL_ENV" != "" ]; then
        deactivate
        export _VENV_NAME=""
       fi
     fi
   }

export PROMPT_COMMAND=_virtualenv_auto_activate
