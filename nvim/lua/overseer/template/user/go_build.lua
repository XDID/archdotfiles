return {
	name = "Go: build",
	builder = function()
		return {
			cmd = { "go", "build", "." },
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
