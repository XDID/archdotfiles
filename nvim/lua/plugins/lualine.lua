local function bracket(component)
	return {
		component,
		padding = { left = 0, right = 0 },
		fmt = function(str)
			if str == nil or str == "" then
				return ""
			end

			return "%#lualine_c_normal#[%s" .. str .. "%#lualine_c_normal#]%s"
		end,
	}
end

return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {
			theme = "kanagawa",
			component_separators = { left = "", right = "" },
			section_separators = "",
			icons_enabled = false,
		},
		sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {
				{
					"filename",
					path = 3,
					shorting_target = 0,
					padding = { left = 0, right = 0 },
				},
				bracket("branch"),
				bracket("diff"),
				bracket("diagnostics"),
			},
			lualine_x = {
				bracket("overseer"),
				"searchcount",
				{
					function()
						local current = vim.fn.line(".")
						local total = vim.fn.line("$")
						return string.format("[%d/%d]", current, total)
					end,
				},
			},
			lualine_y = {},
			lualine_z = {},
		},
	},
}
