return {
	name = "Python: run with params",
	params = {
		args = { optional = false, type = "list", delimiter = " " },
	},
	builder = function(params)
		local file = vim.fn.expand("%:p")
		return {
			cmd = vim.list_extend({ "python3", file }, params.args),
			components = {
				{ "on_output_quickfix", open = true },
    "default",
			},
		}
	end,
	condition = { filetype = { "python" } },
}
