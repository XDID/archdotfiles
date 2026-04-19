return {
	"XDID/hoversplit.nvim",
	config = function()
		require("hoversplit").setup({
			conceallevel = 3,
			key_bindings_disabled = false,
			key_bindings = {
				split_remain_focused = "K",
			},
		})
	end,
}
