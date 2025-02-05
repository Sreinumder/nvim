local options = {
	base46 = {
    theme = "everblush",
		hl_override = {
			-- Override or add custom highlight groups
			CursorLine = {
				bg = "#1e2227", -- Dark gray background
				underline = false, -- Add an underline
				italic = false, -- Make the text italic
			},
      CurSearch = { bg = "#607D8B" },
			Search = { bg = "#607D8B" },
			IncSearch = { bg = "#607D8B" },
		},
		transparency = false,
		theme_toggle = { "everblush", "one_light" },
	},

	ui = {
		cmp = {
			icons_left = false, -- only for non-atom styles!
			lspkind_text = true,
			style = "default", -- default/flat_light/flat_dark/atom/atom_colored
			format_colors = {
				tailwind = true, -- will work for css lsp too
				icon = "󱓻",
			},
		},

		telescope = { style = "borderless" }, -- borderless / bordered

		statusline = {
			enabled = true,
			theme = "default",
			separator_style = "block",
			order = { "file", "git", "%=", "macro", "lsp_msg", "%=", "lsp", "diagnostics" },
			modules = {
				macro = function()
					local reg = vim.fn.reg_recording()
					if reg == "" then
						return " " -- not recording
					end
					return "rec @" .. reg .. " "
				end,
			},
		},

		-- lazyload it when there are 1+ buffers
		tabufline = {
			enabled = false,
			lazyload = true,
			order = { "treeOffset", "buffers", "tabs", "btns" },
			modules = nil,
		},
	},

	nvdash = { load_on_startup = false },

	term = {
		winopts = { number = false, relativenumber = false },
		sizes = { sp = 0.48, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
		float = {
			relative = "editor",
			row = 0.0,
			col = 0.0,
			width = 1.0,
			height = 0.8,
			border = "single",
		},
	},

	lsp = { signature = false },

	cheatsheet = {
		theme = "simple", -- simple/grid
		excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
	},

	mason = { pkgs = {}, skip = {} },

	colorify = {
		enabled = false,
		mode = "virtual", -- fg, bg, virtual
		virt_text = "󱓻 ",
		highlight = { hex = true, lspvars = true },
	},
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
