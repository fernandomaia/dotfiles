local lsp = require('lsp-zero')

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

lsp.ensure_installed({
  'solargraph',
  'tsserver',
  'eslint',
})

lsp.setup()
