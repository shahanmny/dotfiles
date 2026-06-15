# Neovim Keymaps Cheat Sheet

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
