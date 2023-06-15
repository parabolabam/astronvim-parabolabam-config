return {
  {
    'mg979/vim-visual-multi',
    branch = 'master',
    event = "User AstroFile",
  },
  {
    'lewis6991/satellite.nvim',
    config = function()
      require('satellite').setup()
    end,
    event = "User Astrofile",
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require("astronvim.utils.status")
      opts.statusline = {
        -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { padding = { left = 1, right = 1 } } }, -- add the mode text
        status.component.git_branch(),
        status.component.file_info { filetype = {}, filename = false, file_modified = false },
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp(),
        status.component.treesitter(),
        status.component.nav(),
        -- remove the 2nd mode indicator on the right
      }

      return opts
      -- return the final configuration table
    end,
  },
  { "goolord/alpha-nvim" },
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  {
    "sindrets/diffview.nvim",
    event = "User Astrofile"
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { 'petertriho/nvim-scrollbar' },
}
