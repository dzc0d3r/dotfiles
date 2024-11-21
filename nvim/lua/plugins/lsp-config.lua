local servers = { 'clangd', 'rust_analyzer', 'pyright', 'ts_ls', 'gopls', 'tailwindcss', 'lua_ls'  }
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
end

return {

  { 
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
   
  -- mason-lspconfig
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
    
      for _, lsp in ipairs(servers) do
              require('lspconfig')[lsp].setup {
              on_attach = on_attach,
              capabilities = capabilities,
              }
    
      end
    end
    

  }

}



