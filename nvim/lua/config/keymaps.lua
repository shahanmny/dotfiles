-- Keymaps
local map = vim.keymap.set

-- Exit any mode to normal
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("v", "jk", "<Esc>", { desc = "Exit visual mode" })
map("s", "jk", "<Esc>", { desc = "Exit select mode" })
map("x", "jk", "<Esc>", { desc = "Exit visual block mode" })

-- Window navigation
map("n", "<M-h>", "<C-w>h", { desc = "Move to left split" })
map("n", "<M-j>", "<C-w>j", { desc = "Move to below split" })
map("n", "<M-k>", "<C-w>k", { desc = "Move to above split" })
map("n", "<M-l>", "<C-w>l", { desc = "Move to right split" })

-- Navigation
map({ "n", "v" }, "<C-l>", "$", { desc = "End of line" })
map({ "n", "v" }, "<C-h>", "^", { desc = "Start of line" })
map({ "n", "v" }, "<C-j>", "<C-d>", { desc = "Half page down" })
map({ "n", "v" }, "<C-k>", "<C-u>", { desc = "Half page up" })

-- Clear search highlight
map("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlight", silent = true })

-- Save
map("n", "<leader>w", ":w<CR>", { desc = "Save file", silent = true })

-- Indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })
