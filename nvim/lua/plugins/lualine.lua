local colors = {
  blue  = '#80a0ff',
  cyan  = '#79dac8',
  black = '#080808',
  white = '#c6c6c6',
  red   = '#ff5189',
  teal  = '#4CCD99',
  grey  = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.blue },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.teal } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require('lualine').setup {
      options = {
        theme = bubbles_theme, -- 'auto'
        component_separators = '|',
        section_separators = { left = '', right = '' },

      },
      sections = {
        lualine_x = {
          {
            require("noice").api.statusline.mode.get,
            cond = require("noice").api.statusline.mode.has,
            --color = { fg = "#ff9e64" },
          }
        },
        lualine_b = { 'filename', 'branch' },
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_c = {
          '%=', --[[ add your center compoentnts here in place of this comment ]]
        },
        lualine_y = { 'filetype', 'progress' },
        lualine_z = {

          { 'location', separator = { right = '' }, left_padding = 2 },
        },

      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end,
}
