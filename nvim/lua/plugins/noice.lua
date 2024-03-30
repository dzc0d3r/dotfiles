return  {
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
        views = {
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
        },
      })
      end,
}