local dap = require('dap')

local lldb_host = '127.0.0.1'
local lldb_port = 35678

dap.configurations.cpp = {
  {
    name = 'Debug',
    type = 'lldb',
    request = 'launch',
    host = lldb_host,
    port = lldb_port,
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},
  },
}

dap.adapters.lldb = function(callback, config)
  callback({type = 'server', host = config.host, port = config.port})
end
