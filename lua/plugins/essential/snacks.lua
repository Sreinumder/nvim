return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		dashboard = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		notifier = {
			enabled = true,
			{
				timeout = 3000, -- default timeout in ms
				width = { min = 40, max = 0.4 },
				height = { min = 1, max = 0.6 },
				-- editor margin to keep free. tabline and statusline are taken into account automatically
				margin = { top = 0, right = 1, bottom = 0 },
				padding = true, -- add 1 cell of left/right padding to the notification window
				sort = { "level", "added" }, -- sort by level and time
				-- minimum log level to display. TRACE is the lowest
				-- all notifications are stored in history
				level = vim.log.levels.TRACE,
				icons = {
					error = " ",
					warn = " ",
					info = " ",
					debug = " ",
					trace = " ",
				},
				keep = function(notif)
					return vim.fn.getcmdpos() > 0
				end,
				style = "compact",
				top_down = true, -- place notifications from top to bottom
				date_format = "%R", -- time format for notifications
				more_format = " ↓ %d lines ",
				refresh = 50, -- refresh at most every 50ms
			},
		},
		quickfile = { enabled = true },
		scroll = { enabled = false },
		statuscolumn = { enabled = true },
		words = { enabled = true },
		lazygit = {
			configure = true,
			config = {
				os = { editPreset = "nvim-remote" },
				gui = {
					-- set to an empty string "" to disable icons
					nerdFontsVersion = "3",
				},
			},
			theme_path = vim.fs.normalize(vim.fn.stdpath("cache") .. "/lazygit-theme.yml"),
			theme = {
				[241] = { fg = "Special" },
				activeBorderColor = { fg = "MatchParen", bold = true },
				cherryPickedCommitBgColor = { fg = "Identifier" },
				cherryPickedCommitFgColor = { fg = "Function" },
				defaultFgColor = { fg = "Normal" },
				inactiveBorderColor = { fg = "FloatBorder" },
				optionsTextColor = { fg = "Function" },
				searchingActiveBorderColor = { fg = "MatchParen", bold = true },
				selectedLineBgColor = { bg = "Visual" }, -- set to `default` to have no background colour
				unstagedChangesColor = { fg = "DiagnosticError" },
			},
			win = {
				style = "lazygit",
			},
		},
	},
}
