-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- quit and save key
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "[Q]uit nvim" })
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force [q]uit nvim" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "[S]ave file" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>", { desc = "[S]ave file" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist, { desc = "Open [d]iagnostic Quickfix list" })

-- exit terminal
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "<C-\\>", "<C-\\><C-n><cmd>lua Snacks.terminal.toggle()<cr>", { desc = "Exit terminal mode" })

-- TIP: use arrow key split window
vim.keymap.set("n", "|", ":leftabove vs<CR>")
vim.keymap.set("n", "\\", "<cmd>split<cr>")

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- move window
vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- tab operation
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "[T]ab [n]ew" })
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "[T]ab [c]lose" })
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "[T]ab [o]nly" })
vim.keymap.set("n", "<leader>t]", "<cmd>tabnext<cr>", { desc = "[T]ab next" })
vim.keymap.set("n", "<leader>t[", "<cmd>tabprev<cr>", { desc = "[T]ab prev" })
