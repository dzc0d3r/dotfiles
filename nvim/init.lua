-- Bootstrap lazy.nvim (folke/lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Load options and plugins
require("options")
require("lazy").setup("plugins")

-- Load mappings
local mappings = require("mappings")
mappings.general_keymaps() -- General key mappings
mappings.plugin_keymaps()  -- Plugin-specific key mappings
-- After lazy.nvim has loaded plugins, load telescope mappings
vim.defer_fn(function()
  -- takes one arg, true if you want to show a fortune cookie using fortune if installed on OS telescope_keymaps(true)
  mappings.telescope_keymaps()
end, 0)
