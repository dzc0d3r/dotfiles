return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    -- "j-hui/fidget.nvim",
  },
  config = function()
    require("noice").setup({
      cmdline = {
        format = {
          cmdline = {
            title = " 👾👾👾 v.0X3111 👾👾👾 "
          },
        },
        enabled = true,
        view = "cmdline_popup",
      },
      --[[ views = {
          cmdline_popup = {
            border = {
              style = "none",
              padding = { 1, 2 },
            },
            filter_options = {},
            win_options = {
              winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
            },
          },
        }, ]]
      views = {
        cmdline_popup = {
          position = {
            row = 20,
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
          },
        },
        -- replace messages: example is lsp progress when view is set to "notify" so it show one notification window
        -- instead of multiple notifications
        notify = {
           replace = true
        },
      },
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      -- show lsp progress message in notify (powered by nvim-notify) instead of "mini"
      lsp = {
        progress = {
          enabled = true,
          view = "notify", -- default: "mini"
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
        }
      },
    })
  end,
}
