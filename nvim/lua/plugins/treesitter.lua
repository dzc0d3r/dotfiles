return {
  {
   "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      -- Adds tree-sitter-tact support
      parser_config.tact = {
        install_info = {
          url = "~/.local/git/tree-sitter-tact", -- a path to the cloned repo
          files = {"src/parser.c"},
          branch = "main",
          generate_requires_npm = false,
          requires_generate_from_grammar = false,
        }
      }


      configs.setup({
          ensure_installed = { 
            "c", 
            "lua",
            "vim",
            "vimdoc",
            "query",
            "elixir",
            "javascript",
            "html"
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  }
}