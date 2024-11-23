-- lua/config/mappings.lua
local M = {}

-- General Keymaps
function M.general_keymaps()
  local map = vim.keymap.set
  map("n", ";", ":", { desc = "CMD: Enter command mode" })
  map("i", "jk", "<ESC>", { desc = "Escape insert mode" })
  map("n", "<leader>lf", "<cmd>:Format<cr>", { desc = "LSP Format current file." })
  map('n', '<leader>i', function() vim.cmd('normal! gg=G') end, { desc = "Indent entire file" })

  -- Telescope
  map("n", "<leader>th", ":Telescope colorscheme theme=dropdown <cr>", { desc = "Telescope: Choose a theme" })

  -- Quit
  map("n", "<leader>q", "<cmd>:q <cr>", { desc = "Quit" })
  map("n", "<leader>Q", "<cmd>:qa <cr>", { desc = "Quit All" })
end

-- Plugin-Specific Keymaps
function M.plugin_keymaps()
  local map = vim.keymap.set

  -- BufferLine
  map("n", ",t", "<Cmd>:BufferLineTogglePin<CR>", { desc = "Toggle pin" })
  map("n", ",P", "<Cmd>:BufferLineGroupClose ungrouped<CR>", { desc = "Delete non-pinned buffers" })
  map("n", ",o", "<Cmd>:BufferLineCloseOthers<CR>", { desc = "Delete other buffers" })
  map("n", ",r", "<Cmd>:BufferLineCloseRight<CR>", { desc = "Delete buffers to the right" })
  map("n", ",l", "<Cmd>:BufferLineCloseLeft<CR>", { desc = "Delete buffers to the left" })
  map("n", ",p", "<Cmd>:BufferLinePick<CR>", { desc = "Pick buffer" })
  map("n", "]b", "<Cmd>:BufferLineCycleNext<CR>", { desc = "Next buffer" })
  map("n", "[b", "<Cmd>:BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
  map("n", "<Tab>", "<Cmd>:BufferLineCycleNext<CR>", { desc = "Next buffer" })
  map("n", "<S-Tab>", "<Cmd>:BufferLineCyclePrev<CR>", { desc = "Prev buffer" })

  -- Git Signs
  map("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
  map("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {})

  -- Neo-tree
  map("n", "<leader>e", ":Neotree focus<cr>", {})
  map("n", "<C-n>", ":Neotree toggle<cr>", {})
  map("n", "<leader>nf", ":Neotree float <cr>", { desc = "Floating Neo-tree" })

  -- ZenMode
  map("n", "<leader>z", ":ZenMode <cr>", {})

  -- Trouble
  map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle win.type=split win.position=left focus=true <cr>", {})
  map("n", "<leader>xf", "<cmd>Trouble diagnostics toggle focus=true win.type=split win.position=left filter.buf=0<cr>",
    {})
  -- noice
  map("n", "<leader>nd", "<cmd>Noice dismiss<cr>", { desc = "Dismiss current message show by noice" })
end

function M.telescope_keymaps(show_fortune)
  local show = show_fortune or false
  if show == true then
    if vim.fn.executable("fortune") == 1 then
      -- Run the fortune command and store the output
      local fortune_output = vim.fn.system("fortune -s -n 60")

      -- Print the fortune message to Neovim's command line
      print(" 😎 " .. fortune_output)
    end
  end
  local ok, builtin = pcall(require, "telescope.builtin")
  if not ok then
    vim.notify("Telescope is not loaded", vim.log.levels.WARN)
    return
  end

  local map = vim.keymap.set
  map("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
  map("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
  map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
  map("n", "<leader>fo", builtin.oldfiles, { desc = "Old Files" })
  map("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
end

-- LSP-Specific Keymaps
function M.lsp_keymaps(bufnr)
  local map = vim.keymap.set

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end
    map('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

  -- Create a `:Format` command
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

return M
