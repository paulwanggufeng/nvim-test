return {
  "windwp/nvim-autopairs",
  event = { "BufReadPost", "BufNewFile" },
  enabled = true,
  opts = {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
    },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
      -- highlight = "Search",
      -- highlight_grey = "Comment",
    },
  },
}
