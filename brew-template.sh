#
# Mac is probably using zsh
#
set -x
set -euo pipefail
brew update
brew install glab
brew install keepingyouawake
brew install secretive
echo "Done."
exit 0
