local langs = require("trey.languages")
return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>bf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = { "n" },
			},
		},
		opts = {
			formatters_by_ft = langs.formatters,
			format_on_save = {
				timeout_ms = 1001,
				lsp_fallback = true,
			},
		},
	},
	{
		"zapling/mason-conform.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"stevearc/conform.nvim",
		},
		config = function()
			require("mason-conform").setup({})
		end,
	},
}
