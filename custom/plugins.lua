local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

	-- Override plugin definition options

	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- format & linting
			{
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("custom.configs.null-ls")
				end,
			},
		},
		config = function()
			-- Uncomment if you want to re-enable which-key
			-- {
			--   "folke/which-key.nvim",
			--   enabled = true,
			-- },
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end, -- Override to setup mason-lspconfig
	},

	-- overrde plugin configs
	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{ "williamboman/mason.nvim", opts = overrides.mason },

	-- Install a plugin
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},
	-- {
	-- 	"nvim-telescope/telescope-project.nvim",
	-- 	dependencies = { "telescope.nvim" },
	-- 	config = function()
	-- 		require("telescope").load_extension("project")
	-- 	end,
	-- },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		dependencies = { "telescope.nvim" },
		build = "make",
		config = function()
			require("telescope").load_extension("fzf")
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		opts = overrides.telescope,
	},
	{
		"iamcco/markdown-preview.nvim",
		ft = "markdown",
		event = "BufRead",
		config = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	-- To make a plugin not be loaded
	-- {
	--   "NvChad/nvim-colorizer.lua",
	--   enabled = false
	-- },

	-- Uncomment if you want to re-enable which-key
	{
		"folke/which-key.nvim",
		enabled = true,
	},

	{ "NvChad/nvterm", lazy = false, opts = overrides.nvterm },
	{ "lukas-reineke/indent-blankline.nvim", lazy = false, opts = overrides.indent_blankline },
	{ "rainbowhxch/accelerated-jk.nvim", lazy = false },
	{ "ThePrimeagen/harpoon", lazy = false },
	{ "tpope/vim-repeat", lazy = false },
	{ "justinmk/vim-sneak", lazy = false },
	{ "tpope/vim-surround", lazy = false },
	{ "tpope/vim-unimpaired", lazy = false },
	{ "tpope/vim-fugitive", lazy = false },
	{ "ThePrimeagen/vim-be-good", lazy = false },
	{ "gpanders/editorconfig.nvim", lazy = false },
}

return plugins
