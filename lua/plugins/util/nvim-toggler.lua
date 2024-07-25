return {
  -- 自动反转当前值
  "nguyenvukhang/nvim-toggler",
  enabled = true,
  event = { "BufReadPost", "BufNewFile" },

  config = function(_, opts)
    local toggler = require("nvim-toggler")

    toggler.setup({
      inverses = {
        [">="] = "<=",
        [">"] = "<",
      },
      remove_default_keybinds = true,
      remove_default_inverses = false,
    })

    vim.keymap.set({ 'n', 'v' },
      '<leader>tn', toggler.toggle,
      { noremap = true, silent = true, desc = "Toggle operand" }
    )
  end,
}
