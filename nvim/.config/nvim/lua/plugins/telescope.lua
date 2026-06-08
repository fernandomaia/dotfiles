return {
  'nvim-telescope/telescope.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim', build = 'make'
    },
  },

  config = function()
    require('telescope').setup({})

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<leader>pf',
      function()
        builtin.find_files({
          hidden = true,
          no_ignore = false,
        })
      end,
      { desc = 'Lists files in your current working directory, respects .gitignore' }
    )
    vim.keymap.set('n', '<C-p>',
      function()
        builtin.git_files()
      end,
      { desc = 'Fuzzy search through the output of `git ls-files` command, respects .gitignore' }
    )
    vim.keymap.set('n', '<leader>ps',
      function()
        builtin.live_grep()
      end,
      { desc = 'Search for a string in your current working directory and get results live as you type, respects .gitignore' }
    )
    vim.keymap.set('n', '<leader>pS',
      function()
        local dir = vim.fn.input('Search dir: ', '', 'dir')
        if dir ~= '' then
          builtin.live_grep({ search_dirs = { dir } })
        end
      end,
      { desc = 'Live grep in a specific directory' }
    )
    vim.keymap.set('n', '<leader>pb',
      function()
        builtin.buffers()
      end,
      { desc = 'Lists open buffers' }
    )
    vim.keymap.set('n', '<leader>ph',
      function()
        builtin.help_tags()
      end,
      { desc = 'Lists available help tags and opens a new window with the relevant help info on <cr>' }
    )
  end
}
