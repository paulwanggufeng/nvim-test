-- lazy.nvim specification.

return {
	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		enabled = true,
		cmd = "Telescope",

		dependencies = {
			"nvim-lua/plenary.nvim",
			"BurntSushi/ripgrep",
		},

		keys = function()
			local grep_current_word =
				"<cmd>lua require('telescope.builtin').grep_string{ on_complete = { function() vim.cmd\"stopinsert\" end } }<cr>"
			local current_file_search = "<cmd>lua require('telescope.builtin').live_grep{ search_dirs={\"%:p\"} }<cr>"
			local find_symbols = "<cmd>lua require('telescope.builtin').lsp_document_symbols({symbol_width = 0.8})<cr>"
			local find_w_symbols =
				"<cmd>lua require('telescope.builtin').lsp_dynamic_workspace_symbols({fname_width = 0.6, symbol_width = 0.2, limit=2000})<cr>"

			local cmdT = "<cmd>Telescope "
			local cmdL = "<cmd>lua require('telescope')."
			return {
				{ "<leader>fC", cmdT .. "commands<cr>" },
				{ "<leader>fF", cmdT .. "media_files<cr>" },
				{ "<leader>fM", cmdT .. "man_pages<cr>" },
				{ "<leader>fO", cmdT .. "oldfiles<cr>" },
				{ "<leader>fo", cmdT .. "oldfiles<cr>" },
				{ "<leader>fR", cmdT .. "registers<cr>" },
				{ "<leader>fS", cmdT .. "colorscheme<cr>" },

				{ "<leader>fb", cmdT .. "buffers<cr>" },
				{ "<leader>fd", cmdT .. "diagnostics<cr>" },
				{ "<leader>ff", cmdT .. "find_files<cr>" },
				{ "<leader>fg", cmdT .. "live_grep<cr>" },
				{ "<leader>fh", cmdT .. "help_tags<cr>" },

				{ "<leader>fi", cmdL .. "extensions.media_files.media_files()<cr>" },
				{ "<leader>fk", cmdT .. "keymaps<cr>" },
				{ "<leader>fl", cmdT .. "resume<cr>" },
				{ "<leader>fm", cmdT .. "marks<cr>" },
				{ "<leader>fp", cmdT .. "planets<cr>" },
				{ "<leader>fw", cmdT .. "grep_string<cr>" },

				{ "<leader>gC", cmdT .. "git_commits<cr>" },
				{ "<leader>gb", cmdT .. "git_branches<cr>" },
				{ "<leader>go", cmdT .. "git_status<cr>" },

				{ "<leader>LS", cmdT .. "lsp_dynamic_workspace_symbols<cr>" },
				{ "<leader>Ls", cmdT .. "lsp_document_symbols<cr>" },

				{ "<leader>fw", grep_current_word },
				{ "<leader>fs", current_file_search },
				{ "<F36>", find_symbols }, -- Ctrl + F12
				{ "<F48>", find_w_symbols }, -- Ctrl + Shit + F12,
			}
		end,

		opts = function(_, opts)
			local actions = require("telescope.actions")
			opts.defaults = {
				layout_config = { prompt_position = "top" },
				layout_strategy = "horizontal",
				mappings = {
					i = {
						["<c-j>"] = actions.move_selection_next,
						["<c-k>"] = actions.move_selection_previous,
					},
				},
				prompt_prefix = " ",
				selection_caret = " ",
				sorting_strategy = "ascending",
				winblend = 0,
			}
			opts.pickers = {
				colorscheme = { enable_preview = true },
			}
			opts.extensions = {
				file_browser = {
					hijack_netrw = true,
				},
			}
		end,

		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
		end,
	},
}
