# My Dotfiles repository (Powered by YADM)


## New macOS Host

```BASH

xcode-select --install
curl -fLo ~/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x ~/yadm
./yadm clone https://github.com/lonix/dotfiles.git --bootstrap
yadm decrypt
yadm perms

```

## New (interactive) Debian/ubuntu Host

```BASH

curl -fLo ~/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x ~/yadm
./yadm clone https://github.com/lonix/dotfiles.git --bootstrap
yadm decrypt
yadm perms

```

