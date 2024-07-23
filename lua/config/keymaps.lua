-- 命令
local Keymap = vim.keymap.set


vim.cmd([[
  cnoreabbrev Q qa
  vnoremap <C-c> "*y
]])

-- quickfix 窗口总是显示在最下面
-- wincmd foo is equivalent with typing ^W foo, and CTRL-W_J moves the current window to the very bottom.
-- au FileType qf executes this for every file with the filetype "qf" (quickfix).
vim.cmd([[
au FileType qf wincmd J
]])

-- quicklist
vim.cmd([[
function! QuickFixOpenAll()
    if empty(getqflist())
        return
    endif
    let s:prev_val = ""
    for d in getqflist()
        let s:curr_val = bufname(d.bufnr)
        if (s:curr_val != s:prev_val)
            exec "edit " . s:curr_val
        endif
        let s:prev_val = s:curr_val
    endfor
endfunction
]])
vim.api.nvim_set_keymap('n', '<leader>ka', ':call QuickFixOpenAll()<CR>', { noremap = true, silent = false })


Keymap({ "n", "i", "v", "x" }, "<C-s>", "<cmd>wa<cr>", { noremap = true, silent = true }) -- save all
Keymap("n", "<C-Del>", "de", { noremap = true, silent = true })
Keymap("i", "<C-Del>", "<Esc>ldei", { noremap = true, silent = true })                    -- Stay in insert mode

-- ---------- 视觉模式 ---------- ---
-- 单行或多行移动
Keymap("v", "J", ":m '>+1<CR>gv=gv")
Keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Stay in indent mode.
Keymap("v", "<", "<gv")
Keymap("v", ">", ">gv")

-- ---------- 正常模式 ---------- ---
-- 窗口
Keymap("n", "<leader>sv", "<C-w>v") -- 水平新增窗口
Keymap("n", "<leader>sh", "<C-w>s") -- 垂直新增窗口

-- Select entire buffer
Keymap("n", "vaa", "ggvGg_")
Keymap("n", "Vaa", "ggVG")

-- https://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
Keymap("n", "j", "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
Keymap("n", "k", "v:count ? 'k' : 'gk'", { noremap = true, expr = true })
-- keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { noremap = true , expr = true })
-- keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { noremap = true , expr = true })

-- 取消高亮
Keymap("n", "<leader>nl", ":nohl<CR>")

-- 注释当前单词,可用于快速注释 'Unused parameter'
-- 'CommentUnusedparameter'
Keymap("n", "<leader>cu", "ciw/*<Esc>pa*/<Esc>")

-- 切换buffer
-- keymap.set("n", "<A-h>", ":bprevious<CR>")
-- keymap.set("n", "<A-l>", ":bnext<CR>")

Keymap("n", "<leader>zf", "zf%<CR>", { noremap = true, silent = false })
Keymap("n", "<leader>zF", ":%g/^{/ normal! zf%<CR>", { noremap = true, silent = false }) -- fold all functions


-- 根据不同窗口设置快捷键
-- F19 -> S-F7
-- function SET_DIFF_KEYMAP()
--   Keymap("n", "<F7>", "]c")  -- jump to next diff
--   Keymap("n", "<F19>", "[c") -- jump to prev diff (F19 -> S-F7)
-- end
--
-- function SET_QFIX_KEYMAP()
-- end

Keymap("n", "<F7>", ":cn<cr>")
Keymap("n", "<F19>", ":cprev<cr>")  -- F19 -> S-F7

-- ---------- 插件 ---------- ---

-- lsp, clangd
Keymap("n", "<F10>", ":ClangdSwitchSourceHeader<CR>")


-- Keymap("i", "<C-j>", "copilot#Accept('<CR>')",
  -- { noremap = true, expr = true, silent = true, replace_keycodes = false })
-- local map = function (type, key, value, opts)
--   local options = { noremap = true }
--   if opts then options = vim.tbl_extend('force', options, opts) end
--   vim.api.nvim_set_keymap(type, key, value, options)
-- end
-- map("i", "<C-j>", "copilot#Accept('<CR>')", {expr=true, silent=true, noremap=true})



-- other category
-- Keymap('n', '<leader>ot', ':ToggleTerm<CR>')
