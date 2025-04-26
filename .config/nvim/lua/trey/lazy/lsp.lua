local langs = require("trey.languages")
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)

		vim.keymap.set("n", "gl", function()
			vim.diagnostic.open_float()
		end)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_prev()
		end)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_next()
		end)

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				local opts = { buffer = event.buf }

				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "gD", function()
					vim.lsp.buf.declaration()
				end, opts)
				vim.keymap.set("n", "gi", function()
					vim.lsp.buf.implementation()
				end, opts)
				vim.keymap.set("n", "go", function()
					vim.lsp.buf.type_definition()
				end, opts)
				vim.keymap.set("n", "gr", function()
					require("telescope.builtin").lsp_references()
				end, opts)
				vim.keymap.set("n", "gs", function()
					vim.lsp.buf.signature_help()
				end, opts)
				vim.keymap.set("n", "<leader>r", function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set("n", "<leader>qf", function()
					vim.lsp.buf.code_action()
				end, opts)
			end,
		})

		require("fidget").setup({})
		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = langs.servers,

			handlers = {
				function(server_name)
					local handler_config = langs.handlers[server_name] or langs.handlers.default
					require("lspconfig")[server_name].setup(handler_config(capabilities))
				end,
			},
		})

		-- GODOT is a special case lets handle it
		require("lspconfig")["gdscript"].setup(langs.handlers["gdscript"](capabilities))

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			preselect = cmp.PreselectMode.None,
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-SPACE>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = true,
				header = "",
				prefix = "",
			},
		})
	end,
}
