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
			ensure_installed = {
				"lua_ls",
				"jdtls",
				"gopls",
				"templ",
				"ts_ls",
				"emmet_ls",
				"cssls",
				"html",
				"eslint",
				"tailwindcss",
				"jsonls",
				"dockerls",
				"bashls",
				"cobol_ls",
				"intelephense",
				"astro",
				"volar",
				"ruby_lsp",
				"svelte",
			},

			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
					})
				end,

				jdtls = function() end,

				intelephense = function()
					require("lspconfig").intelephense.setup({
						commands = {
							IntelephenseIndex = {
								function()
									vim.lsp.buf.execute_command({ command = "intelephense.index.workspace" })
								end,
							},
						},
						on_attach = function(client, bufnr)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentRangeFormattingProvider = false
						end,
						capabilities = capabilities,
					})
				end,

				ts_ls = function()
					local vue_typescript_plugin = require("mason-registry")
						.get_package("vue-language-server")
						:get_install_path() .. "/node_modules/@vue/language-server" .. "/node_modules/@view/typescript-plugin"

					require("lspconfig").ts_ls.setup({
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = vue_typescript_plugin,
									languages = { "javascript", "typescript", "vue" },
								},
							},
						},
						filetypes = {
							"javascript",
							"javascriptreact",
							"javascript.jsx",
							"typescript",
							"typescriptreact",
							"typescript.tsx",
							"vue",
						},
					})
				end,
				ruby_lsp = function()
					require("lspconfig").ruby_lsp.setup({
						capabilities = capabilities,
						filetypes = { "ruby", "eruby" },
					})
				end,

				lua_ls = function()
					require("lspconfig").lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								runtime = { version = "LuaJIT" },
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									library = {
										vim.env.VIMRUNTIME,
									},
								},
							},
						},
					})
				end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			preselect = cmp.PreselectMode.None,
			mapping = cmp.mapping.preset.insert({
				["<Tab>"] = cmp.mapping.select_next_item(cmp_select),
				["<S-Tab>"] = cmp.mapping.select_prev_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<C-SPACE>"] = cmp.mapping.complete(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
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
