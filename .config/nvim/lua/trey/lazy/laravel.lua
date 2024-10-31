return {
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"tpope/vim-dotenv",
			"MunifTanJim/nui.nvim",
			"kevinhwang91/promise-async",
		},
		cmd = { "Laravel" },
		event = { "VeryLazy" },
		keys = { { "<leader>la", "<CMD>Laravel artisan<CR>" } },
		config = true,
	},
	{
		"ricardoramirezr/blade-nav.nvim",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
	},
}
