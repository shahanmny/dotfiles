return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    opts = {},
    keys = {
      { "<leader>fe", "<cmd>Oil<cr>", desc = "Edit filesystem" },
    },
  },
}
