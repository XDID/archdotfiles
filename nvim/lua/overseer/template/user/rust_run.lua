return {
	name = "Rust: run",
	builder = function()
		return {
			cmd = { "cargo", "run" },
			components = {
				{ "on_output_quickfix", open = true },
    "default",
			},
		}
	end,
	condition = { filetype = { "rust" } },
}
