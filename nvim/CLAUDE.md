# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Personal Neovim configuration for C++ and Python development, managed with lazy.nvim.

## Structure

```
init.lua                  — Entry point: sets mapleader, loads config modules, WSL2 clipboard
lua/config/
  options.lua             — Editor options (vim.opt)
  keymaps.lua             — Global keymaps
  lazy.lua                — lazy.nvim bootstrap and plugin loader
lua/plugins/              — One file per plugin, each returns a lazy.nvim spec table
```

## Key Conventions

- Each file in `lua/plugins/` is a single plugin spec returning a table. Do not combine unrelated plugins in one file.
- Keymap pattern: `<leader>f*` = files/navigation, `<leader>g*` = git, `<leader>x*` = diagnostics/trouble, `<leader>h*` = git hunks, `<leader>l*` = LSP panels.
- **Always update the Keymaps section below** when adding or changing any keymaps anywhere in the config.

## Keymaps

```
GENERAL
  jk              Exit insert/visual mode
  <leader>w       Save file
  <leader>h       Clear search highlight
  <C-h/j/k/l>    Move between splits
  < / > (visual)  Indent left/right and reselect

LSP
  gd              Go to definition
  gD              Go to declaration
  gr              Go to references
  gi              Go to implementation
  K               Hover documentation
  <leader>rn      Rename symbol
  <leader>ca      Code action
  <leader>e       Show line diagnostics
  [d / ]d         Previous/next diagnostic

COMPLETION (blink.cmp)
  Ctrl+Space      Toggle completion menu
  Ctrl+n / Ctrl+p Next/previous suggestion
  Ctrl+y          Accept suggestion
  Ctrl+e          Dismiss menu

FILES & NAVIGATION
  <leader>ff      Find files
  <leader>fg      Live grep
  <leader>ft      Telescope file browser
  <leader>fb      Open buffers
  <leader>fs      LSP symbols
  <leader>fk      Keymaps
  <leader>fe      Oil filesystem editor

GIT
  <leader>gc      Git commits
  <leader>gb      Git branches
  <leader>gs      Git status
  ]c / [c         Next/previous git hunk
  <leader>hs      Stage hunk
  <leader>hr      Reset hunk
  <leader>hp      Preview hunk
  <leader>hb      Blame line
  <leader>hd      Diff this

DIAGNOSTICS (Trouble)
  <leader>xx      Toggle all diagnostics
  <leader>xX      Toggle buffer diagnostics
  <leader>xs      Toggle symbols panel
  <leader>xl      Toggle LSP references panel

WHICH-KEY
  <leader>?       Show buffer keymaps
  <leader> (hold) Show all leader keymaps
```

## Plugins

| File | Plugin | Purpose |
|------|--------|---------|
| `colorscheme.lua` | vim-moonfly-colors | Colorscheme (black background) |
| `lsp.lua` | nvim-lspconfig | LSP config for clangd (C++) and pyright (Python) |
| `mason.lua` | mason + mason-lspconfig | Auto-installs clangd and pyright |
| `blink-cmp.lua` | blink.cmp | Autocompletion |
| `telescope.lua` | telescope.nvim | Fuzzy finder, file browser, git pickers |
| `oil.lua` | oil.nvim | Filesystem editor |
| `gitsigns.lua` | gitsigns.nvim | Git gutter and hunk actions |
| `lualine.lua` | lualine.nvim | Status bar (icons disabled, plain separators) |
| `which-key.lua` | which-key.nvim | Keymap popup |
| `trouble.lua` | trouble.nvim | Diagnostics and LSP panels |
| `autopairs.lua` | nvim-autopairs | Auto close brackets/quotes |
| `indent-blankline.lua` | indent-blankline.nvim | Indent guides |
| `fidget.lua` | fidget.nvim | LSP progress indicator |

## Environment

- WSL2 on Windows — Nerd Font (JetBrainsMono Nerd Font Mono) is installed in Windows Terminal
- Mason installs language servers; requires `unzip` on the system (`sudo apt install unzip`)
- telescope-fzf-native requires `make` (`sudo apt install make`)
