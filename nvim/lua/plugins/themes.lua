return {
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
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
},
{
  "themercorp/themer.lua",
  config = function()
  require("themer").setup({
      colorscheme = "kanagawa",
      --transparent = true,
      styles = {
          ["function"] = { style = 'italic' },
          functionbuiltin = { style = 'italic' },
          variable = { style = 'italic' },
            variableBuiltIn = { style = 'italic' },
          parameter  = { style = 'italic' },
      },
      enable_installer = true,
      enable_italics = true,
      
  })
  end
}
}