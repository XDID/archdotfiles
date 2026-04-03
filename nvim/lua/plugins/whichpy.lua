return {
	{
		"neolooong/whichpy.nvim",
		opts = {
			picker = {
				name = "snacks",
			},
		},
	},
	{
		vim.keymap.set("n", "<leader>e", "<cmd>WhichPy select<cr>", { desc = "Python [e]nviroment" }),
	},
}
