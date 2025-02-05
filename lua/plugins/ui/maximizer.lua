return {
	"szw/vim-maximizer",
	keys = {
		{ mode = "n", "<leader>F", "<cmd>MaximizerToggle<CR>", { desc = "toggle maximize " } },
		{ mode = "x", "<leader>F", "<cmd>MaximizerToggle<CR>gv", { desc = "toggle maximize " } },
		-- {mode="i", "<leader>mt", "<C-o>:MaximizerToggle<CR>", {desc = "toggle maximize "}}
	},
}
