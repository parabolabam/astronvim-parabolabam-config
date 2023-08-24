local colorschemes = require "user.plugins.colorschemes.schemes"

local plugins =  {
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
      local lualineConfig = require "user.plugins.configs.lualine-config";

      lualine.setup(lualineConfig);
    end
  },
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  {
    "sindrets/diffview.nvim",
    event = "User Astrofile"
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
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  },
  {
    "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          -- ["vim.lsp.hover."] = true,
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },

         hover = {
          enabled = false,
          silent = false, -- set to true to not show a message if hover is not available
          view = nil, -- when nil, use defaults from documentation
          ---@type NoiceViewOptions
          opts = {}, -- merged with defaults from documentation
        },
        signature = {
          enabled = false
        }
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
    }
  },
  {
    'MunifTanjim/nui.nvim'
  },
 }

for _,v in ipairs(colorschemes) do
  table.insert(plugins, v)
end

return plugins
