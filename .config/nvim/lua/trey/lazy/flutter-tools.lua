return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		require("flutter-tools").setup({
			lsp = {
				capabilities = capabilities,
			},
		})

		vim.keymap.set("n", "<leader>ft", "<CMD>lua require('telescope').extensions.flutter.commands()<CR>")
	end,
}
