return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      local action_layout = require("telescope.actions.layout")
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          recent_files = {
            only_cwd = true,
          },

        },
        defaults = {
          mappings = {
            i = {
              ["qq"] = actions.close,
              ["<C-h>"] = actions.which_key,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<leader>p"] = action_layout.toggle_preview,
              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,
              ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,

            },
          },
          prompt_prefix = '   ',
          selection_caret = '👉', --' ⭆ ',
          entry_prefix = '   ',
          path_display = { 'truncate' },
          file_ignore_patterns = {
            'dist',
            'target',
            'node_modules',
            'pack/plugins',
          },
          layout_config = {
            horizontal = {
              preview_cutoff = 0,
              preview_width = 0.55,
              width = 0.92,
              height = 0.92,
            },
          },
          -- path_display = { "smart" },
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = {
            hidden = false
          },
        },
      })

      require("telescope").load_extension("ui-select")

      -- Custom theme Define a function to set Telescope highlights
      --[[ function setup_telescope_highlights()
    local normal_hl = vim.api.nvim_get_hl_by_name('Normal', true)

    local purple = vim.api.nvim_get_hl_by_name('Comment', true).foreground
    local dark = '#191919'
    local light_dark = '#222831'
    local purple = '#12121c'
    local brown = '#6B240C'
    local dark_blue = '#0A1D56'
    local teal = '#176B87'
    local TelescopePrompt = {
        TelescopePromptBorder = {
            fg = purple,
            bg = purple,
        },
        TelescopePromptNormal = {
            fg = normal_hl.foreground,
            bg = purple,
        },
        TelescopePromptTitle = {
            fg = normal_hl.foreground,
            bg = brown,
        },
        TelescopePromptCounter = {
            fg = brown,
            bg = purple,
        },
        TelescopePromptPrefix = {
            fg = brown,
            bg = purple,
        },
    }

    local TelescopeResults = {
        TelescopeResultsBorder = {
            fg = light_dark,
            bg = light_dark,
        },
        TelescopeResultsNormal = {
            fg = normal_hl.foreground,
            bg = light_dark,
        },
        TelescopeResultsTitle = {
            fg = normal_hl.foreground,
            bg = teal,
        },
        TelescopeSelectionCaret = {
            fg = teal,
            bg = vim.api.nvim_get_hl_by_name('TelescopeSelection', true).background,
        },
    }

    local TelescopePreview = {
        TelescopePreviewBorder = {
            fg = dark,
            bg = dark,
        },
        TelescopePreviewNormal = {
            fg = normal_hl.foreground,
            bg = dark,
        },
        TelescopePreviewTitle = {
            fg = normal_hl.foreground,
            bg = dark_blue,
        },
    }

    for hl, col in pairs(TelescopePrompt) do
        vim.api.nvim_set_hl(0, hl, col)
    end

    for hl, col in pairs(TelescopeResults) do
        vim.api.nvim_set_hl(0, hl, col)
    end

    for hl, col in pairs(TelescopePreview) do
        vim.api.nvim_set_hl(0, hl, col)
    end
end ]]

      -- Call the setup function to initially set up Telescope highlights
      --setup_telescope_highlights()

      -- Subscribe to the ColorScheme event to reset Telescope highlights whenever the theme changes
      --[[ vim.api.nvim_exec([[
    augroup TelescopeTheme
        autocmd!
        autocmd ColorScheme * lua setup_telescope_highlights()
    augroup END
]] --,false) ]]
    end
  },

}
