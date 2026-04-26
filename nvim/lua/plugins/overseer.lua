return {
	"stevearc/overseer.nvim",
	---@module 'overseer'
	---@type overseer.SetupOpts
	opts = {
		disable_template_modules = {
			"^.*cargo",
		},
	},
	vim.keymap.set("n", "<leader>or", "<cmd>OverseerRun<CR>", { desc = "Overseer: Run Task" }),
	vim.keymap.set("n", "<leader>ot", "<cmd>OverseerToggle<CR>", { desc = "Overseer: Toggle Task List" }),
}
