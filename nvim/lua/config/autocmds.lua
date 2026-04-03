-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- this is to auto change input method
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		vim.fn.system('echo $(fcitx5-remote -n) > "/tmp/nvim-im-status"')
		vim.fn.system("fcitx5-remote -s keyboard-us")
	end,
})

vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		local im = vim.fn.system('cat "/tmp/nvim-im-status" 2>/dev/null || echo ""')
		if im == "" then
			return
		else
			vim.fn.system(string.format("fcitx5-remote -s %s", im))
		end
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		vim.fn.system("rm -rf /tmp/nvim-im-status")
	end,
})

-- quicknote auto insert tag
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = vim.fn.expand("~/Documents/Quicknotes/*.md"),
	callback = function()
		local date = os.date("%Y-%m-%d")

		vim.api.nvim_buf_set_lines(0, 0, -1, false, {
			"tag:",
			"date:" .. date,
			"",
		})

		vim.api.nvim_win_set_cursor(0, { 1, 5 })
		vim.cmd("startinsert!")
	end,
})
