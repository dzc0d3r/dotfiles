return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
  },
  config = function()
    -- nvim-cmp setup
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup({
      window = {
        completion = cmp.config.window.bordered(), -- Optional: Add borders to the completion menu
        documentation = cmp.config.window.bordered({
          border = 'rounded',                      -- Optional: Rounded borders for the documentation window
          winhighlight = 'Normal:CmpDocumentation,FloatBorder:CmpDocumentationBorder',


        }),
      },
      view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'luasnip',  priority = 1100 },
        { name = "neorg",    priority = 1200 },
      },
    })
  end
}
