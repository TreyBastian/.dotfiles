return {
	"milanglacier/minuet-ai.nvim",
	config = function()
		require("minuet").setup({
			virtualtext = {
				auto_trigger_ft = { "*" },
				keymap = {
					accept = "<A-A>",
					accept_line = "<A-a>",
					accept_n_lines = "<A-z>",
					prev = "<A-[>",
					next = "<A-]>",
					dismiss = "<A-e>",
				},
			},
			provider = "openai_fim_compatible",
			n_completions = 1,
			context_window = 512,
			provider_options = {
				openai_fim_compatible = {
					name = "Ollama",
					api_key = "TERM",
					end_point = "http://treys_pc:11434/v1/completions",
					model = "qwen2.5-coder:7b",
					optional = {
						max_tokens = 56,
						top_p = 0.9,
						stop = nil,
					},
				},
			},
		})
	end,
}
