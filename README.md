# Dotfiles

This repo manages my machine setup across multiple hosts and roles.

It currently handles:

- stowed dotfiles
- macOS package groups via Homebrew Brewfiles
- macOS system defaults
- macOS app defaults
- macOS hotkeys
- post-setup scripts
- host and role composition

## Bootstrap

On macOS:

```sh
curl -fsSL https://raw.githubusercontent.com/samuherek/.dotfiles/multimachine/bootstrap/macos/run.sh | bash
```

Then run:

```sh
cd ~/.dotfiles
./runner/run.sh apply
```

## CLI

The public command is `dotfiles`.

```sh
dotfiles help
dotfiles status
dotfiles host
dotfiles sync

dotfiles install [host]
dotfiles defaults [host]
dotfiles hotkeys [host]
dotfiles scripts [host]
dotfiles stow [host]
dotfiles apply [host]
```

Command meanings:

- `install`: install package groups
- `defaults`: apply system defaults and app defaults
- `hotkeys`: apply hotkey groups
- `scripts`: run post-setup scripts
- `stow`: apply stowed config
- `apply`: run the full setup flow
- `status`: show applied state and repo sync status
- `sync`: fetch and fast-forward pull the repo when safe

## Apply Order

`dotfiles apply` currently runs in this order:

1. install packages
2. apply defaults
3. apply app defaults
4. apply hotkeys
5. stow dotfiles
6. run scripts

## Structure

```text
bootstrap/  Initial machine bootstrap scripts
hosts/      Concrete machine definitions
packages/   Package groups, currently Brewfiles for macOS
roles/      Reusable role definitions
runner/     Internal CLI implementation
scripts/    Post-setup scripts grouped by platform
stow/       Stow packages grouped by platform/shared
system/     System defaults, app defaults, and hotkeys grouped by platform
```

## Hosts And Roles

- roles describe reusable machine traits like `base`, `developer`, `workstation`, `server`, `headless`
- hosts compose roles and can add host-specific overrides

Example host:

```sh
PLATFORM="macos"
ROLES="base developer workstation"
```

## State

Applied state is stored locally in:

```sh
~/.local/state/dotfiles/state.sh
```

It tracks the current host and the last applied:

- package groups
- defaults groups
- app groups
- hotkey groups
- script groups
- stow refs

## Common Examples

Apply a specific host:

```sh
dotfiles apply macos-dev
```

Install only:

```sh
dotfiles install macos-dev
```

Apply stow only:

```sh
dotfiles stow
```

Check current state and repo freshness:

```sh
dotfiles status
```

Update the repo when clean:

```sh
dotfiles sync
```

## Supporting Docs

- `packages/README.md`
- `roles/README.md`
- `hosts/README.md`
