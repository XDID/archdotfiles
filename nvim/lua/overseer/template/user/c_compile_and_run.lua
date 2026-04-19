return {
	name = "C: compile and run",
	builder = function()
		local file = vim.fn.expand("%:p")
		local outfile = vim.fn.expand("%:r")
		return {
			cmd = { outfile },
			components = {
				{
					"dependencies",
					task_name = {
						{
							cmd = "cc",
							args = { file, "-o", outfile },
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
