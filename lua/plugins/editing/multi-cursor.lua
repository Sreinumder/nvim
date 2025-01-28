return {
	"jake-stewart/multicursor.nvim",
  enabled = false,
	keys = function()
		local M = {
			{
				mode = { "n", "v" },
				"<C-A-k>",
				function()
					require("multicursor-nvim").lineAddCursor(-1)
				end,
			},
			{
				mode = { "n", "v" },
				"<C-A-j>",
				function()
					require("multicursor-nvim").lineAddCursor(1)
				end,
			},
			{
				mode = { "n", "v" },
				"<leader><C-A-K>",
				function()
					require("multicursor-nvim").lineSkipCursor(-1)
				end,
			},
			{
				mode = { "n", "v" },
				"<leader><C-A-J>",
				function()
					require("multicursor-nvim").lineSkipCursor(1)
				end,
			},
			{
				mode = { "n", "v" },
				"<C-A-p>",
				function()
					require("multicursor-nvim").matchAddCursor(-1)
				end,
			}, -- Add or skip adding a new cursor by matching word/selection
			{
				mode = { "n", "v" },
				"<C-A-p>",
				function()
					require("multicursor-nvim").matchSkipCursor(-1)
				end,
			},
			{
				mode = { "n", "v" },
				"<C-A-8>",
				function()
					require("multicursor-nvim").matchAddCursor(1)
				end,
			},
			{
				mode = { "n", "v" },
				"<C-A-S-8>",
				function()
					require("multicursor-nvim").matchSkipCursor(1)
				end,
			},

			{ mode = { "n", "v" }, "<C-A-/>", require("multicursor-nvim").matchAllAddCursors }, -- Add all matches in the document

			-- You can also add cursors with any motion you prefer:
			-- {mode="n", "<right>", function() require("multicursor-nvim").addCursor("w") end},
			{
				mode = "n",
				"<leader><right>",
				function()
					require("multicursor-nvim").skipCursor("w")
				end,
			},

			-- Rotate the main cursor.
			{ mode = { "n", "v" }, "<A-[>", require("multicursor-nvim").prevCursor },
			{ mode = { "n", "v" }, "<A-]>", require("multicursor-nvim").nextCursor },

			-- Delete the main cursor.
			{ mode = { "n", "v" }, "<C-A-x>", require("multicursor-nvim").deleteCursor },

			-- Add and remove cursors with control + left click.
			{ mode = "n", "<c-leftmouse>", require("multicursor-nvim").handleMouse },

			-- Easy way to add and remove cursors using the main cursor.
			{ mode = { "n", "v" }, "<c-q>", require("multicursor-nvim").toggleCursor },

			-- Clone every cursor and disable the originals.
			{ mode = { "n", "v" }, "<leader><c-q>", require("multicursor-nvim").duplicateCursors },

      {
				mode = "n",
				"<C-esc>",
				function()
					if not require("multicursor-nvim").cursorsEnabled() then
						require("multicursor-nvim").enableCursors()
					elseif require("multicursor-nvim").hasCursors() then
						require("multicursor-nvim").clearCursors()
					else
						-- Default <esc> handler.
					end
				end,
			},
			{
				mode = "n",
				";<esc>",
				function()
					if not require("multicursor-nvim").cursorsEnabled() then
						require("multicursor-nvim").enableCursors()
					elseif require("multicursor-nvim").hasCursors() then
						require("multicursor-nvim").clearCursors()
					else
						-- Default <esc> handler.
					end
				end,
			},

			{ mode = "n", ";gv", require("multicursor-nvim").restoreCursors }, -- bring back cursors if you accidentally clear them
			{ mode = "n", "<leader>ga", require("multicursor-nvim").alignCursors }, -- Align cursor columns.

			-- Split visual selections by regex.

			-- Append/insert for each line of visual selections.
			{ mode = "v", "I", require("multicursor-nvim").insertVisual },
			{ mode = "v", "A", require("multicursor-nvim").appendVisual },

			-- match new cursors within visual selections by regex.
			{ mode = "v", "M", require("multicursor-nvim").matchCursors },

			-- Rotate visual selection contents.
			{
				mode = "v",
				"<A-(",
				function()
					require("multicursor-nvim").transposeCursors(-1)
				end,
			},
			{
				mode = "v",
				"<A-)",
				function()
					require("multicursor-nvim").transposeCursors(1)
				end,
			},

			-- Jumplist support
			{ mode = { "v", "n" }, "<c-i>", require("multicursor-nvim").jumpForward },
			{ mode = { "v", "n" }, "<c-o>", require("multicursor-nvim").jumpBackward },
		}
		return M
	end,
	opts = function()
		local hl = vim.api.nvim_set_hl
		hl(0, "MultiCursorCursor", { bg = "#48573c" })
		hl(0, "MultiCursorVisual", { bg = "#cc9999" })
		hl(0, "MultiCursorSign", { link = "SignColumn" })
		hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
		hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
		hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
		return {}
	end,
}
