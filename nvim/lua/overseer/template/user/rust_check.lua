return {
	name = "Rust: check",
	builder = function()
		return {
			cmd = { "cargo", "check" },
			components = {
				{ "on_output_quickfix", open = true },
    "default",
			},
		}
	end,
	condition = { filetype = { "rust" } },
}
