return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.bars-and-lines.lualine-nvim" },
  { import = "astrocommunity.scrolling.cinnamon-nvim" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "120",
      disabled_filetypes = { "help" },
    },
  },
}
