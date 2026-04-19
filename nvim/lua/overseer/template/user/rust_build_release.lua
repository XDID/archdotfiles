return {
	name = "Rust: build release",
	builder = function()
		return {
			cmd = { "cargo", "build", "--release" },
			components = {
				{ "on_output_quickfix", open = true },
    "default",
			},
		}
	end,
	condition = { filetype = { "rust" } },
}
