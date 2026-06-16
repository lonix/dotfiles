if type -q gh; and gh auth status -h github.com &>/dev/null
    set -gx GITHUB_TOKEN (gh auth token)
end
set -gx GITHUB_USER lonix
