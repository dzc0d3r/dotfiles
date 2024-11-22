-- Import the mappings
local mappings = require('mappings')

-- LSP servers to be installed and configured
local servers = {
  'ts_ls', 'html', 'cssls', 'clangd', 'rust_analyzer',
  'pyright', 'gopls', 'tailwindcss', 'lua_ls'
}

-- Define capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- On attach function
local function on_attach(_, bufnr)
  mappings.lsp_keymaps(bufnr)
end

-- Plugins configuration
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end
    end
  }
}
