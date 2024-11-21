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



-- Adds filetype recognition for .tact files
vim.filetype.add({
  extension = {
    tact = "tact",
  }
})

vim.api.nvim_create_autocmd("VimEnter", {
  command = "set nornu nonu | Neotree toggle",
})
vim.api.nvim_create_autocmd("BufEnter", {
  command = "set nornu nu",
})

-- Auto-Close Neovim if Only Neo-Tree is Open
vim.api.nvim_create_autocmd("BufEnter", {
    group = vim.api.nvim_create_augroup("AutoCloseNeoTree", { clear = true }),
    pattern = "Neotree",
    callback = function()
        if #vim.api.nvim_list_wins() == 1 then
            vim.cmd("quit")
        end
    end,
})


-- Load options and plugins
require("options")
require("mappings")
require("lazy").setup("plugins")






