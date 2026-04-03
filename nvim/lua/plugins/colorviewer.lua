return {
	"Godswill-255/colorviewer.nvim",
	config = function()
		require("colorviewer").setup({
			symbol = "■",
		})
	end,
	vim.keymap.set("n", "<leader>c", "<cmd>ShowColorBoxes<cr>", { desc = "[C]olor preview" }),
}
