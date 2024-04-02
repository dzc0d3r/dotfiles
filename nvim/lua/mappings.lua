
-- neo-tree mappings
vim.keymap.set("n", "<leader>e", ":Neotree focus<CR>", {})
vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", {})
vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
vim.keymap.set("n", "<leader>gf", ":Neotree float git_status", {})

-- zenmode
vim.keymap.set("n", "<leader>z", ":ZenMode <CR>", {})



-- trouble 
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
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
  vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
end


vim.keymap.set("n", "<leader>th", ":Telescope colorscheme theme=dropdown <CR>", {desc = "Telescope Choose a theme" })

