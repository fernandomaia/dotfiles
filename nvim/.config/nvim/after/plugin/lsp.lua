local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.ensure_installed({
  'solargraph',
  'tsserver',
  'eslint',
})

lsp.setup()

