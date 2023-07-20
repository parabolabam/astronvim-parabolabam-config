return {
  "nvim-telescope/telescope.nvim",
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
}
