return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		{ "catppuccin/nvim", name = "catppuccin" }, -- 确保依赖顺序
	},
	config = function()
		local function setup_lualine()
			local lualine = require("lualine")

			local flavor = require("catppuccin").flavour
			local colors = require("catppuccin.palettes").get_palette(flavor)

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
			}

			local config = {
				options = {
					component_separators = "",
					section_separators = "",
					theme = {
						normal = { c = { fg = colors.text, bg = nil } },
						inactive = { c = { fg = colors.text, bg = colors.base } },
					},
				},
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
			}
			icons_enabled = true

			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end

			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			local function mode_color()
				local m = vim.fn.mode():sub(1, 1)
				local colors_map = {
					n = colors.blue,
					i = colors.rosewater,
					v = colors.pink,
					s = colors.mauve,
					r = colors.red,
					c = colors.red,
					t = colors.rosewater,
				}
				return colors_map[string.lower(m)]
			end

			-- ins_left({
			-- 	function()
			-- 		local mode = vim.fn.mode():sub(1, 1)
			-- 		return mode
			-- 	end,
			-- 	fmt = string.upper,
			-- 	-- color = function()
			-- 	-- 	return { fg = colors.base, bg = mode_color(), gui = "bold" }
			-- 	-- end,
			-- })

			ins_left({
				"filetype",
				icon_only = true,
				colored = false,
				padding = { left = 1, right = 0 },
			})

			ins_left({
				"filename",
				cond = conditions.buffer_not_empty,
				padding = { left = 0, right = 1 },
			})

			ins_left({
				"branch",
				icon = "",
				color = { fg = colors.text },
			})

			ins_left({
				"diff",
				symbols = { added = " ", modified = "󰝤 ", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.peach },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			})

			ins_left({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
				diagnostics_color = {
					error = { fg = colors.red },
					warn = { fg = colors.yellow },
					info = { fg = colors.sky },
				},
			})

			ins_right({
				"lsp_status",
				icon = "", -- f013
				symbols = {
					spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
					done = "✓",
					separator = " ",
				},
				ignore_lsp = {
					"stylua",
				},
				show_name = true,
			})

			ins_right({
				"o:encoding",
				fmt = string.upper,
				cond = conditions.hide_in_width,
				color = { fg = colors.text, gui = "bold" },
			})

			ins_right({
				"location",
				padding = { left = 1, right = 1 },
			})

			ins_right({
				function()
					local sbar = { "🭶", "🭷", "🭸", "🭹", "🭺", "🭻" }
					local curr_line = vim.api.nvim_win_get_cursor(0)[1]
					local lines = vim.api.nvim_buf_line_count(0)
					local i = math.floor((curr_line - 1) / lines * #sbar) + 1
					return string.rep(sbar[i], 1)
				end,
				padding = { left = 0, right = 0 },
			})

			lualine.setup(config)
		end

		setup_lualine()

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("LualineDynamicCatppuccin", { clear = true }),
			pattern = "*",
			callback = function()
				setup_lualine()
			end,
		})
	end,
}
