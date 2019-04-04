# My Dotfiles Repo (Powered by YADM)


## New MacOS Host

```BASH

xcode-select --install
curl -fLo ~/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x ~/yadm
./yadm clone https://github.com/lonix/dotfiles.git --bootstrap
yadm decrypt
yadm perms

```

