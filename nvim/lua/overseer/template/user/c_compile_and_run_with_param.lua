local file = vim.fn.expand("%:p")
local outfile = vim.fn.expand("%:r")
return {
	name = "C: compile and run with params",
	params = {
		args = { optional = false, type = "list", delimiter = " " },
	},
	builder = function(params)
		return {
			name = vim.fn.expand("%:t"),
			cwd = vim.fn.expand("%:p:h"),
			cmd = vim.list_extend({ "./" .. outfile }, params.args),
			components = {
				{
					"dependencies",
					tasks = {
						{
							cmd = "cc",
							args = { "-o", outfile, file },
						},
					},
				},
				{ "on_output_quickfix", open = true },
    "default",
			},
		}
	end,
	condition = {
		filetype = { "c" },
	},
}
