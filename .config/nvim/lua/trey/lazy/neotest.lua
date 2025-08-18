local langs = require("trey.languages")
local deps = {
	"nvim-neotest/nvim-nio",
	"nvim-lua/plenary.nvim",
	"antoinemadec/FixCursorHold.nvim",
	"nvim-treesitter/nvim-treesitter",
}
for _, dep in ipairs(langs.testers.deps) do
	table.insert(deps, dep)
end

return {
	"nvim-neotest/neotest",
	dependencies = deps,
	config = function()
		local adapters = {}
		for _, adapter in ipairs(langs.testers.adapters) do
			table.insert(adapters, require(adapter))
		end

		print(vim.inspect(adapters))
		require("neotest").setup({
			adapters = adapters,
		})
		vim.keymap.set("n", "<leader>tn", function()
			require("neotest").run.run()
		end)

		vim.keymap.set("n", "<leader>tf", function()
			require("neotest").run.run(vim.fn.expand("%"))
		end)
	end,
}
