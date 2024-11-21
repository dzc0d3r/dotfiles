return {
  { "Mofiqul/dracula.nvim" },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      --vim.cmd.colorscheme "catppuccin"
    end

  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 2000,
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 2000,
  },
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 2000,
  },
  {
    "sainnhe/sonokai",
    lazy = false,
    priority = 2000,
  },
  {
    "sainnhe/edge",
    lazy = false,
    priority = 2000,
    config = function()
      vim.cmd.colorscheme "dracula-soft"
    end
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 2000,
  },

}
