return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"windwp/nvim-ts-autotag",
			"HiPhish/rainbow-delimiters.nvim",
			"RRethy/nvim-treesitter-endwise",
		},
		main = "nvim-treesitter.configs",
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "embedded_template" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
			},
			autotag = {
				enable = true,
			},
			rainbow = {
				enable = true,
				extended_mode = true,
			},
			indent = {
				enable = true,
			},
			endwise = {
				enable = true,
			},
		},
		config = true,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			max_lines = 4,
		},
		config = true,
	},
}
