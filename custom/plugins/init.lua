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

	["kyazdani42/nvim-tree.lua"] = {
		override_options = overrides.nvimtree,
	},

	-- Install a plugin
	["jdhao/better-escape.vim"] = {
		event = "InsertEnter",
	},

	-- ["max397574/better-escape.nvim"] = {
	--   event = "InsertEnter",
	--   config = function()
	--     require("better_escape").setup()
	--   end,
	-- },

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
		disable = false,
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
				},
			}
		end,
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
	-- ["phaazon/hop.nvim"] = {
	--   branch = "v2", -- optional but strongly recommended
	--   config = function()
	--     -- you can configure Hop the way you like here; see :h hop-config
	--     require("hop").setup {
	--       keys = "etovxqpdygfblzhckisuran",
	--     }
	--   end,
	-- },
	["nvim-telescope/telescope-fzf-native.nvim"] = {
		run = "make",
	},
}
