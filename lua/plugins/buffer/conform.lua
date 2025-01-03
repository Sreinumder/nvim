return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>fm",
			function()
				require("conform").format({ lsp_fallback = true })
			end,
			{ desc = "general format file" },
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			css = { "prettierd" },
			html = { "prettierd" },
			js = { "prettierd" },
			jsx = { "prettierd" },
			ts = { "prettierd" },
			tsx = { "prettierd" },
		},

		format_on_save = { -- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_fallback = true,
		},
	},
}
