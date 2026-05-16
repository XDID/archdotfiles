return {
	name = "Go: run with params",
	params = {
		args = {
			optional = true,
			type = "list",
			delimiter = " ",
		},
	},
	builder = function(params)
		return {
			cmd = vim.list_extend({ "go", "run", "." }, params.args or {}),
			components = {
				{ "on_output_quickfix", open = true },
				"default",
			},
		}
	end,
	condition = {
		filetype = { "go" },
	},
}
