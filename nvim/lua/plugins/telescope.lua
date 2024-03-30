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
            winblend = 0,
            border = {},
            borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
            color_devicons = true,
            use_less = true,
            set_env = { ["COLORTERM"] = "truecolor" },
            file_previewer = require("telescope.previewers").vim_buffer_cat.new,
            grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
            qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        },
        pickers = {
            find_files = {
                hidden = false
            }   
        },     
    })
    
    local builtin = require("telescope.builtin") 
    vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
    vim.keymap.set("n", "<leader>fw", builtin.live_grep, {})
    vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    require("telescope").load_extension("ui-select")
    end,
    
  },
}