return {
	name = "Rust: build",
	builder = function()
		return {
			cmd = { "cargo", "build" },
			components = {
				{ "on_output_quickfix", open = true },
    "default",
			},
		}
	end,
	condition = { filetype = { "rust" } },
}
