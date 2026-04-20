return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "kanagawa",
			component_separators = { left = "|", right = "|" },
			section_separators = "",
			icons_enabled = false,
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				"mode",
				"filename",
				"branch",
				"diff",
				"diagnostics",
			},
			lualine_x = {
				"overseer",
				"searchcount",
				"location",
				"progress",
			},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
