return {
	name = "C: compile",
	builder = function()
		local file = vim.fn.expand("%:p")
		local output = vim.fn.expand("%:r")
		return {
			cmd = { "cc" },
			args = { file, "-o", output },
			components = {
				{ "on_output_quickfix", open = true },
				"default",
			},
		}
	end,
	condition = { filetype = { "c" } },
}
