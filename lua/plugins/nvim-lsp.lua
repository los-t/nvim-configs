return {
  'neovim/nvim-lsp',
  config = function()
    local caps = require'cmp_nvim_lsp'.default_capabilities()
    require'lspconfig'.clangd.setup{
      cmd = {
        "clangd",
        "--background-index",
        "--background-index-priority=low",
        "--clang-tidy",
        "--rename-file-limit=0",
        "--limit-references=0",
        "--header-insertion=never",
        "--all-scopes-completion",
      },
      capabilities = caps,
    }
    require'lspconfig'.tsserver.setup{ capabilities = caps }
    require'lspconfig'.lua_ls.setup{
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            preloadFileSize = 65536,
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              "${3rd}/luv/library",
              "${3rd}/busted/library",
            }
          }
        })
      end,
      settings = {
        Lua = {}
      }
    }
  end,
}
