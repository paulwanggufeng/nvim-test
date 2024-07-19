return {
	"vimwiki/vimwiki",
  enable = false,
	init = function()
		vim.g.vimwiki_list = {
			{
				path = "~/docs/vimwiki",
				syntax = "default",
				ext = ".wiki",
			},
		}
	end,
	keys = {
		-- { "<leader>pw", "<cmd>edit " .. os.getenv("WIKIHOME") .. "/index.md<cr>", "Personal Wiki" },
		{ "<leader>we", "<cmd>WikiExport<cr>", "Wiki Export" },
		{ "<leader>wi", "<cmd>WikiIndex<cr>", "Wiki Index" },
		{ "<leader>wj", "<cmd>WikiJournal<cr>", "Wiki Journal" },
		{ "<leader>wp", "<cmd>WikiFzfPages<cr>", "Wiki FzF Pages" },
	},
}
