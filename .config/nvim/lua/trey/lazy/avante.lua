return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false,
	opts = {
		provider = "claude",
	},
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-telescope/telescope.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-tree/nvim-web-devicons",
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_imag_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_dorp = {
						insert_mode = true,
					},
					use_absolute_path = true,
				},
			},
		},
	},
}
