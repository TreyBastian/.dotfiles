local M = {}
M.servers = {}
M.handlers = {}
M.formatters = {}
M.testers = {
	deps = {},
	adapters = {},
}
table.insert(M.servers, "lua_ls")
M.handlers.default = function(capabilities)
	return {
		capabilities = capabilities,
	}
end
M.handlers["lua_ls"] = function(capabilities)
	return {
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
	}
end
M.formatters["lua"] = { "stylua" }

M.handlers["gdscript"] = function(capabilities)
	local gdscript_cmd = vim.lsp.rpc.connect("127.0.0.1", 6005)
	if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
		---@diagnostic disable-next-line: cast-local-type
		gdscript_cmd = { "ncat", "127.0.0.1", "6005" }
	end
	return {
		name = "godot",
		capabilities = capabilities,
		cmd = gdscript_cmd,
	}
end
if vim.fn.executable("python") == 1 or vim.fn.executable("python3") == 1 then
	-- yes we need python for godot tools, yes I hate it
	M.formatters["gdscript"] = { "gdformat" }
end
M.formatters["gdshader"] = { "clang-format" }

if vim.fn.executable("java") == 1 then
	table.insert(M.servers, "jdtls")
	M.handlers["jdtls"] = function()
		return {}
	end
	M.formatters["java"] = { "google-java-format" }
	-- table.insert(M.testers.deps, "rcasia/neotest-java")
	-- table.insert(M.testers.adapters, "neotest-java")
end
if vim.fn.executable("go") == 1 then
	table.insert(M.servers, "gopls")
	table.insert(M.servers, "templ")
	M.formatters["go"] = { "gofmt", "goimports" }
	M.formatters["templ"] = { "templ" }
	table.insert(M.testers.deps, "nvim-neotest/neotest-go")
	table.insert(M.testers.adapters, "neotest-go")

	vim.filetype.add({
		extension = { templ = "templ" },
	})
end
if vim.fn.executable("node") == 1 then
	table.insert(M.servers, "ltex")
	table.insert(M.servers, "ts_ls")
	table.insert(M.servers, "emmet_ls")
	table.insert(M.servers, "cssls")
	table.insert(M.servers, "html")
	table.insert(M.servers, "eslint")
	table.insert(M.servers, "tailwindcss")
	table.insert(M.servers, "jsonls")
	table.insert(M.servers, "dockerls")
	table.insert(M.servers, "bashls")
	table.insert(M.servers, "svelte")
	table.insert(M.servers, "astro")
	M.formatters["javascript"] = { "prettier" }
	M.formatters["javascriptreact"] = { "prettier" }
	M.formatters["typescript"] = { "prettier" }
	M.formatters["typescriptreact"] = { "prettier" }
	M.formatters["json"] = { "prettier" }
	M.formatters["html"] = { "prettier" }
	M.formatters["css"] = { "prettier" }
	M.formatters["svelte"] = { "prettier" }
	M.formatters["astro"] = { "prettier" }
	table.insert(M.testers.deps, "nvim-neotest/neotest-jest")
	table.insert(M.testers.adapters, "neotest-jest")
	table.insert(M.testers.deps, "marilari88/neotest-vitest")
	table.insert(M.testers.adapters, "neotest-vitest")
end

if vim.fn.executable("ocaml") == 1 then
	table.insert(M.servers, "ocamllsp")
	M.formatters["ocaml"] = { "ocamlformat" }
end

if vim.fn.executable("cobc") == 1 then
	table.insert(M.servers, "cobol_ls")
end

if vim.fn.executable("gfortran") == 1 then
	table.insert(M.servers, "fortls")
	M.formatters["fortran"] = { "findent" }
end

if vim.fn.executable("dotnet") == 1 then
	table.insert(M.servers, "omnisharp")
	M.formatters["cs"] = { "csharpier" }
	table.insert(M.testers.deps, "Issafalcon/neotest-dotnet")
	table.insert(M.testers.adapters, "neotest-dotnet")
end

return M
