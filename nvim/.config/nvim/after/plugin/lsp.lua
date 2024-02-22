local lsp = require('lsp-zero')
local builtin = require('telescope.builtin')

lsp.preset('recommended')

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = "",
    warn = "",
    hint = "",
    info = ""
  }
})

lsp.ensure_installed({ 'lua_ls' })

lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.on_attach(function(_, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
  vim.keymap.set("n", "gr", function() builtin.lsp_references() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

lsp.setup()
