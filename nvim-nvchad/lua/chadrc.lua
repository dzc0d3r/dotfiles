local M = {}

M.ui = {
  theme = 'catppuccin',
  hl_override = {
    NvDashAscii = {
      fg = 'cyan',
      bg = 'none'
    },
    NvDashButtons = {
      fg = 'light_gray',
      bg = 'none'
    }
  },
  nvdash = {
    -- Dashboard
    load_on_startup = true,
    colorizer = false
  }
}

return M
