-- [[ Setting options ]]
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "n"

-- only one statusline
vim.o.laststatus = 3
vim.o.statusline = "%F%m%r%h%w[FORMAT=%{&ff}][TYPE=%Y][POS=%l,%v][%p%%]"

-- Don't show the mode, since it's already in the status line
vim.o.showmode = false

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Enable break indent
vim.o.breakindent = true

-- Enable undo/redo changes even after closing and reopening a file
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.o.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" }

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Show which line your cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 18

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
vim.o.confirm = true

-- using space as indent
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2

-- nvim win border
vim.o.winborder = "single"

-- Diagnostic Config
vim.diagnostic.config({
	update_in_insert = false,
	severity_sort = true,
	float = { border = "single", source = "if_many" },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	-- Can switch between these as you prefer
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
})

-- vim shell
vim.o.shell = "fish"

-- color
vim.cmd.colorscheme("catppuccin-nvim")

-- title
vim.opt.title = true
local file = vim.fn.expand("%:t")
if file == "" then
	file = "---"
end

local path = vim.fn.expand("%:p:h")
local parts = vim.split(path, "/", { trimempty = true })

local dir
if #parts >= 2 then
	dir = parts[#parts - 1] .. "/" .. parts[#parts]
elseif #parts == 1 then
	dir = parts[#parts]
else
	dir = "~"
end
vim.o.titlestring = string.format("%s | %s Nvim", file, dir)
