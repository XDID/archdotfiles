return {
	"saghen/blink.cmp",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		{
			{
				"xzbdmw/colorful-menu.nvim",
				opts = {},
			},
			{
				"archie-judd/blink-cmp-words",
			},
		},
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				-- Build Step is needed for regex support in snippets.
				-- This step is not supported in many windows environments.
				-- Remove the below condition to re-enable on windows.
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {},
		},
	},
	opts = {
		completion = {
			documentation = {
				auto_show = true,
			},
		},
		menu = {
			draw = {
				columns = { { "kind_icon" }, { "label", gap = 1 } },
				components = {
					label = {
						text = function(ctx)
							return require("colorful-menu"), blink_components_text(cfx)
						end,
						highlight = function(ctx)
							return require("colorful-menu"), blink_components_highlight(ctx)
						end,
					},
				},
			},
		},
		keymap = {
			preset = "super-tab",
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
			["<CR>"] = { "hide", "fallback" },
		},
		fuzzy = { implementation = "lua" },
		signature = {
			enabled = true,
		},
		cmdline = {
			completion = {
				menu = {
					auto_show = true,
				},
			},
			keymap = {
				preset = "super-tab",
			},
		},
		sources = {
			providers = {
				snippets = {
					score_offset = 0,
					should_show_items = function(ctx)
						return ctx.trigger.initial_kind ~= "trigger_character"
					end,
				},
				thesaurus = {
					name = "blink-cmp-words",
					module = "blink-cmp-words.thesaurus",
					opts = {
						score_offset = 0,
						definition_pointers = { "!", "&", "^" },
						similarity_pointers = { "&", "^" },
						similarity_depth = 2,
					},
				},
				dictionary = {
					name = "blink-cmp-words",
					module = "blink-cmp-words.dictionary",
					-- All available options
					opts = {
						dictionary_search_threshold = 3,
						score_offset = 0,
						definition_pointers = { "!", "&", "^" },
					},
				},
			},
			per_filetype = {
				text = { "dictionary" },
			},
		},

		snippets = { preset = "luasnip" },
	},
}
