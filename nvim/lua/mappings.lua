
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
-- neo-tree mappings 
map("n", "<leader>e", ":Neotree focus<CR>", {})
map("n", "<C-n>", ":Neotree toggle<CR>", {})
map("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
map("n", "<leader>gf", ":Neotree float git_status", {})

-- zenmode
map("n", "<leader>z", ":ZenMode <CR>", {})



-- trouble 
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
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


map("n", "<leader>th", ":Telescope colorscheme theme=dropdown <CR>", {desc = "Telescope Choose a theme" })

map("n", "<leader>q", "<cmd>:q <cr>", {desc = "Quit" })
