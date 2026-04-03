return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			view = "cmdline",
		},
		views = {
			hover = {
				border = {
					style = "single",
				},
			},
		},
		presets = {
			lsp_doc_border = true,
		},
	},
}
