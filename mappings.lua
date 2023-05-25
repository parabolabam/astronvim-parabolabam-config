local astro_utils = require "astronvim.utils"

local mappings = {
  n = {
    -- better buffer navigation
    ["<Tab>"] = {
      function()
        if #vim.t.bufs > 1 then
          require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
        else
          astro_utils.notify "No other buffers open"
        end
      end,
      desc = "Switch Buffers",
    },
    ["<C-j>"] = { "<cmd>m .+1<CR>", desc = "move line down" },
    ["<C-k>"] = { "<cmd>m .-2<CR>", desc = "move line up" },
  }
}

return mappings
