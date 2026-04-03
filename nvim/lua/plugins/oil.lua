function _G.get_oil_winbar()
	local dir = require("oil").get_current_dir()
	if dir then
		return vim.fn.fnamemodify(dir, ":~")
	else
		return vim.api.nvim_buf_get_name(0)
	end
end

return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		keys = {
			{ "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
		},
		dependencies = { "nvim-mini/mini.icons", opts = {} },
		opts = {
			default_file_explorer = true,
			win_options = {
				winbar = "%!v:lua.get_oil_winbar()",
			},
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["<C-j>"] = false,
				["<C-k>"] = false,
				["<C-r>"] = "actions.refresh",
				["<leader>y"] = "actions.yank_entry",
				["g."] = false,
				["zh"] = "actions.toggle_hidden",
				["\\"] = { "actions.select", opts = { horizontal = true } },
				["|"] = { "actions.select", opts = { vertical = true } },
				["-"] = "actions.close",
				["q"] = "actions.close",
				["<BS>"] = "actions.parent",
				["gd"] = {
					desc = "Toggle file detail view",
					callback = function()
						detail = not detail
						if detail then
							require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
						else
							require("oil").set_columns({ "icon" })
						end
					end,
				},
			},
		},
	},
}
