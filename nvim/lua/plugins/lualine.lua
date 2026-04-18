return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "kanagawa",
			component_separators = { left = "|", right = "|" },
			section_separators = "",
			icons_enabled = false, -- 关闭所有图标
		},
		sections = {
			lualine_a = {}, -- 清空 A
			lualine_b = {}, -- 清空 B
			-- 将所有内容集中在 lualine_c (左侧) 和 lualine_x (右侧)
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
