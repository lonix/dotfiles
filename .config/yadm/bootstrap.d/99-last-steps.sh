#Post tasks
if [ -z "$CI" ]; then
  echo "remove Temp YADM binary"
  rm -f "$HOME/yadm"

  echo "Setting remote url to git instead of http"
  yadm remote set-url origin "git@github.com:lonix/dotfiles.git"

  echo "Changing shell to fish."
  chsh -s "$(which fish)"
fi
