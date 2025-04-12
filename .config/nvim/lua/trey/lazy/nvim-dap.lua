local langs = require("trey.languages")
return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")
		dap.adapters = langs.dap.adapters
		dap.configurations = langs.dap.configurations

		vim.keymap.set("n", "<localleader>b", "<CMD>lua require'dap'.toggle_breakpoint()<CR>")
		vim.keymap.set("n", "<localleader>c", "<CMD>lua require'dap'.continue()<CR>")
		vim.keymap.set("n", "<localleader>so", "<CMD>lua require'dap'.step_over()<CR>")
		vim.keymap.set("n", "<localleader>si", "<CMD>lua require'dap'.step_into()<CR>")
		vim.keymap.set("n", "<localleader>o", "<CMD>lua require'dap'.repl.open()<CR>")
	end,
}
