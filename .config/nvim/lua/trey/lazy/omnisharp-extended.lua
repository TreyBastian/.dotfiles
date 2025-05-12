return {
	"Hoffs/omnisharp-extended-lsp.nvim",
	cond = function()
		return vim.fn.executable("dotnet") == 1
	end,
}
