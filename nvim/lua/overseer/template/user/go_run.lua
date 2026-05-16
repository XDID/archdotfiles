return {
	name = "Go: run",
	builder = function()
		return {
			cmd = { "go", "run", "." },
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
