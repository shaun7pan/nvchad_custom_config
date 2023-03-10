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
	view = {
		float = {
			enable = true,
			open_win_config = function()
				local screen_w = vim.opt.columns:get()
				local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
				local window_w = screen_w * 0.5
				local window_h = screen_h * 0.5
				local window_w_int = math.floor(window_w)
				local window_h_int = math.floor(window_h)
				local center_x = (screen_w - window_w) / 2
				local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
				return {
					border = "rounded",
					relative = "editor",
					row = center_y,
					col = center_x,
					width = window_w_int,
					height = window_h_int,
				}
			end,
		},
		width = function()
			return math.floor(vim.opt.columns:get() * 0.5)
		end,
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
