-- Keymaps
local map = vim.keymap.set

-- Exit any mode to normal
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })
map("v", "jk", "<Esc>", { desc = "Exit visual mode" })
map("s", "jk", "<Esc>", { desc = "Exit select mode" })
map("x", "jk", "<Esc>", { desc = "Exit visual block mode" })

-- Navigation
map({ "n", "v" }, "<M-l>", "$", { desc = "End of line" })
map({ "n", "v" }, "<M-h>", "^", { desc = "Start of line" })
map({ "n", "v" }, "<M-j>", "<C-d>", { desc = "Half page down" })
map({ "n", "v" }, "<M-k>", "<C-u>", { desc = "Half page up" })

-- Clear search highlight
map("n", "<leader>h", ":nohl<CR>", { desc = "Clear search highlight", silent = true })

-- Save
map("n", "<leader>w", ":w<CR>", { desc = "Save file", silent = true })

-- Indenting in visual mode
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })
