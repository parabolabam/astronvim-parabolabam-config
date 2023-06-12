return {
  "nvim-telescope/telescope.nvim",
  opts = function()
    return {
      pickers = {
        find_files = {
          theme = "dropdown",
        }
      }
    }
  end,
}
