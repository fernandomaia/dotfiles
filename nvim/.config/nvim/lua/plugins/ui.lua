return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
				override = {
					['vim.lsp.util.convert_input_to_markdown_lines'] = true,
					['vim.lsp.util.stylize_markdown'] = true,
					['cmp.entry.get_documentation'] = true,
				},
			},
      presets = {
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = { event  = "notify", find = "No information available" },
          opts = { skip = true },
        },
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {},
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
    end
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      file_types = { "markdown" },
      code = {
        style = "language",
        sign = false,
        border = "thick",
      },
    },
  },
}
