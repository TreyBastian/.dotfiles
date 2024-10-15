return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"rcasia/neotest-java",
		"nvim-neotest/neotest-go",
		"V13Axel/neotest-pest",
		"nvim-neotest/neotest-jest",
		"marilari88/neotest-vitest",
		"olimorris/neotest-rspec",
		"zidhuss/neotest-minitest",
	},
	config = function()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-java"),
				require("neotest-go"),
				require("neotest-pest"),
				require("neotest-jest"),
				require("neotest-vitest"),
				require("neotest-rspec"),
				require("neotest-minitest"),
			},
		})

		vim.keymap.set("n", "<leader>tn", function()
			neotest.run.run()
		end)

		vim.keymap.set("n", "<leader>tf", function()
			neotest.run.run(vim.fn.expand("%"))
		end)
	end,
}
