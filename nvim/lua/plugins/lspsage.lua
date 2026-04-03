return {
	{
		"nvimdev/lspsaga.nvim",
		opts = {
			breadcrumbs = {
				enable = false,
			},
			lightbulb = {
				virtual_text = false,
			},
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
		},
	},
	-- {
	-- 	vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover doc" }),
	-- },
}
