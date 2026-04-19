return {
	name = "Uv: run",
	builder = function()
		local file = vim.fn.expand("%:p")
		return {
			cmd = { "uv", "run", file },
			components = {
				{ "on_output_quickfix", open = true },
    "default",
			},
		}
	end,
	condition = { filetype = { "python" } },
}
