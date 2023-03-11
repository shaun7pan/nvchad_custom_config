local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
autocmd("VimResized", {
	pattern = "*",
	command = "tabdo wincmd =",
})
--

-- Highlight on yank
local yankGrp = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
	command = "silent! lua vim.highlight.on_yank()",
	group = yankGrp,
})

-- go to last loc when opening a buffer
autocmd("BufRead", {
	pattern = "*",
	command = [[if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif ]],
})

-- Do not c/d/yw to clipboard
-- vim.opt.clipboard = ""

-- format on save
autocmd("BufWritePre", {
	pattern = "*",
	command = "lua vim.lsp.buf.format()",
})

-- enable sneak lable
vim.cmd([[ let g:sneak#label = 1 ]])

-- indent
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
--
