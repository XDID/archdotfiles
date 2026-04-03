return {
	"folke/snacks.nvim",
	lazy = false,
	opts = {
		indent = {
			enabled = true,
			indent = {
				enabled = false,
			},
			chunk = {
				enabled = true,
				char = {
					horizontal = "─",
					vertical = "│",
					corner_top = "╭",
					corner_bottom = "╰",
					arrow = "─",
				},
			},
			scope = {
				enabled = true,
				char = "│",
				underline = false,
				only_current = true,
				priority = 1000,
			},
		},
		picker = {
			matcher = { frecency = true, cwd_bonus = true, history_bonus = true },
			formatters = { icon_width = 3 },
			win = {
				input = {
					keys = {
						-- ["<Esc>"] = { "close", mode = { "n", "i" } },
						["<C-t>"] = { "edit_tab", mode = { "n", "i" } },
					},
				},
			},
		},
		terminal = {},
		dashboard = {
			enabled = true,
			preset = {
				keys = {
					{ icon = "󰈞 ", key = "f", desc = "Find files", action = ":lua Snacks.picker.smart()" },
					{ icon = " ", key = "h", desc = "Find history", action = "lua Snacks.picker.recent()" },
					{ icon = " ", key = "n", desc = "New file", action = ":enew" },
					{ icon = " ", key = "r", desc = "Recent files", action = ":lua Snacks.picker.recent()" },
					{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
				},
				header = [[
⣿⣿⣿⣿⣿⣿⣿⡿⠟⢿⣿⣿⣛⣛⣛⠛⠿⣿⣯⠈⣈⣤⡤⠤⢈⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣿⠟⢿⣿⣿⣿⠿⠿⠿⣿⣿⣿⣿⠀⣿⣿⣿⣿⣿⣿⣿⡿⢀⣿⣿⣿
⣿⣿⣿⣿⡁⢨⣤⣴⣿⣿⣿⠉⣿⣿⣿⣿⡄⢸⣿⡇⢉⣁⣀⠐⠛⢿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠻⣿⠁⣄⠙⢿⡗⢸⣿⣿⣶⡌⢻⡟⢀⣿⣿⠏⠀⢿⣿⣿⠇⢸⣿⣿⣿
⣿⣿⣿⣿⡇⠸⣿⠿⢿⣿⣿⠐⣿⣿⣿⣿⠃⣼⣿⣿⠈⣿⣿⣿⣿⣦⡌⢿⣿⣿⣿⣿⣿⣿⣿⣤⣉⣴⣿⡇⢸⣿⠘⣿⣿⣿⠇⢸⡇⢘⡿⢁⣴⡀⣾⣿⣿⣷⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡄⢲⣶⣾⣿⣿⣦⣭⣉⣉⣩⣼⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠿⠏⣸⣿⣦⣙⣛⣉⣴⣿⣷⣈⣠⣾⣿⡀⢿⣿⣿⠛⠛⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣷⣈⣀⣿⣿⣿
⣿⣿⣿⣿⣿⣿⡟⡃⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⢹⡿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠻⣿⣿
⠃⣤⣌⠙⠻⢏⣴⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠉⣴⡍⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢁⣴⣿⣧⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢠⠙⣿⣿⡿⢋⡴⢋⣾⣿⣿
⣦⠙⢿⣿⣷⣿⣿⢡⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡏⢰⣿⣿⣦⡈⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⣠⣿⣿⣿⣿⣦⠘⣿⣿⣿⣿⣿⣿⣿⣿⣧⠈⣧⡈⠛⢡⠎⣰⣿⣿⣿⣿
⣿⣷⣦⣉⠛⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣾⣿⣿⣿⣿⣦⢸⠻⠿⠿⠿⠿⠿⠿⠇⢰⣿⣿⣿⣿⣿⣿⡄⢻⣿⣿⣿⣿⣿⣿⣿⣿⣦⠙⣷⡾⢃⣾⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣯⣼⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣶⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣷⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⡆⠹⢣⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⠟⣛⠻⢋⣵⠀⣿⣿⣿⠇⢼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡂⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡀⣿⣷⣿⢋⣾⣿⣿⣿⡆⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠻⢿⣿⣿⣿⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⡟⢿⣿⣿⣿⣧⡈⠛⣡⣿⣿⣿⣿⣿⣿⠎⣻⣿⣿⡇⠀⠀⢹⣿⣿⣿⣿⢿⣿⣿⣿⣿⡁⠄⢀⣿⣿⣿⣿⡿⣿⣿⣿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⡍⣛⠋⠀⢰⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⣏⣉⣉⠀⣹⣿⣿⡿⠷⣶⣿⣿⣿⠟⢀⡉⢿⣿⣿⣿⣿⣿⡿⢿⠟⠛⣻⣇⢠⣬⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⡄⠟⢠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⢀⡿⠑⣋⡄⣼⣿⣿⣿⣯⣴⣿⣿⣤⣽⣿⣿⣿⣿⣀⣴⣮⣤⣾⠇⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢁⣠⠈⢷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢀⣍⣙⡉⢹⣿⣿⡿⠿⣿⣿⣿⡿⣡⠂⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⡟⢠⠙⡿⠉⠀⣿⣿⣿⣿⣷⣦⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⣼⣿⣿⣿⣿⣿⣿⠀⣶⣄⢙⢋⣼⢏⣼⣿⣿⣿⣿⣿
⣿⣿⣿⣿⠁⣌⠙⠛⠇⠸⠁⠀⣰⢡⣿⣿⣿⣿⣿⣿⣷⣤⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡉⢿⣿⣿⣿⣿⣿⣧⠈⢿⣿⣿⢇⣼⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⡆⢻⡇⠐⠀⠀⠀⢠⠃⣾⣿⣿⣿⣿⠋⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠻⣿⣿⣿⣿⣿⣷⣤⡙⢋⣼⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⡌⠁⢀⡆⠀⠀⡎⣼⣿⣿⣿⠿⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣄⠘⢿⣿⣿⣿⣿⣿⣯⣾⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣦⡘⠃⠀⡸⣰⣿⣿⡟⢋⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠙⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿
⣿⣿⣿⣿⣿⣿⠛⢿⣦⣄⢡⣿⡿⠏⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⠘⢿⣿⣿⣿⣿⣿⠿⠻⠿⠿⠟⣡⡆
⣿⣿⣿⣿⣿⣿⣆⠀⡙⠿⠀⡿⢁⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣌⠻⣿⣿⣿⣧⠐⣿⣶⣶⣾⡿⣸
⣿⣿⣿⣿⣿⣿⣿⣧⡊⢷⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡈⠿⣿⣿⣧⡌⠻⠿⢿⢡⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⢀⠀⢿⣿⣿⣿⣿⣿⢿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣆⠙⣿⣿⣿⣷⣶⣾⣿⣿
⣿⣿⣿⣿⣿⣿⣿⡿⢁⣼⣃⢿⣿⣿⣿⣿⢉⣠⠆⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⢠⣍⡙⠻⣿⣿⣿⣿⣿⣇⠸⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⠃⣼⣿⣗⢸⣿⠟⠁⣨⣿⣿⢀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢺⣿⣿⣦⣉⠻⣿⣿⣿⣿⠞⢉⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⢂⠹⢿⣿⡈⢏⣴⣾⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣶⣄⣁⣠⣤⣴⣾⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣶⣶⣬⣩⣥⠾⣿⣿⣿⣿⣿⢘⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣿⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡗⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
]],
			},
			sections = {
				{ section = "header" },
				{ icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
			},
		},
		image = {
			enabled = false,
		},
		styles = {
			snacks_image = {
				border = "rounded",
				backdrop = false,
			},
		},
	},
	keys = {
		{
			"<leader>sf",
			function()
				Snacks.picker.smart()
			end,
			desc = "[F]iles",
		},
		{
			"<leader>sr",
			function()
				Snacks.picker.recent()
			end,
			desc = "[R]ecent",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.grep()
			end,
			desc = "[C]ontent",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help({ layout = "dropdown" })
			end,
			desc = "[H]elp",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps()
			end,
			desc = "[K]eymap",
		},
		{
			"<leader><leader>",
			function()
				Snacks.picker.buffers({ sort_lastused = true })
			end,
			desc = "Buffers",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks()
			end,
			desc = "[M]arks",
		},
		{
			"<leader>sn",
			function()
				Snacks.picker.notifications()
			end,
			desc = "[N]otifications",
		},
		{
			"<leader>sS",
			function()
				Snacks.picker.lsp_workspace_symbols()
			end,
			desc = "[S]ymbols",
		},
		{
			"<leader>ss",
			function()
				local bufnr = vim.api.nvim_get_current_buf()
				local clients = vim.lsp.get_clients({ bufnr = bufnr })
				local function has_lsp_symbols()
					for _, client in ipairs(clients) do
						if client.server_capabilities.documentSymbolProvider then
							return true
						end
					end
					return false
				end

				local picker_opts = {
					layout = "right",
					tree = true,
					on_show = function()
						vim.cmd.stopinsert()
					end,
				}
				if has_lsp_symbols() then
					Snacks.picker.lsp_symbols(picker_opts)
				else
					Snacks.picker.treesitter()
				end
			end,
			desc = "[S]ymbols tree",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.lsp_incoming_calls()
			end,
			desc = "[I]ncoming calls",
		},
		{
			"<leader>so",
			function()
				Snacks.picker.lsp_outgoing_calls()
			end,
			desc = "[O]utgoing calls",
		},
		{
			"<leader>sb",
			function()
				Snacks.picker.lines()
			end,
			desc = "Search [b]uffer",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "[D]iagonostics",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[C]onfig",
		},
		{
			"<leader>sN",
			function()
				Snacks.picker.todo_comments({ keywords = { "NOTE" }, layout = "select", buffers = true })
			end,
			desc = "[N]otes",
		},
		{
			"<leader>st",
			function()
				if vim.bo.filetype == "markdown" then
					Snacks.picker.grep_buffers({
						finder = "grep",
						format = "file",
						prompt = " ",
						search = "^\\s*- \\[ \\]",
						regex = true,
						live = false,
						args = { "--no-ignore" },
						on_show = function()
							vim.cmd.stopinsert()
						end,
						buffers = false,
						supports_live = false,
						layout = "ivy",
					})
				else
					Snacks.picker.todo_comments({
						keywords = { "TODO", "FIX", "FIXME", "HACK" },
						layout = "select",
						buffers = true,
					})
				end
			end,
			desc = "[T]odo",
		},
		-- other map
		{
			"<leader>bd",
			function()
				Snacks.bufdelete.delete()
			end,
			desc = "[B]uffer [c]lose",
		},
		{
			"<leader>bo",
			function()
				Snacks.bufdelete.other()
			end,
			desc = "[B]uffer [o]nly",
		},
		{
			"<leader>sT",
			function()
				local function get_tabs()
					local tabs = {}
					local tabpages = vim.api.nvim_list_tabpages()
					for i, tabpage in ipairs(tabpages) do
						local wins = vim.api.nvim_tabpage_list_wins(tabpage)
						local cur_win = vim.api.nvim_tabpage_get_win(tabpage)
						local buf = vim.api.nvim_win_get_buf(cur_win)
						local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":t")
						if name == "" then
							name = "[No Name]"
						end

						local preview_lines = {}
						table.insert(preview_lines, ("Tab %d: %d window%s"):format(i, #wins, #wins == 1 and "" or "s"))
						table.insert(preview_lines, ("%-6s %-8s %s"):format("WinID", "Buf#", "File"))
						table.insert(preview_lines, string.rep("-", 40))
						for _, win in ipairs(wins) do
							local win_buf = vim.api.nvim_win_get_buf(win)
							local bufname = vim.api.nvim_buf_get_name(win_buf)
							if bufname == "" then
								bufname = "[No Name]"
							end
							bufname = vim.fn.fnamemodify(bufname, ":~:.") -- relative to cwd, or ~
							local win_marker = (win == cur_win) and "->" or "  "
							table.insert(preview_lines, ("%s %-6d %-8d %s"):format(win_marker, win, win_buf, bufname))
						end
						if #wins == 0 then
							table.insert(preview_lines, "No windows in tab")
						end

						table.insert(tabs, {
							idx = i,
							text = ("Tab %d: %s"):format(i, name),
							tabnr = i,
							tabpage = tabpage,
							preview = {
								text = table.concat(preview_lines, "\n"),
								ft = "text",
							},
						})
					end
					return tabs
				end
				local items = get_tabs()
				Snacks.picker({
					title = "Tabs",
					items = items,
					format = "text",
					confirm = function(picker, item)
						picker:close()
						vim.cmd(("tabnext %d"):format(item.tabnr))
					end,
					preview = "preview",
					actions = {
						close_tab = function(picker, item)
							picker:close()
							vim.cmd(("tabclose %d"):format(item.tabnr))
						end,
					},
					win = {
						input = {
							keys = {
								["d"] = "close_tab",
							},
						},
					},
				})
			end,
			desc = "[T]abs",
		},
		{
			"<C-\\>",
			function()
				Snacks.terminal.toggle()
			end,
			desc = "toggle terminal",
		},
	},
}
