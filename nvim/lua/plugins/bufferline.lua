return
{
  "akinsho/bufferline.nvim",
  event = { "UIEnter" },
  --[[keys = {
    { ",t",      "<Cmd>BufferLineTogglePin<CR>",                            desc = "Toggle pin" },
  },]]
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
      --diagnostics_indicator = function(_, _, diag)
      --local icons = require("NeutronVim.core.icons").diagnostics
      --local ret = (diag.error and icons.Error .. " " .. diag.error .. " " or "")
      --.. (diag.warning and icons.Warning .. " " .. diag.warning or "")
      --return vim.trim(ret)
      --end,

      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
              or (e == "warning" and " " or " ")
          s = s .. n .. sym
        end
        return s
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer  ||  🔍",
          -- highlight = "Directory",
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
