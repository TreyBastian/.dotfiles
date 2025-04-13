return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"Davidyz/VectorCode",
		"j-hui/fidget.nvim",
	},
	init = function()
		local progress = require("fidget.progress")

		local M = {}

		function M:init()
			local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", {})

			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = "CodeCompanionRequestStarted",
				group = group,
				callback = function(request)
					local handle = M:create_progress_handle(request)
					M:store_progress_handle(request.data.id, handle)
				end,
			})

			vim.api.nvim_create_autocmd({ "User" }, {
				pattern = "CodeCompanionRequestFinished",
				group = group,
				callback = function(request)
					local handle = M:pop_progress_handle(request.data.id)
					if handle then
						M:report_exit_status(handle, request)
						handle:finish()
					end
				end,
			})
		end

		M.handles = {}

		function M:store_progress_handle(id, handle)
			M.handles[id] = handle
		end

		function M:pop_progress_handle(id)
			local handle = M.handles[id]
			M.handles[id] = nil
			return handle
		end

		function M:create_progress_handle(request)
			return progress.handle.create({
				title = " Requesting assistance (" .. request.data.strategy .. ")",
				message = "In progress...",
				lsp_client = {
					name = M:llm_role_title(request.data.adapter),
				},
			})
		end

		function M:llm_role_title(adapter)
			local parts = {}
			table.insert(parts, adapter.formatted_name)
			if adapter.model and adapter.model ~= "" then
				table.insert(parts, "(" .. adapter.model .. ")")
			end
			return table.concat(parts, " ")
		end

		function M:report_exit_status(handle, request)
			if request.data.status == "success" then
				handle.message = "Completed"
			elseif request.data.status == "error" then
				handle.message = " Error"
			else
				handle.message = "󰜺 Cancelled"
			end
		end

		M:init()
	end,
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "ollama",
					slash_commands = {
						codebase = require("vectorcode.integrations").codecompanion.chat.make_slash_command(),
					},
					tools = {
						vectorcode = {
							description = "Run VectorCode to retrieve the project context.",
							callback = require("vectorcode.integrations").codecompanion.chat.make_tool(),
						},
					},
				},
				inline = {
					adapter = "ollama",
				},
				cmd = {
					adapter = "ollama",
				},
			},
			adapters = {
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						env = {
							url = "http://treys_pc:11434",
						},
						paramters = {
							sync = true,
						},
					})
				end,
			},
			display = {
				diff = {
					provider = "mini_diff",
				},
				chat = {
					window = {
						position = "right",
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>cc", "<CMD>CodeCompanionChat Toggle<CR>")
		vim.keymap.set("n", "<leader>ca", "<CMD>Telescope codecompanion<CR>")
	end,
}
