return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({})

      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "file_browser")

      local map = vim.keymap.set

      -- Files
      map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      map("n", "<leader>ft", "<cmd>Telescope file_browser<cr>", { desc = "File browser" })

      -- Buffers & Editor
      map("n", "<leader>fb", builtin.buffers, { desc = "Open buffers" })
      map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "LSP symbols" })
      map("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })

      -- Git
      map("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
      map("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
      map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
    end,
  },
}
