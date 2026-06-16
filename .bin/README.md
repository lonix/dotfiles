# Shell Utilities

A collection of shell utilities in `~/.bin`. Scripts are cross-platform
unless marked otherwise. Completions are loaded automatically by `config.fish`.

## Utilities

### mac-update *(macOS only)*

Updates Homebrew, Cask apps, Fisher plugins, Mac App Store apps, and syncs
YADM. Rotates backups automatically (keeps last 5).

```bash
mac-update [options]

Options:
  --dry-run          Preview what would be updated without making changes
  --skip-brew        Skip Homebrew updates
  --skip-cask        Skip Cask updates
  --skip-fisher      Skip Fisher updates
  --skip-mas         Skip Mac App Store updates
  --skip-yadm        Skip YADM sync
  --skip-backup      Skip config file backup
  --keep-backups N   Number of backups to keep (default: 5)
  -v, --verbose      Enable verbose output
  -h, --help         Show this help message
```

### mac-hostname *(macOS only)*

Sets ComputerName, LocalHostName, and HostName in one command.

```bash
mac-hostname <new-hostname>
```

### myip

Prints your current public IP address.

```bash
myip
```

### gitprune

Deletes local branches whose upstream has been deleted (gone branches).

```bash
gitprune
```

### wssh

Waits for a host to become reachable on port 22 then connects. Use `-r` to
reconnect automatically on disconnect.

```bash
wssh [-r] <hostname>
```

### cleantmp *(Linux only)*

Removes all files from `$HOME/tmp/`.

```bash
cleantmp
```

### Docker Utilities

| Script | Description |
|--------|-------------|
| `dexec <container>` | Open a bash shell in a running container |
| `dtail <container>` | Follow last 50 lines of container logs |
| `dlogs <c1> [c2...]` | Tail logs from multiple containers simultaneously |
| `dtemp [image]` | Spin up a throwaway container (default: alpine) |

### terraform-docs

Runs terraform-docs via Docker against the current directory.

```bash
terraform-docs [args]
```

### testssl

Runs testssl.sh via Docker against a target host.

```bash
testssl <host>
```

### gitleaks

Scans a repository for secrets using gitleaks via Docker.

```bash
gitleaks [args]
```

### glovestrap

Exports installed Homebrew/Fisher packages to `.Brewfile` and
`fisher-list`, then commits and pushes via YADM.

```bash
glovestrap
```
