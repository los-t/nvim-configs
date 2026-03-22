vim.pack.add({
  'https://github.com/hrsh7th/cmp-nvim-lsp.git',
  'https://github.com/hrsh7th/cmp-buffer.git',
  'https://github.com/hrsh7th/cmp-path.git',
  'https://github.com/hrsh7th/cmp-cmdline.git',
  'https://github.com/L3MON4D3/LuaSnip.git',
  'https://github.com/saadparwaiz1/cmp_luasnip.git',
  'https://github.com/hrsh7th/nvim-cmp.git',
})


local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
cmp.setup({
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
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
    -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<C-n'] = cmp.mapping.select_next_item(),
    ['<C-p'] = cmp.mapping.select_prev_item(),
    ['<C-y>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if #cmp.get_entries() == 1 then
          cmp.confirm({ select = true })
        else
          cmp.select_next_item()
        end
      elseif has_words_before() then
        cmp.complete()
        if #cmp.get_entries() == 1 then
          cmp.confirm({ select = true })
        end
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
})
