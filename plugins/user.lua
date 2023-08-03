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
      local lualine = require('lualine');
      local lualineConfig = require "user.plugins.configs.lualine-config".config();

      lualine.setup(lualineConfig);
    end
  },
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
        -- vim.cmd([[colorscheme gruvbox-flat]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
    end,
  },
  {
    "sainnhe/everforest",
    event = "User AstroFile",
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "User AstroFile",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "User AstroFile",
    opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    }
  },
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme miasma")
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
}
