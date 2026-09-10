# work-dotfiles
A minimal, work-safe terminal setup for zsh, tmux, and Neovim, with an installer for approved developer tools and opt-in plugins.

## `install`

Installs a small work-machine toolset and copies the work configuration files
into your home directory without using Stow. The temporary repository clone is
removed when the script finishes.

Run it directly without cloning the repository first:

```bash
curl -fsSL https://raw.githubusercontent.com/janis-melendez/work-dotfiles/main/install | bash
```

Pass options to the direct invocation with `bash -s --`:

```bash
curl -fsSL https://raw.githubusercontent.com/janis-melendez/work-dotfiles/main/install \
  | bash -s -- --optional-tools --plugins
```

To inspect the script before running it:

```bash
curl -fsSLO https://raw.githubusercontent.com/janis-melendez/work-dotfiles/main/install
less install
bash install --optional-tools --plugins
```

When running from an existing clone, use:

```bash
./install
./install --optional-tools
./install --plugins
./install --force
```

`--optional-tools` adds `fd`, The Silver Searcher (`ag`), and `zoxide`.
`--plugins` explicitly installs Antidote, Lazy, and declared tmux plugins.
`--force` backs up conflicting configuration before replacing it.

`tmux-sessionizer` and its configuration are installed with the work tmux
configuration. Its project picker requires `fzf`.

Run `./install --help` for all options.
