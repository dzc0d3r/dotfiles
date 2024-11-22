return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            -- auto close
            -- vim.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end
        },

      },
      close_if_last_window = true,
      source_selector = {
        winbar = true,
        statusline = true
      },
      window = {
        mappings = {
          ["p"] = { "toggle_preview", config = { use_float = true, use_image_nvim = false, } },
          ['g'] = function() vim.api.nvim_exec('Neotree focus git_status left', true) end,
          ['b'] = function() vim.api.nvim_exec('Neotree focus buffers left', true) end,
          ['e'] = function() vim.api.nvim_exec('Neotree focus filesystem left', true) end,
        },
        width = 27,
        position = "left",               -- Open on the left side
      },
      hide_root_node = true,             -- Hide the root node.
      retain_hidden_root_indent = false, -- IF the root node is hidden, keep the indentation anyhow.
      add_blank_line_at_top = false,
      indent_size = 3,
      filesystem = {
        follow_current_file = {
          enabled = true
        },
        filtered_items = {
          visible = false,
          hide_by_pattern = {
            "node_modules",
            ".git"
          },
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          --never_show = {},
        },
      }
    })
  end,
}
