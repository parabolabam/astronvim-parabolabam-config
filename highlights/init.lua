return function()
  local get_hlgroup = require("astronvim.utils").get_hlgroup
  local nontext = get_hlgroup "NonText"
  local get_hlgroup = require("astronvim.utils").get_hlgroup
  -- get highlights from highlight groups
  local normal = get_hlgroup "Normal"
  local fg, bg = normal.fg, normal.bg
  local bg_alt = get_hlgroup("Visual").bg
  local green = get_hlgroup("String").fg
  local red = get_hlgroup("Error").fg

  return {
    CursorLineFold = { link = "CursorLineNr" },                    -- highlight fold indicator as well as line number
    GitSignsCurrentLineBlame = { fg = nontext.fg, italic = true }, -- italicize git blame virtual text
    HighlightURL = { underline = true },                           -- always underline URLs
    OctoEditable = { fg = "NONE", bg = "NONE" },


    TelescopePreviewTitle = { fg = bg, bg = green },
    TelescopePromptTitle = { fg = bg, bg = red },
    TelescopeResultsTitle = { fg = bg, bg = red }, -- use treesitter for octo.nvim highlighting
  }
end
