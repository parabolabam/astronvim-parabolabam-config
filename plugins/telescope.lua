return {
  "nvim-telescope/telescope.nvim",

  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim"
  },
  opts = function()
    return {
      defaults = {
        layout_strategy = 'bottom_pane',
        layout_config = {
          height = 0.75,
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
    require("telescope").load_extension("live_grep_args")
  end
}
