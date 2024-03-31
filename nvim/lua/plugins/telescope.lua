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
          
        },
        defaults = {
            mappings = {
                i = { 
                    ["q"] = actions.close, 
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
            selection_caret = ' ⭆ ',
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
            path_display = { "smart" },
            sorting_strategy = "ascending",


        },
        pickers = {
            find_files = {
                hidden = false
            },


        }, 
        extensions = {
          recent_files = {
              only_cwd = true,
          },
        }, 
   
    })
    
    local builtin = require("telescope.builtin") 
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("themes")


    ----------------------------------------------------------------------
    --                    UI CUSTOMIZATION                              --
    ----------------------------------------------------------------------

    -- Maybe use  colors from themer plugin later ??
    --[[ local status_ok, theme_name = pcall(vim.api.nvim_get_var, "colors_name")
    if not status_ok then
    return
    end
    local colors = require("themer.modules.core.api").get_cp(theme_name) ]]


    local normal_hl = vim.api.nvim_get_hl_by_name('Normal', true)
    local dark = '#191919'
    local light_dark = '#222831'
    local purple = '#12121c'
    local brown = '#6B240C'
    local dark_blue = '#0A1D56'
    local teal = '#176B87'

    ----------------------------------------------------------------------
    --                              Prompt                              --
    ----------------------------------------------------------------------
    vim.api.nvim_set_hl(0, 'TelescopePromptBorder', {
        fg = purple,
        bg = purple,
    })

    vim.api.nvim_set_hl(0, 'TelescopePromptNormal', {
        fg = normal_hl.foreground,
        bg = purple,
    })

    vim.api.nvim_set_hl(0, 'TelescopePromptTitle', {
        fg = normal_hl.foreground,
        bg = brown,
    })

    vim.api.nvim_set_hl(0, 'TelescopePromptCounter', {
        fg = brown,
        bg = purple,
    })

    vim.api.nvim_set_hl(0, 'TelescopePromptPrefix', {
        fg = brown,
        bg = purple3,
    })

    ----------------------------------------------------------------------
    --                              Result                              --
    ----------------------------------------------------------------------
    vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', {
        fg = light_dark,
        bg = light_dark,
    })

    vim.api.nvim_set_hl(0, 'TelescopeResultsNormal', {
        fg = normal_hl.foreground,
        bg = light_dark,
    })

    vim.api.nvim_set_hl(0, 'TelescopeResultsTitle', {
        fg = normal_hl.foreground,
        bg = teal,
    })

    vim.api.nvim_set_hl(0, 'TelescopeSelectionCaret', {
        fg = teal,
        bg = vim.api.nvim_get_hl_by_name('TelescopeSelection', true).background,
    })

    ----------------------------------------------------------------------
    --                             Preview                              --
    ----------------------------------------------------------------------

    vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', {
        fg = dark,
        bg = dark,
    })

    vim.api.nvim_set_hl(0, 'TelescopePreviewNormal', {
        fg = normal_hl.foreground,
        bg = dark,
    })

    vim.api.nvim_set_hl(0, 'TelescopePreviewTitle', {
        fg = normal_hl.foreground,
        bg = dark_blue,
    })
    end,

  },
}




