# instll.sh - GitHub Script Redirector

A simple nginx-based service that provides short URLs for GitHub-hosted installers (and not only).

1. Use `curl -fsSL https://instll.sh/user/myproject` instead of `curl -fsSL https://raw.githubusercontent.com/user/myproject/refs/heads/main/install.sh`
2. No need fo your own infrastructure to host your scripts. Public GitHub repo is enough!
3. 


## How it works

This service redirects incoming requests to raw GitHub files:

- `instll.sh/user/repo` → redirects to `install.sh` from the main branch
- `instll.sh/user/repo/uninstall` → redirects to `uninstall.sh` from the main branch

## Examples

# Install script from main repository

```bash
curl -fsSL instll.sh/user/myproject | sh
```

# Run specific script from repository (e.g. install.sh)

```bash
curl -fsSL instll.sh/user/myproject/uninstall | sh
```

## Use Cases

- Simplified installation commands for open source projects
- Quick access to setup scripts
- Shortened URLs for documentation and tutorials
