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
- **Keymap reference lives in `CHEATSHEET.md`**, not here. After adding or changing any keymap, regenerate it with the `nvim-cheatsheet` Claude Code skill (`claude/skills/nvim-cheatsheet/SKILL.md`) instead of editing a list in this file.

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
| `tmux-navigator.lua` | vim-tmux-navigator | Seamless Ctrl-hjkl navigation between nvim splits and tmux panes (needs matching tmux config, see `tmux/.tmux.conf`) |

## Environment

- WSL2 on Windows — Nerd Font (JetBrainsMono Nerd Font Mono) is installed in Windows Terminal
- Mason installs language servers; requires `unzip` on the system (`sudo apt install unzip`)
- telescope-fzf-native requires `make` (`sudo apt install make`)
