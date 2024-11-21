return {
  "folke/which-key.nvim",
  keys = { "<leader>", "<c-r>", "<c-w>", "'", "`", "c", "v", "g" },

  config = function(_, opts)
    --dofile(vim.g.base46_cache .. "whichkey")
    require("which-key").setup(opts)
  end,

}
