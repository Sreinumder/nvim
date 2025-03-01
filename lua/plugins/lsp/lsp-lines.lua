return {
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	name = "lsp_lines",
	dependencies = { "neovim/nvim-lspconfig" },
	-- event = { "LspAttach" },
	keys = {
		{
			"<M-,>",
			function()
				require("lsp_lines").toggle()
			end,
			mode = { "n", "v" },
			desc = "Toggle lsp_lines",
		},
	},
	config = function(_, opts)
		-- vim.diagnostic.config({
		-- 	virtual_text = false,
		-- })
		require("lsp_lines").setup(opts)
		-- vim.diagnostic.config({ virtual_text = false })
	end,
}
