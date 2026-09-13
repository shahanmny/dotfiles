---
name: nvim-cheatsheet
description: This skill should be used when the user asks to "update the nvim cheatsheet", "regenerate the nvim cheatsheet", "show nvim shortcuts/keymaps", or after any keymap is added/changed/removed in the nvim dotfiles config. Regenerates a compact, single-page reference of every custom and plugin keybinding.
version: 1.0.0
---

# Nvim Cheatsheet

Keeps `nvim/CHEATSHEET.md` — a compact, one-page reference of every keybinding in this
dotfiles' Neovim config — in sync with the actual config.

## When to use this

- The user asks to see, create, or refresh the nvim cheatsheet.
- You (or the user) just added, changed, or removed a keymap anywhere under `nvim/`.

## How to regenerate the cheatsheet

1. **Find every keybinding.** Search the whole nvim config for bindings, not just the
   obvious file:
   - `nvim/lua/config/keymaps.lua` — global keymaps (`vim.keymap.set` / `map(...)`)
   - `nvim/init.lua` — anything mapped at startup
   - `nvim/lua/plugins/*.lua` — every plugin spec, checking for:
     - a lazy.nvim `keys = { ... }` table (each entry is a binding)
     - `vim.keymap.set(...)` calls inside `config = function() ... end`, including
       nested `on_attach` callbacks (LSP, gitsigns, etc.)

   Use a broad grep first so nothing is missed, e.g.:
   ```
   grep -rn "keymap.set\|keys = {\|desc = " nvim/
   ```
   Then read each matching file to pull out the actual mode, lhs (keys), and `desc`.

2. **Group bindings by purpose**, mirroring the categories already in the cheatsheet
   (General, LSP, Completion, Files, Git, Diagnostics, Which-key, ...). If a new plugin
   introduces a new category, add one.

3. **Rewrite `nvim/CHEATSHEET.md`** with the updated bindings. Formatting rules to keep
   it fitting on a single page/screen (~35-45 lines total):
   - One fenced code block, one category per paragraph/group.
   - Pack multiple bindings per line separated by ` | ` — don't give each binding its
     own line.
   - Keep descriptions to 2-4 words.
   - No blank lines between bindings within a category, one blank line between
     categories.
   - Keep the file's header note (auto-generated, don't hand-edit, points back to this
     skill) at the top.

4. **Do not duplicate this list elsewhere.** `nvim/CLAUDE.md` intentionally just points
   at `CHEATSHEET.md` instead of repeating the bindings — leave it that way.

5. Show the user a short summary of what changed (added/removed/moved bindings), not
   the full regenerated file, unless they ask to see it.
