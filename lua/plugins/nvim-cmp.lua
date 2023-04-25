return {
  'hrsh7th/nvim-cmp',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  event = 'InsertEnter',
  config = function()
    vim.o.completeopt = "menuone,noselect,menu"

    local luasnip = require'luasnip'
    local cmp = require'cmp'
    cmp.setup({
      snippet = {
        expand = function(args)
          require'luasnip'.lsp_expand(args.body)
        end
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      }),
      mapping = cmp.mapping.preset.insert({ -- copy-pasted from example
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ['<C-n'] = cmp.mapping.select_next_item(),
      ['<C-p'] = cmp.mapping.select_prev_item(),
    }),
  })
  end,
}

