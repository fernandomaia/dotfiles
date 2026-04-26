return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  lazy = false,
  branch = 'main',
  config = function()
    local ts = require('nvim-treesitter')

    ts.setup()
    local ensure_installed = {
      'vim',
      'vimdoc',
      'lua',
      'ruby',
      'embedded_template',
      'bash',
      'javascript',
      'typescript'
    }
    ts.install(ensure_installed)

    vim.api.nvim_create_autocmd('FileType', {
      pattern = ensure_installed,
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)

        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.wo.foldmethod = 'expr'
        vim.wo.foldlevel = 99
        vim.bo[args.buf].indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end
}
