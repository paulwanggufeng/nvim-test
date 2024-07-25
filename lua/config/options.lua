-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

local options = {
	-- 行号
	number = true, -- Print line number
	relativenumber = true, -- Relative line numbers

	-- 缩进
	tabstop = 4,
	shiftwidth = 4, -- Size of an indent
	shiftround = true, -- Round indent
	expandtab = true, -- Use spaces instead of tabs
	scrolloff = 4, -- Lines of context
	autoindent = true,
	smartindent = true,

	sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" },
	showmode = false, -- Dont show mode since we have a statusline
	sidescrolloff = 8, -- Columns of context
	updatetime = 200, -- Save swap file and trigger CursorHold
	virtualedit = "block", -- Allow cursor to move where there is no text in visual block mode
	wildmode = "longest:full,full", -- Command-line completion mode
	winminwidth = 5, -- Minimum window width

	-- 防止包裹
	wrap = true,

	cursorline = true, -- Enable highlighting of the current line
	mouse = "a", -- Enable mouse mode
	clipboard = "unnamedplus", -- system clipboard

	-- 默认新窗口右和下
	splitright = true,
	splitbelow = true,

	-- 搜索
	hlsearch = true,
	incsearch = true,
	ignorecase = true, -- Ignore case
	smartcase = true,
	inccommand = "nosplit", -- preview incremental substitute
	laststatus = 3, -- global statusline

	grepformat = "%f:%l:%c:%m",
	grepprg = "rg, --vimgrep",

	-- 外观
	termguicolors = true, -- True color support
	signcolumn = "yes", -- Always show the signcolumn, otherwise it would shift the text each time

	complete = { ".", "w", "b", "u", "t", "i", "kspell" },
	completeopt = "menu,menuone,noselect",
	confirm = true, -- Confirm to save changes before exiting modified buffer
	formatoptions = "jcroqlnt", -- tcqj

	-- Buffers/Tabs/Windows
	-- bdelete, BufDel require hidden
	hidden = true,

	fillchars = {
		foldopen = "",
		foldclose = "",
		-- fold = "⸱",
		fold = " ",
		foldsep = " ",
		diff = "╱",
		eob = " ",
	},

	-- 文件编码
	encoding = "utf-8",

	swapfile = false,
	autoread = true,

	-- Folding
	foldlevel = 99,
	foldmethod = "manual",
}

for k, v in pairs(options) do
	vim.opt[k] = v
end


if vim.bo.modifiable then
  vim.opt.fileencoding = "utf-8"
else
  print("current buffer is not modifiable, skip setting fileencoding to utf-8")
end

-- commands
vim.cmd([[filetype plugin indent on]])
vim.cmd([[set nocompatible]]) -- for vimwiki

local opt = vim.opt
opt.shortmess:append({ W = true, I = true, c = true, C = true })

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end
