local present, null_ls = pcall(require, "null-ls")

if not present then
	return
end

local b = null_ls.builtins

local sources = {

	-- webdev stuff
	b.formatting.deno_fmt,
	b.formatting.prettier.with({ filetypes = { "html", "markdown", "css" } }),

	-- Lua
	b.formatting.stylua,

	-- Shell
	b.formatting.shfmt.with({
		extra_args = { "-i", "2", "-ci" },
	}),

	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),

	-- cpp
	b.formatting.clang_format,

	-- golang
	b.formatting.goimports,

	-- python
	b.formatting.black,

	-- rust
	b.formatting.rustfmt,

	-- jq
	b.formatting.jq,

	-- yaml
	b.formatting.yamlfmt,

	-- terraform
	b.formatting.terraform_fmt,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
