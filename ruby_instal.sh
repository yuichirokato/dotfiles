#! /bin/bash

# fail if any commands failes
set -e
# debug log
set -x

### rbenv
echo "install ruby"
rbenv install "$(< .ruby-version)"
