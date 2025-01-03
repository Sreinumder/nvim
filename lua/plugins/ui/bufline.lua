return {
	"romgrk/barbar.nvim",
	event = "UIEnter",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		-- animation = true,
		-- insert_at_start = true,
		-- …etc.
	},
	keys = {
		{ "<Tab>", "<Cmd>BufferNext<CR>", { desc = "buffer next" } },
		{ "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "buffer prev" } },
		{ "<C-Tab>", "<Cmd>BufferMoveNext<CR>", { desc = "buffer move right" } },
		{ "<C-S-Tab>", "<Cmd>BufferMovePrevious<CR>", { desc = "buffer move left" } },
		{ "<A-w>", "<Cmd>BufferClose<CR>", { desc = "buffer close" } },
		{ "<A-W>", "<Cmd>BufferRestore<CR>", { desc = "buffer restore" } },
		{ "<leader><tab>", "<Cmd>BufferPick<CR>", { desc = "buffer pick" } },
		{ "<leader><A-w>", "<Cmd>BufferPickDelete<CR>", { desc = "buffer pick delete" } },
		--            :BufferCloseAllButCurrent
		--            :BufferCloseAllButVisible
		--            :BufferCloseAllButPinned
		--            :BufferCloseAllButCurrentOrPinned
		--            :BufferCloseBuffersLeft
		--            :BufferCloseBuffersRight
		-- { "<localleader>bpi", "<Cmd>BufferPin<CR>", { desc = "buffer pin" } },
		-- { "<localleader>bpl", "<Cmd>BufferGotoPinned<CR>", { desc = "buffer pinned" } },
		-- { "<localleader>bpp", "<Cmd>BufferGotoUnpinned<CR>", { desc = "buffer unpinned" } },
	},
}
