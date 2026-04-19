return {
	name = "Rust: run with params",
	params = {
		args = { optional = false, type = "list", delimiter = " " },
	},
	builder = function(params)
		return {
			cmd = vim.list_extend({ "cargo", "run", "--" }, params.args),
			components = {
				{ "on_output_quickfix", open = true },
    "default",
			},
		}
	end,
	condition = { filetype = { "rust" } },
}
