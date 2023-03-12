local overrides = require("custom.plugins.overrides")

return {

	-- ["goolord/alpha-nvim"] = { disable = false } -- enables dashboard

	-- Override plugin definition options
	["neovim/nvim-lspconfig"] = {
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.plugins.lspconfig")
		end,
	},

	-- overrde plugin configs
	["nvim-treesitter/nvim-treesitter"] = {
		override_options = overrides.treesitter,
	},

	["williamboman/mason.nvim"] = {
		override_options = overrides.mason,
	},

	["nvim-tree/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	-- Install a plugin
	["jdhao/better-escape.vim"] = {
		event = "InsertEnter",
	},

	-- code formatting, linting etc
	["jose-elias-alvarez/null-ls.nvim"] = {
		after = "nvim-lspconfig",
		config = function()
			require("custom.plugins.null-ls")
		end,
	},

	-- remove plugin
	-- ["hrsh7th/cmp-path"] = false,

	-- Override plugin definition options
	["goolord/alpha-nvim"] = {
		disable = true,
		cmd = "Alpha",
	},

	["folke/which-key.nvim"] = {
		disable = false,
	},

	["nvim-telescope/telescope.nvim"] = {
		override_options = function()
			return {
				defaults = {
					mappings = {
						i = {
							["<esc>"] = require("telescope.actions").close,
							["<C-s>"] = require("telescope.actions").cycle_previewers_next,
							["<C-a>"] = require("telescope.actions").cycle_previewers_prev,
							["<M-p>"] = require("telescope.actions.layout").toggle_preview,
						},
						n = {
							["<M-p>"] = require("telescope.actions.layout").toggle_preview,
						},
					},
				},
				extensions_list = {
					"fzf",
					"themes",
					"terms",
					"file_browser",
				},
			}
		end,
	},

	["NvChad/nvterm"] = {
		override_options = overrides.nvterm,
	},

	["lukas-reineke/indent-blankline.nvim"] = {
		override_options = overrides.indent_blankline,
	},

	["rainbowhxch/accelerated-jk.nvim"] = {},
	["ThePrimeagen/harpoon"] = {},
	["tpope/vim-repeat"] = {},
	["justinmk/vim-sneak"] = {},
	["tpope/vim-surround"] = {},
	["tpope/vim-unimpaired"] = {},
	["tpope/vim-fugitive"] = {},
	["nvim-telescope/telescope-fzf-native.nvim"] = {
		run = "make",
	},
	["nvim-telescope/telescope-file-browser.nvim"] = {},
	["nvim-telescope/telescope-project.nvim"] = {
		after = "telescope.nvim",
		module = "telescope",
		config = function()
			require("telescope").load_extension("project")
		end,
	},
	["ThePrimeagen/vim-be-good"] = {},
	["gpanders/editorconfig.nvim"] = {},
}
