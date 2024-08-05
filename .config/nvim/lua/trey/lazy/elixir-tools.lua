return {
	"elixir-tools/elixir-tools.nvim",
	version = "*",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim", "williamboman/mason.nvim" },
	build = ":MasonInstall nextls", -- need to install it this way
	config = function()
		local elixir = require("elixir")
		local elixirls = require("elixir.elixirls")

		local elixir_on_attach = function(client, bufnr)
			local opts = { buffer = true, noremap = true }

			vim.keymap.set("n", "<leader>efp", "<CMD>ElixirFromPipe<CR>", opts)
			vim.keymap.set("n", "<leader>etp", "<CMD>ElixirToPipe<CR>", opts)
			vim.keymap.set("n", "<leader>eem", "<CMD>ElixirExpandMacro<CR>", opts)
		end

		elixir.setup({
			nextls = {
				enable = true,
				cmd = vim.fn.stdpath("data") .. "/mason/bin/nextls",
				on_attach = elixir_on_attach,
				init_options = {
					experimental = {
						completions = { enable = false },
					},
				},
			},
			credo = {
				enable = true,
			},
			elixirls = {
				cmd = vim.fn.stdpath("data") .. "/mason/bin/elixir-ls",
				enable = true,
				settings = elixirls.settings({
					fetchDeps = true,
					dialyzerEnabbled = true,
					enableTestLenses = false,
				}),
				on_attach = elixir_on_attach,
			},
		})
	end,
}
