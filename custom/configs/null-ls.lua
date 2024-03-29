local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }),

	-- Lua
	b.formatting.stylua,

	-- Shell
	b.formatting.shfmt.with({
		extra_args = { "-i", "2", "-ci" },
	}),

	b.code_actions.shellcheck,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- golang
	b.formatting.goimports,
	b.diagnostics.golangci_lint,

	-- python
	b.formatting.black,

	-- rust
	b.formatting.rustfmt,

	-- jq
	b.formatting.jq,

	-- yaml
	-- b.formatting.yamlfmt,

	-- terraform
	b.formatting.terraform_fmt,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
