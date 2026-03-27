vim.pack.add({
  'https://github.com/nvim-treesitter/nvim-treesitter.git',
  'https://github.com/nvim-treesitter/nvim-treesitter-context.git',
  'https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git',
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'nvim-treesitter' and kind == 'update' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end
})

-- require('nvim-treesitter').setup({}) -- NB: nothing there but install dir yet
require('nvim-treesitter').install({
  'diff',
  'c',
  'cpp',
  'objc',
  'hlsl',
  'glsl',
  'squirrel',
  'lua',
  'cmake',
  'json',
  'yaml',
  'toml',
  'gitcommit',
  'gitignore',
  'git_config',
  'git_rebase',
  'markdown',
  'markdown_inline',
  'zsh',
  'bash',
  'python',
})

-- must start manually now, sigh...
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    local filetype = vim.bo.filetype
    if filetype and filetype ~= '' then
      pcall(vim.treesitter.start)
    end
  end,
})
