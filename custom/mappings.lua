---@type MappingsTable
local M = {}

-- M.general = {
--   n = {
--     [";"] = { ":", "enter command mode", opts = { nowait = true } },
--   },
-- }

M.disabled = {
	n = {
		["gi"] = "",
		["<tab>"] = "",
		["gr"] = "",
		["<C-h>"] = "",
		["<C-j>"] = "",
		["<C-k>"] = "",
		["<C-l>"] = "", -- Those keys will be map to `TmuxNavigateLeft/TmuxNavigateDown/TmuxNavigateUp/TmuxNavigateRight`
	},
}

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
		["<leader>|"] = { "<cmd>set nosplitright <CR> <cmd>vsplit<CR>", "split left", opts = { nowait = true } },
		-- ["<leader>sl"] = { "<cmd>set splitright <CR> <cmd>vsplit<CR>", "split right", opts = { nowait = true } },
		["<leader>-"] = { "<cmd>set splitbelow <CR> <cmd>split<CR>", "split below", opts = { nowait = true } },
		-- ["<leader>sk"] = { "<cmd>set nosplitbelow <CR> <cmd>split<CR>", "split up", opts = { nowait = true } },

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
			-- "<cmd>lua require'telescope'.extensions.project.project{}<CR>",
			"<cmd>MarkdownPreviewToggle<CR>",
			-- "telescope project",
			"Markdown preview",
			opts = { nowait = true, silent = true, noremap = true },
		},
		["<leader>d"] = { '"_d', "delete without yank", opts = { nowait = true } },
		-- ["<leader>c"] = { '"_c', "change without yank", opts = { nowait = true } },
		["<leader>gi"] = {
			"<cmd>lua require'telescope.builtin'.lsp_implementations{}<CR>",
			"go to reference",
			opts = { nowait = true },
		},
		["gr"] = {
			"<cmd>lua require'telescope.builtin'.lsp_references{}<CR>",
			"go to reference",
			opts = { nowait = true },
		},
		--no longer needed since using system clipboard`
		-- ["<leader>pp"] = { '"+p', "paste from system clipboard", opts = { nowait = true } },
		["<leader>xx"] = { "<cmd>!chmod +x %<CR>", "excutable", opts = { silent = true } },
		-- ["<C-d>"] = { "<C-d>zz", "be in the central of the screen", opts = { silent = true } },
		-- ["<C-u>"] = { "<C-u>zz", "be in the central of the screen", opts = { silent = true } },
		-- ["n"] = { "nzzzv", "be in the central of the screen", opts = { silent = true } },
		-- ["N"] = { "Nzzzv", "be in the central of the screen", opts = { silent = true } },
		["<leader>ft"] = { "<cmd>Telescope file_browser<CR>", "Telescope File Tree", opts = { silent = true } },
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

M.tabufline = {
	plugin = true,
	n = {
		-- pick buffers via numbers
		["<Bslash>"] = {
			function()
				require("nvchad_ui.tabufline").tbufpick()
			end,
			"pick buffer",
		},
	},
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
		["<leader>,"] = { "<cmd> Telescope buffers show_all_buffers=true<CR>", "Switch Buffer" },
		["<leader>:"] = { "<cmd> Telescope command_history<CR>", "Command History" },
		["<leader><space>"] = { "<cmd> Telescope live_grep cwd=false<CR>", "Find Files" },
		-- find
		["<leader>fb"] = { "<cmd> Telescope buffers<CR>", "Buffers" },
		-- ["<leader>ff"] = {
		-- 	'<Cmd>lua require("telescope").extensions.frecency.frecency({ workspace = "CWD" })<CR>',
		-- 	"find frecency",
		-- 	opts = { noremap = true, silent = true },
		-- },
		["<leader>ff"] = { "<cmd> Telescope find_files<CR>", "Find Files" },
		["<leader>fF"] = { "<cmd> Telescope find_files cwd=false<CR>", "Find Files (cwd)" },
		["<leader>fr"] = { "<cmd> Telescope oldfiles<CR>", "Recent" },
		["<leader>fR"] = { "<cmd> Telescope oldfiles cwd=vim.loop.cwd()<CR>", "Recent (cwd)" },
		--- git
		["<leader>gc"] = { "<cmd> Telescope git_commits<CR>", "commits" },
		["<leader>gs"] = { "<cmd> Telescope git_commits<CR>", "status" },
		--- search
		["<leader>sa"] = { "<cmd> Telescope autocommands<CR>", "Auto Commands" },
		["<leader>sb"] = { "<cmd> Telescope current_buffer_fuzzy_find<CR>", "Buffer" },
		["<leader>sc"] = { "<cmd> Telescope command_history<CR>", "Command History" },
		["<leader>sC"] = { "<cmd> Telescope commands<CR>", "Commands" },
		["<leader>sd"] = { "<cmd> Telescope diagnostics bufnr=0<CR>", "Document diagnostics" },
		["<leader>sD"] = { "<cmd> Telescope diagnostics<CR>", "Workspace diagnostics" },
		["<leader>sg"] = { "<cmd> Telescope diagnostics<CR>", "Workspace diagnostics" },
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

M.comment = {
	plugin = true,

	-- toggle comment in both modes
	n = {
		["gcc"] = {
			function()
				require("Comment.api").toggle.linewise.current()
			end,
			"toggle comment",
		},
	},

	v = {
		["gcc"] = {
			"<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
			"toggle comment",
		},
	},
}
return M
