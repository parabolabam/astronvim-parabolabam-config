return {
  "lewis6991/gitsigns.nvim",
  enabled = vim.fn.executable "git" == 1,
  event = "User AstroGitFile",
  opts = {
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 100,
      ignore_whitespace = false,
    }
  },
}
