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

    -- Gitsigns
    ["<leader>gj"] = { function() require("gitsigns").next_hunk() end, desc = "Next git hunk" },
    ["leader>gk"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous git hunk" },
    ["leader>gl"] = { function() require("gitsigns").blame_line() end, desc = "View git blame" },
    ["leader>gp"] = { function() require("gitsigns").preview_hunk() end, desc = "Preview git hunk" },
    ["leader>gh"] = { function() require("gitsigns").reset_hunk() end, desc = "Reset git hunk" },
    ["leader>gr"] = { function() require("gitsigns").reset_buffer() end, desc = "Reset git buffer" },
    ["leader>gs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage git hunk" },
    ["leader>gu"] = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage git hunk" },
    ["<leader>gd"] = { function() require("gitsigns").diffthis() end, desc = "View git diff" },
    ["<C-b>"] = { 
      function()
        require("gitsigns").blame_line()
      end,
      desc = "Git blame"
    },

    -- Telescope
    ["<leader>fp"] = { function() require("telescope").extensions.projects.projects {} end, desc = "Find projects" },
    ["<leader>ff"] = { function() require("telescope.builtin").find_files({ hidden = true}) end, desc = "Find Files" },
    ["<leader>ggc"] = { function() require("telescope.builtin").git_commits() end, desc = "Find commit" },
    ["<c-f>"] = { function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find commit" },
    ["<leader>gc"] = { function() require("telescope.builtin").git_bcommits() end, desc =
    "Find commit for current buffer" },
    ["<leader>fd"] = {
      function()
        require("telescope._extensions.todo-comments").todo_comments()
      end,
      desc = "Find TODOs",
    },
    ["<leader>fg"] = {
      function() require('telescope').extensions.live_grep_args.live_grep_args() end,
      desc = "Search files with filetypes"
    },

    -- Spectre search/replace
    ["<leader>s"] = { desc = "󰛔 Search/Replace" },
    ["<leader>ss"] = { function() require("spectre").open() end, desc = "Spectre" },
    ["<leader>sf"] = { function() require("spectre").open_file_search() end, desc = "Spectre (current file)" },
    ["<leader>sw"] = {
      function() require("spectre").open_visual { select_word = true } end,
      desc = "Spectre (current word)",
    },

  },

  v = {

  },

  i = {
    ["<C-d>"] = { 
      function()
        local is_suggestion_visible = require('copilot.suggestion').is_visible();

        if is_suggestion_visible then
          require('copilot.suggestion').accept();
        end
      end
    }
  }

 }

return mappings
