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
	{ "kkharji/sqlite.lua" },
	{
		"nvim-telescope/telescope-frecency.nvim",
		dependencies = { "telescope.nvim" },
		config = function()
			require("telescope").load_extension("frecency")
		end,
	},
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
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{
		"folke/which-key.nvim",
		enabled = true,
	},

	{ "NvChad/nvterm", lazy = false, opts = overrides.nvterm },
	{ "lukas-reineke/indent-blankline.nvim", lazy = false, opts = overrides.indent_blankline },
	{ "rainbowhxch/accelerated-jk.nvim", lazy = false },
	{ "ThePrimeagen/harpoon", lazy = false },
	{ "tpope/vim-repeat", lazy = false },
	-- { "justinmk/vim-sneak", lazy = false },
	-- easily jump to any location and enhanced f/t motions for Leap
	{
		"ggandor/flit.nvim",
		keys = function()
			---@type LazyKeys[]
			local ret = {}
			for _, key in ipairs({ "f", "F", "t", "T" }) do
				ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
			end
			return ret
		end,
		opts = { labeled_modes = "nx" },
	},
	{
		"ggandor/leap.nvim",
		keys = {
			{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
			{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
			{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
		},
		config = function(_, opts)
			local leap = require("leap")
			for k, v in pairs(opts) do
				leap.opts[k] = v
			end
			leap.add_default_mappings(true)
			vim.keymap.del({ "x", "o" }, "x")
			vim.keymap.del({ "x", "o" }, "X")
		end,
	},

	--   -- ui components
	{ "MunifTanjim/nui.nvim" },
	-- noicer ui
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["vim.lsp.hover.enabled"] = false,
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		},
    -- stylua: ignore
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll backward", mode = {"i", "n", "s"}},
    },
	},
	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Delete all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		},
		init = function()
			-- when noice is not enabled, install notify on VeryLazy
			vim.notify = require("notify")
		end,
	},
	{ "tpope/vim-surround", lazy = false },
	{ "tpope/vim-unimpaired", lazy = false },
	{ "tpope/vim-fugitive", lazy = false },
	{ "ThePrimeagen/vim-be-good", lazy = false },
	{ "gpanders/editorconfig.nvim", lazy = false },
}

return plugins
