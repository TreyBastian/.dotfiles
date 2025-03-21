local langs = require("trey.languages")
local base_deps = {
	"nvim-neotest/nvim-nio",
	"nvim-lua/plenary.nvim",
	"antoinemadec/FixCursorHold.nvim",
	"nvim-treesitter/nvim-treesitter",
}
local deps = vim.tbl_deep_extend("force", langs.testers.deps, base_deps)
return {
	"nvim-neotest/neotest",
	dependencies = deps,
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = function()
				local adapters = {}
				for _, adapter in ipairs(langs.testers.adapters) do
					table.insert(adapters, require(adapter))
				end
				return adapters
			end,
		})

		vim.keymap.set("n", "<leader>tn", function()
			neotest.run.run()
		end)

		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end)
	end,
}
