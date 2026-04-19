return {
	-- 任务1：运行当前项目
	{
		name = "Rust: cargo run",
		builder = function()
			return {
				cmd = { "cargo" },
				args = { "run" },
				components = { "default" },
			}
		end,
		condition = { filetype = { "rust" } },
	},
	-- 任务2：检查代码
	{
		name = "Rust: cargo check",
		builder = function()
			return {
				cmd = { "cargo" },
				args = { "check" },
				components = {
					{ "on_output_quickfix", open = true }, -- 错误信息显示到quickfix窗口
					"on_result_diagnostics", -- 同时将错误设为diagnostics
					"default",
				},
			}
		end,
		condition = { filetype = { "rust" } },
	},
	-- 任务3：构建项目
	{
		name = "Rust: cargo build",
		builder = function()
			return {
				cmd = { "cargo" },
				args = { "build" },
				components = {
					{ "on_output_quickfix", open = true },
					"on_result_diagnostics",
					"default",
				},
			}
		end,
		condition = { filetype = { "rust" } },
	},
	-- 任务4：运行测试
	{
		name = "Rust: cargo test",
		builder = function()
			return {
				cmd = { "cargo" },
				args = { "test" },
				components = { "default" },
			}
		end,
		condition = { filetype = { "rust" } },
	},
}
