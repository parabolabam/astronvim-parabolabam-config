return {
  { 'junegunn/seoul256.vim', lazy = false },
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
  },
  {
    'eddyekofo94/gruvbox-flat.nvim',
    enabled = true,
    lazy = false,
    config = function()
      vim.g.gruvbox_flat_style = "hard"
      vim.g.gruvbox_italic_functions = true
      vim.g.gruvbox_transparent = true
      vim.cmd([[colorscheme gruvbox-flat]])
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
       return {
        integrations = {
          sandwich = false,
          noice = true,
          mini = true,
          leap = true,
          markdown = true,
          neotest = true,
          cmp = true,
          overseer = true,
          lsp_trouble = true,
          rainbow_delimiters = true,
        },
      }
    end,
  },
  {
    "sainnhe/everforest",
    event = "User AstroFile",
  },
  {
    "xero/miasma.nvim",
    lazy = false,
    config = function()
      vim.cmd("colorscheme miasma")
    end,
  },
  {
    "lalitmee/cobalt2.nvim",
    lazy = false, -- if you want to lazy load
  },
}
