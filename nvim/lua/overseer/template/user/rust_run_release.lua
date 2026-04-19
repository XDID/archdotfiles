return {
	name = "Rust: run release",
	builder = function()
		return {
			cmd = { "cargo", "run", "--release" },
			components = {
				{ "on_output_quickfix", open = true },
    "default",
			},
		}
	end,
	condition = { filetype = { "rust" } },
}
