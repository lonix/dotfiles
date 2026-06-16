# My Dotfiles (powered by YADM)

## New macOS Host

```bash
xcode-select --install
mkdir -p ~/.bin
curl -fLo ~/.bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod +x ~/.bin/yadm
~/.bin/yadm clone https://github.com/lonix/dotfiles.git --bootstrap
yadm alt
yadm decrypt
yadm perms
```

## New AlmaLinux / RHEL Host

```bash
mkdir -p ~/.bin
curl -fLo ~/.bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod +x ~/.bin/yadm
~/.bin/yadm clone https://github.com/lonix/dotfiles.git --bootstrap
yadm alt
yadm decrypt
yadm perms
```

## New Ubuntu / Debian Host

```bash
sudo apt-get install -y curl
mkdir -p ~/.bin
curl -fLo ~/.bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod +x ~/.bin/yadm
~/.bin/yadm clone https://github.com/lonix/dotfiles.git --bootstrap
yadm alt
yadm decrypt
yadm perms
```

## Notes

- The bootstrap script auto-detects the OS and installs the appropriate packages
- After bootstrap, the yadm remote is switched to SSH (`git@github.com:lonix/dotfiles.git`)
- `yadm alt` applies OS-specific file variants (e.g. macOS vs Linux configs)
