local map = vim.keymap.set
local map = vim.keymap.set



map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- neo-tree mappings
map("n", "<leader>e", ":Neotree focus<cr>", {})
map("n", "<C-n>", ":Neotree toggle<cr>", {})
map("n", "<leader>bf", ":Neotree buffers reveal float<cr>", {})
map("n", "<leader>gf", ":Neotree float git_status", {})

-- zenmode
map("n", "<leader>z", ":ZenMode <cr>", {})



-- trouble
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle win.type=split win.position=right focus=true <cr>",
  { silent = true, noremap = true }
)
map("n", "<leader>xf", "<cmd>Trouble diagnostics toggle focus=true win.type=split win.position=right filter.buf=0<cr>",
 { silent = true, noremap = true }
)
map("n", "<leader>xd", "<cmd>Trouble toggle document_diagnostics<cr>",
  { silent = true, noremap = true }
)
map("n", "<leader>xl", "<cmd>Trouble toggle loclist<cr>",
  { silent = true, noremap = true }
)
map("n", "<leader>xq", "<cmd>Trouble toggle quickfix<cr>",
  { silent = true, noremap = true }
)
map("n", "gR", "<cmd>Trouble toggle lsp_references<cr>",
  { silent = true, noremap = true }
)
-- Diagnostic signs
-- https://github.com/folke/trouble.nvim/issues/52
local signs = {
  Error = " ",
  Warning = " ",
  Hint = " ",
  Information = " "
}
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


map("n", "<leader>th", ":Telescope colorscheme theme=dropdown <cr>", { desc = "Telescope Choose a theme" })

--map("n", "<leader>q", "<cmd>:q <cr>", { desc = "Quit" })

map("n", "<leader>Q", "<cmd>:qa <cr>", { desc = "Quit All" })
map("n", "<leader>nf", ":Neotree float <cr>", { desc = "Floating Neotree " })

vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, {})
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {})
