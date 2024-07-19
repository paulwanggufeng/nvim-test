return {
  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "transparent",
        floats = "transparent",
        -- hide_inactive_statusline = true,
        lualine_bold = true,
      }
    },

    config = function(_, opts)
      require("tokyonight").setup(opts)
      -- tokyonight-night, tokyonight-storm, tokyonight-day, tokyonight-moon
      vim.cmd.colorscheme("tokyonight-moon")
    end,
  },
}
