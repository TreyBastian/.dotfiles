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
			formatters = {
				--TODO: remove this when conform merges https://github.com/stevearc/conform.nvim/pull/695
				csharpier = function()
					local useDotnet = not vim.fn.executable("csharpier")

					local command = useDotnet and "dotnet csharpier" or "csharpier"

					local version_out = vim.fn.system(command .. " --version")

					--NOTE: system command returns the command as the first line of the result, need to get the version number on the final line
					local major_version = tonumber((version_out or ""):match("^(%d+)")) or 0
					local is_new = major_version >= 1

					local args = is_new and { "format", "$FILENAME" } or { "--write-stdout" }

					return {
						command = command,
						args = args,
						stdin = not is_new,
						require_cwd = false,
					}
				end,
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
