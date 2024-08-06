return {
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanJim/nui.nvim",
		},
		cmd = { "Artisan", "Composer", "Npm", "Laravel" },
		event = { "VeryLazy" },
		keys = { { "<leader>la", "<CMD>Laravel artisan<CR>" } },
		opts = {
			lsp_server = "intelephense",
			features = {
				null_ls = {
					enable = false,
				},
			},
		},
		config = true,
	},
	{
		"ricardoramirezr/blade-nav.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		ft = { "blade", "php" },
	},
}
