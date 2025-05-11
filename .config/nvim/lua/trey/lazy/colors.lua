return {
	{
		"loctvl842/monokai-pro.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				terminal_colors = true,
				devicons = true,
			})
			vim.cmd.colorscheme("monokai-pro")
		end,
	},
	{
		"f-person/auto-dark-mode.nvim",
		opts = {
			update_interval = 1000,
			set_dark_mode = function()
				vim.cmd.colorscheme("monokai-pro")
			end,
			set_light_mode = function()
				vim.cmd.colorscheme("monokai-pro-light")
			end,
		},
		config = true,
	},
}
