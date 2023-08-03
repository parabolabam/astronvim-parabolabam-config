return {
  "goolord/alpha-nvim",
  opts = function(_, opts) -- override the options using lazy.nvim
    opts.section.header.val = { -- change the header section value
      "DON'T YOU DO SHIT, MAN?",
      "DON'T YOU DO SHIT, MAN?",
      "DON'T YOU DO SHIT, MAN?"

    }
  end,
}

