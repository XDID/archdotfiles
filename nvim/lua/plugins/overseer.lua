return {
	{
		"stevearc/overseer.nvim",
		opts = {
			strategy = "terminal", -- 默认在Neovim终端中执行
			templates = { "builtin", "user" }, -- 加载官方内置模板和你的自定义模板
			auto_detect_success_color = true, -- 自动判断任务成败并变色
			dap = true, -- 支持与nvim-dap集成
		},
		config = function(_, opts)
			require("overseer").setup(opts)

			-- 可选快捷键，强烈推荐配置
			vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "[O]verseer: Run Task" })
			vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<CR>", { desc = "[O]verseer: Toggle Task List" })
			vim.keymap.set("n", "<leader>ob", "<cmd>OverseerBuild<CR>", { desc = "[O]verseer: Build Task" })
		end,
	},
}
