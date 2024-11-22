vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus")
vim.g.mapleader = " "

vim.g.background = "light"
vim.cmd("set number")

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.wo.number = false
vim.opt.termguicolors = true
vim.o.termguicolors = true

vim.api.nvim_create_autocmd("VimEnter", { command = "set nornu nonu", }) -- add: "| Neotree toggle" to the command. if you want
vim.api.nvim_create_autocmd("BufEnter", { command = "set nornu nu", })

-- Rounded border for Documentations
vim.diagnostic.goto_next({ float = { border = 'rounded' } })
vim.diagnostic.config({
  float = { border = "rounded" },
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})

-- Adds filetype recognition for .tact files
vim.filetype.add({
  extension = {
    tact = "tact",
  }
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

vim.defer_fn(function()
  vim.cmd.colorscheme("tokyonight-night")
end, 0)
