return {
  -- Nvimtree (File Explorer)
  -- Added this reference to the initial file
  {
    'nvim-tree/nvim-tree.lua',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>e', ':NvimTreeToggle<CR>' },
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
}
