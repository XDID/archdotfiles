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
				{
					"filename",
					padding = 1,
				},
				{
					"branch",
					padding = 1,
				},
				{
					"diff",
					padding = 1,
				},
				{
					"diagnostics",
					padding = 1,
				},
			},
			lualine_x = {
				{
					"overseer",
					padding = 1,
				},
				{
					"searchcount",
					padding = 1,
				},
				{
					"location",
					padding = 1,
				},
				{
					"progress",
					padding = 1,
				},
			},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
