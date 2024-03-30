return {
  "akinsho/bufferline.nvim",
  event = { "UIEnter" },
  keys = {
    { ",t", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { ",P", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    { ",o", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete other buffers" },
    { ",r", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete buffers to the right" },
    { ",l", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete buffers to the left" },
    { ",p", "<Cmd>BufferLinePick<CR>", desc = "Pick buffer" },
    { ",d", "<Cmd>lua require('mini.bufremove').delete(n, false)<CR>", desc = "Pick buffer and close" },
    { ",w", "<Cmd>lua require('mini.bufremove').delete(n, false)<CR>", desc = "Pick buffer and close" },
    { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "[m", "<cmd>BufferLineMoveNext<cr>", desc = "Move to Next buffer" },
    { "]m", "<cmd>BufferLineMovePrev<cr>", desc = "Move to Prev buffer" },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.bufremove",
    {
      "tiagovla/scope.nvim",
      event = "UIEnter",
      lazy = true,
      config = function()
        require("scope").setup({ restore_state = true })
      end,
    },
  },
  opts = {
    options = {
      hover = {
        enabled = true,
        delay = 50,
        reveal = { "close" },
      },
      close_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      right_mouse_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      diagnostics = "nvim_lsp",
      numbers = function(opts)
        return string.format("[%s]", opts.ordinal)
      end,
      separator_style = "thin",
      always_show_bufferline = false,
      diagnostics_indicator = function(_, _, diag)
        local icons = require("NeutronVim.core.icons").diagnostics
        local ret = (diag.error and icons.Error .. " " .. diag.error .. " " or "")
          .. (diag.warning and icons.Warning .. " " .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer   ||  🔍",
          highlight = "Directory",
          text_align = "left",
          highlight = "BufferLineHint",
        },
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
}