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
autocmd("BufReadPost", {
	pattern = "*",
	command = [[if line("'\"" >1 && line("'\"")) <= line("$") | execute "normal! g`\"" | endif]],
})

-- Do not c/d/yw to clipboard
vim.opt.clipboard = ""

-- format on save
autocmd("BufWritePre", {
	pattern = "*",
	command = "lua vim.lsp.buf.formatting_sync()",
})

-- enable sneak lable
vim.cmd([[ let g:sneak#label = 1 ]])

-- set default shell
vim.opt.shell = "/usr/local/bin/bash"
