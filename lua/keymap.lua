local bind = function(mode, lhs, rhs)
  vim.api.nvim_set_keymap(mode, lhs, rhs, { noremap=true, silent=true })
end

bind("n", "<leader>l", ":Telescope buffers<CR>")
bind("n", "<leader>f", ":Telescope git_files<CR>")
bind("n", "<leader>*", ":Telescope grep_string<CR>")

bind("n", "<leader>gb", ":Telescope git_bcommits<CR>")
bind("n", "<leader>gl", ":Telescope git_commits<CR>")
bind("n", "<leader>gs", ":Telescope git_stash<CR>")
bind("n", "<leader>gd", ":Telescope git_status<CR>")

bind("n", "<leader>r", ":Telescope lsp_references<CR>")
bind("n", "<leader>s", ":Telescope lsp_dynamic_workspace_symbols<CR>")

bind("n", "<leader>nh", ":nohls<CR>")
bind("n", "<leader>cd", ":lcd %:p:h<CR>")

bind("n", "<C-h>", "<C-w>h")
bind("n", "<C-j>", "<C-w>j")
bind("n", "<C-k>", "<C-w>k")
bind("n", "<C-l>", "<C-w>l")

bind("n", "gd", "<cmd>lua vim.lsp.buf.declaration()<CR>")
bind("n", "<C-]>", "<cmd>lua vim.lsp.buf.definition()<CR>")
bind("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
bind("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>")
bind("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
bind("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
bind("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
bind("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
bind("n", "<leader>gf", "<cmd> lua vim.lsp.buf.format()<CR>")
bind("n", "<leader>o", "<cmd>lua vim.diagnostic.open_float(0, {scope=\"line\", border=\"single\"})<CR>")

bind("n", "-", ":FileBeagleBufferDir<CR>")
bind("n", "<leader>e", ":vsplit<bar>FileBeagleBufferDir<CR>")

bind("t", "<Esc>", "<C-\\><C-n>")
if (vim.fn.has("win32")) then
  bind("n", "<leader>tb", ":vsplit<bar>term git-bash.exe<CR>i")
  bind("n", "<leader>tw", ":vsplit<bar>term<CR>i")
  bind("n", "<leader>tl", ":vsplit<bar>term bash -i<CR>i")
else
  bind("n", "<leader>tb", ":vsplit<bar>term<CR>i")
end
