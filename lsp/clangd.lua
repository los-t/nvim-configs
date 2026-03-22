return {
  cmd = {
    "clangd",
    "--background-index",
    "--background-index-priority=low",
    "--clang-tidy",
    "--rename-file-limit=0",
    "--limit-references=0",
    "--header-insertion=never",
    "--all-scopes-completion",
    "--query-driver=*devtools*",
  },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_markers = {
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    '.git',
  },
}
