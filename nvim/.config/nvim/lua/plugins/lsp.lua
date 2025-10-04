return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "html",
        "cssls",
        "tailwindcss",
      },
    },
    dependencies = {
      {
        "mason-org/mason.nvim",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗"
            },
          },
        },
      },
      "neovim/nvim-lspconfig",
    },
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Set default capabilities for all LSP servers
      vim.lsp.config("*", {
        capabilities = capabilities,
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    opts = {}
  }
}
