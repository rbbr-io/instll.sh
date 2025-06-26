# instll.sh - GitHub Script Redirector

A simple nginx-based service that provides short URLs for GitHub-hosted shell scripts.

## How it works

This service redirects incoming requests to raw GitHub files:

- `yourhost.com/username/reponame` → redirects to `install.sh` from the main branch
- `yourhost.com/username/reponame/scriptname` → redirects to `scriptname.sh` from the main branch

## Examples

```bash
# Install script from main repository
curl -fsSL yourhost.com/user/myproject | bash

# Run specific script from repository
curl -fsSL yourhost.com/user/myproject/setup | bash
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