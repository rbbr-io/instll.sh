# instll.sh - GitHub Script Redirector

A simple service that provides short URLs for GitHub-hosted installers.

## Try it out

```bash
curl -fsSL instll.sh/rbbr-io/instll.sh | sh
```

## When to use it

When you want to provide a simple way to install your project.


## How to use it

1. Add install.sh to your repository
2. Add installation instructions to your README.md:

  ```bash
  curl -fsSL instll.sh/<user>/<repo> | sh
  ```

Done!

## Why use it?

I could just use `raw.githubusercontent.com` to host my scripts:

```bash
curl -fsSL raw.githubusercontent.com/user/myproject/refs/heads/main/install.sh | sh
```

However, it doesn't look as elegant.

Alternatively, I could host it on a separate domain, like I did for [Sitedog](https://sitedog.io): `get.sitedog.io`. But that would require managing a whole new infrastructure. Instead, I decided to create convention-based serverless installers, so anyone could do it on scale in no clicks!

## How it works

This service redirects incoming requests to raw GitHub files:

- `instll.sh/user/repo` → redirects to `install.sh` from the main branch
- `instll.sh/user/repo/uninstall.sh` → redirects to `uninstall.sh` from the main branch


## Use Cases

- Simplified installation commands for open source projects
- Quick access to setup scripts
- Shortened URLs for documentation and tutorials
