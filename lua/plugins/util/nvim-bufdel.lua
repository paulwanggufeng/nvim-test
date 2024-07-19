return {
  "ojroques/nvim-bufdel",
  lazy = false,
  keys = {
    { "<leader>bd", "<Cmd>BufDel<CR>", desc = "Buffer Delete" },
  },
  config = function()
    require("bufdel").setup({
      quit = false,
    })
  end,
}
