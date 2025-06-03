return {
	"github/copilot.vim",
	init = function()
		-- Set up Copilot key mappings
		vim.keymap.set("i", "<C-Space>", 'copilot#Accept("\\<CR>")', {
			expr = true,
			replace_keycodes = false,
		})
		vim.keymap.set("i", "<C-x>", "copilot#Dismiss()", { expr = true, replace_keycodes = false })
		vim.keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = false })
		vim.keymap.set("n", "<leader>cp", ":Copilot panel<CR>", { noremap = true, silent = true })

		-- Disable default tab mapping
		vim.g.copilot_no_tab_map = true
	end,
}
