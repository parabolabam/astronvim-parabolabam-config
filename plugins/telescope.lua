return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  opts = function()
    return {
      defaults = {
        layout_strategy = 'bottom_pane',
        layout_config = {
          height = 0.75,
        },
        file_ignore_patterns = {
			    "node_modules",
			    "build",
			    "dist",
			    "yarn.lock",
			    "package-lock.json",
			  },
      },
      pickers = {
        live_grep = {
          additional_args = function(opts)
            return {"--hidden"}
          end
        },
      },
    }
  end,
  config = function()
    require("telescope").load_extension("live_grep_args");
    require("telescope").load_extension("file_browser");
  end
}
