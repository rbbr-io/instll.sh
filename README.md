# instll.sh - GitHub Script Redirector

A simple nginx-based service that provides short URLs for GitHub-hosted shell scripts.

## How it works

This service redirects incoming requests to raw GitHub files:

- `instll.sh/username/reponame` → redirects to `install.sh` from the main branch
- `instll.sh/username/reponame/scriptname` → redirects to `scriptname.sh` from the main branch

## Examples

```bash
# Install script from main repository
curl -fsSL instll.sh/user/myproject | sh

# Run specific script from repository (e.g. install.sh)
curl -fsSL instll.sh/user/myproject/uninstall | sh
```

This redirects to:
- `https://raw.githubusercontent.com/user/myproject/refs/heads/main/install.sh`
- `https://raw.githubusercontent.com/user/myproject/refs/heads/main/setup.sh`

## Setup

1. Copy the `nginx.conf` configuration to your nginx server
2. Replace `_` with your actual domain in the `server_name` directive
3. Restart nginx

## Configuration

The nginx configuration includes:
- Regex-based URL matching and variable capture
- 302 redirects to GitHub raw file URLs
- 404 responses for invalid paths

## Use Cases

- Simplified installation commands for open source projects
- Quick access to setup scripts
- Shortened URLs for documentation and tutorials