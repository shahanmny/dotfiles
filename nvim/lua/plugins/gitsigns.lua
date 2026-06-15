return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gitsigns = require("gitsigns")
          local map = function(mode, keys, func, desc)
            vim.keymap.set(mode, keys, func, { buffer = bufnr, desc = desc, silent = true })
          end

          -- Navigation
          map("n", "]c", function() gitsigns.nav_hunk("next") end, "Next git hunk")
          map("n", "[c", function() gitsigns.nav_hunk("prev") end, "Previous git hunk")

          -- Actions
          map("n", "<leader>hs", gitsigns.stage_hunk, "Stage hunk")
          map("n", "<leader>hr", gitsigns.reset_hunk, "Reset hunk")
          map("n", "<leader>hp", gitsigns.preview_hunk, "Preview hunk")
          map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end, "Blame line")
          map("n", "<leader>hd", gitsigns.diffthis, "Diff this")
        end,
      })
    end,
  },
}
