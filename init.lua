vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

-- Bootstrap using lazy.nvim package manager.
require("core.bootstrap")

-- Personalize Neovim.
require("config.lazy")
require("config.options")
require("config.autocmds")
require("config.keymaps")

-- require("plugins.lsp.lsp")

-- -- Defer treesitter until after first render.
-- require("core.treesitter")

-- -- LSP configure.
-- require("lsp.servers")
