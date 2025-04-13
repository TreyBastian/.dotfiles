return {
	"echasnovski/mini.diff",
	config = function()
		local diff = require("mini.diff")
		diff.setup({
			source = diff.gen_source.none(),
		})
	end,
}
