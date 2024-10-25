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
			formatters_by_ft = {
				lua = { "stylua" },
				java = { "google-java-format" },
				go = { "goimports", "gofmt" },
				templ = { "templ" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				html = { "prettier" },
				css = { "prettier" },
				php = { "pint" },
				vue = { "prettier" },
				ruby = { "rubocop" },
				svelte = { "prettier" },
			},
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
