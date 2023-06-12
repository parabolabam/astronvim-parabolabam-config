return {
  --   'lewis6991/satellite.nvim',
  --   config = function()
  --     require('satellite').setup()
  --   end,
  --   event = "User Astrofile",
  -- }
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

      -- return the final configuration table
      return opts
    end,
  },
  { "goolord/alpha-nvim" },
  { 'akinsho/git-conflict.nvim', version = "*", config = true },
  {
    "jake-stewart/jfind.nvim",
    keys = {
      { "<c-f>" },
    },
    config = function()
      require("jfind").setup({
        exclude = {
          ".git",
          ".idea",
          ".vscode",
          ".sass-cache",
          ".class",
          "__pycache__",
          "node_modules",
          "target",
          "build",
          "tmp",
          "assets",
          "dist",
          "public",
          "*.iml",
          "*.meta"
        },
        border = "rounded",
        tmux = true,
        formatPaths = true,
        key = "<c-f>"
      });
    end
  },
  {
    "sindrets/diffview.nvim",
    event = "User Astrofile"
  }
}
