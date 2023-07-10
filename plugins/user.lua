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
    {
      "folke/tokyonight.nvim",
      lazy = false,
      opts = {
        transparent = true,
        styles = {
          sidebars = "transparent",
          floats = "transparent",
        },
      },
    }
  },
  { 'petertriho/nvim-scrollbar' },
  {
    'prettier/vim-prettier',
    lazy = false,
    config = function()
    end
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
        }
      })
      end,
  },
  {
    'eddyekofo94/gruvbox-flat.nvim',
    priority = 1000,
    enabled = true,
    lazy = false,
    config = function()
        vim.cmd([[colorscheme gruvbox-flat]])
    end,
  },
}
