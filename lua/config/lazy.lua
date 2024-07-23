require("lazy").setup({
  spec = {
		-- { "LazyVim/LazyVim", import = "lazyvim.plugins" },
		--
		-- -- LazyVim plugins I Use.
		-- { import = "lazyvim.plugins.extras.dap.core" },
		-- { import = "lazyvim.plugins.extras.lang.clangd" },
		-- { import = "lazyvim.plugins.extras.lang.json" },
		-- { import = "lazyvim.plugins.extras.lang.python" },
		-- { import = "lazyvim.plugins.extras.lang.yaml" },
		-- -- { import = "lazyvim.plugins.extras.lang.cmake" },
		-- { import = "lazyvim.plugins.extras.lsp.none-ls" },
		--
		-- -- LazyVim plugins I don't use.
		-- { import = "plugins.disabled" },

		{ import = "plugins.cmp" },
		{ import = "plugins.coding" },
		{ import = "plugins.finder" },
		{ import = "plugins.syntax" },
		{ import = "plugins.ui" },
		{ import = "plugins.util" },
	},

	defaults = {
		lazy = false,
		version = false,
		autocmds = false,
		keymaps = false,
	},

	install = { colorscheme = { "tokyonight", "habamax" } },

	checker = { enabled = true, notify = false, frequency = 86400 },

	change_detection = {
		enable = true,
		notify = false,
	},

	performance = {
		cache = { enabled = true },
		rtp = {
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},

	-- ui = {
	--   border = "rounded",
	--   title = "lazy.nvim",
	-- },
})
