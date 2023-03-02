local M = {}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		-- "tsserver",
		"c",
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		-- "typescript-language-server",
		"deno",
	},
}

-- git support in nvimtree
M.nvimtree = {
	filters = {
		dotfiles = true,
	},
	git = {
		enable = true,
		ignore = false,
	},

	renderer = {
		highlight_git = true,
		icons = {
			show = {
				git = true,
			},
		},
	},
}

M.indent_blankline = {
	show_current_context = false,
}

M.nvterm = {
	terminals = {
		shell = "/usr/local/bin/bash -l",
	},
}

return M
