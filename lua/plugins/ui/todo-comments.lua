return {
  "folke/todo-comments.nvim",
  enabled = true,
  event = { "BufReadPost", "BufNewFile" },

  opts = function(_, opts)
    opts.merge_keywords = true
    opts.keywords = {
      TBD = { icon = " ", color = "warning" },
    }
  end,

}
