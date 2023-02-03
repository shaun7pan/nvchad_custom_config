local M = {}

-- more keybinds!
M.shaun = {
	i = {
		-- ["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
		["<C-s>"] = { "<ESC>:w<CR>", "save in insert mode", opts = { nowait = true } },
		["<C-CR>"] = { "<C-o>O", "newline down", opts = { nowait = true } },
		["<S-CR>"] = { "<C-o>o", "newline up", opts = { nowait = true } },
	},
	n = {
		["<C-q>"] = { '<cmd>lua require("custom.functions").smart_quit()<CR>', "smart quit", opts = { nowait = true } },
		["Y"] = { '"+y$', "yank to clipboardvim", opts = { nowait = true } },
		["<Left>"] = { "<cmd>vertical resize-5<CR>", "adjust vsplit", opts = { nowait = true } },
		["<Right>"] = { "<cmd>vertical resize+5<CR>", "adjust vsplit", opts = { nowait = true } },
		["<leader>sh"] = { "<cmd>set nosplitright <CR> <cmd>vsplit<CR>", "split left", opts = { nowait = true } },
		["<leader>sl"] = { "<cmd>set splitright <CR> <cmd>vsplit<CR>", "split right", opts = { nowait = true } },
		["<leader>sj"] = { "<cmd>set splitbelow <CR> <cmd>split<CR>", "split below", opts = { nowait = true } },
		["<leader>sk"] = { "<cmd>set nosplitbelow <CR> <cmd>split<CR>", "split up", opts = { nowait = true } },

		["<leader>ww"] = { "<cmd>e /Users/a560827/.shaunTILlkjlkj<CR>", "edit my file", opts = { nowait = true } },

		["j"] = { "<Plug>(accelerated_jk_gj)", "accelerated_jk_j", opts = { nowait = true } },
		["k"] = { "<Plug>(accelerated_jk_gk)", "accelerated_jk_k", opts = { nowait = true } },
		["<leader>ad"] = {
			'<cmd>lua require("harpoon.mark").add_file()<CR>',
			"harpoon add file",
			opts = { nowait = true },
		},
		["<C-e>"] = {
			'<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>',
			"toggle harpoon",
			opts = { nowait = true },
		},
		["<leader>1"] = {
			'<cmd>lua require("harpoon.ui").nav_file(1)<CR>',
			"harpoon select file",
			opts = { nowait = true },
		},
		["<leader>2"] = {
			'<cmd>lua require("harpoon.ui").nav_file(2)<CR>',
			"harpoon select file",
			opts = { nowait = true },
		},
		["<leader>3"] = {
			'<cmd>lua require("harpoon.ui").nav_file(3)<CR>',
			"harpoon select file",
			opts = { nowait = true },
		},
		["<leader>4"] = {
			'<cmd>lua require("harpoon.ui").nav_file(4)<CR>',
			"harpoon select file",
			opts = { nowait = true },
		},
		["<C-c>"] = { "<Esc>", "unmap tab", opts = { nowait = true } },
		["]c"] = {
			'<cmd>lua require("custom.functions").next_hunk()<CR>',
			"next hunk",
			opts = { nowait = true },
		},
		["[c"] = {
			'<cmd>lua require("custom.functions").prev_hunk()<CR>',
			"prev hunk",
			opts = { nowait = true },
		},
		["<leader>gp"] = {
			"<cmd>Gitsigns preview_hunk<CR>",
			"hunk preview",
			opts = { nowait = true },
		},
		["<C-p>"] = {
			"<cmd>lua require'telescope'.extensions.project.project{}<CR>",
			"telescope project",
			opts = { nowait = true, silent = true, noremap = true },
		},
		["<leader>d"] = { '"_d', "delete without yank", opts = { nowait = true } },
		["<leader>c"] = { '"_c', "change without yank", opts = { nowait = true } },
		--no longer needed since using system clipboard`
		-- ["<leader>pp"] = { '"+p', "paste from system clipboard", opts = { nowait = true } },
	},
	v = {
		--no longer needed since using system clipboard`
		-- ["Y"] = { '"+y', "yank to clipboardvim", opts = { nowait = true } },
		-- ["<leader>p"] = { '"+p', "paste from system clipboard", opts = { nowait = true } },
		["<leader>p"] = { '"_dP', "Greatest remap EVER!!", opts = { nowait = true } },
		["<leader>d"] = { '"_d', "delete without yank", opts = { nowait = true } },
		["<leader>c"] = { '"_c', "change without yank", opts = { nowait = true } },
	},
	t = { ["jj"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), "escape terminal mode" } },
}

M.nvimtree = {
	plugin = true,

	t = {
		-- toggle
		["<C-space>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
	},

	n = {
		-- toggle
		["<C-space>"] = { "<cmd> NvimTreeToggle <CR>", "toggle nvimtree" },
		["<C-n>"] = { "<Nop>" },
	},
}

M.telescope = {
	plugin = true,

	n = {
		-- toggle
		["<leader>ts"] = { "<cmd> Telescope <CR>", "toggle telescope" },
		["<leader>bb"] = { "<cmd> Telescope buffers <CR>", "find buffers" },
	},
}

M.alpha = {

	n = {
		-- toggle
		["<leader>al"] = { "<cmd> Alpha <CR>", "toggle alpha-nvim" },
	},
}

M.ui = {

	n = {
		-- toggle
		["<leader>X"] = {
			'<cmd>lua require("nvchad_ui.tabufline").closeAllBufs()<CR>',
		},
	},
}
return M
