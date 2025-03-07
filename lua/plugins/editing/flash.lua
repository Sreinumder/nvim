return {
	"folke/flash.nvim",
	opts = {
		modes = {
			char = {
				enabled = true,
				autohide = false,
				jump_labels = false,
				highlight = { backdrop = false },
				keys = { "f", "F", "t", "T", [";"] = "<A-n>", [","] = "<A-p>"},
        char_actions = function(motion)
            return {
              -- clever-f style
              [motion:lower()] = "next",
              [motion:upper()] = "prev",
            }
          end,
			},
			search = {
				enabled = false,
				jump_labels = false,
			},
		},
		rainbow = {
			enabled = true,
			-- number between 1 and 9
			shade = 5,
		},
	},
	keys = {
		{ "f" },
		{ "t" },
		{
			"<leader>;",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash Jump",
		},
		{
			"ir",
			mode = { "x", "o" },
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
		{
			"r",
			mode = "o",
			function()
				require("flash").remote()
			end,
			desc = "Remote Flash",
		},
		-- {
		-- 	"S",
		-- 	mode = { "o"},
		-- 	function()
		-- 		require("flash").treesitter_search()
		-- 	end,
		-- 	desc = "Treesitter Search",
		-- },
		{
			"<A-s>",
			mode = { "c" },
			function()
				require("flash").toggle()
			end,
			desc = "Toggle Flash Search",
		},
		{
			";*",
			mode = { "n", "x" },
			function()
				require("flash").jump({
					pattern = vim.fn.expand("<cword>"),
				})
			end,
      desc = "current word flash"
		},
		-- { "tj", mode = { "n" }, function()
		--   require("flash").jump({
		--     search = { mode = "search", max_length = 0 },
		--     label = { after = { 0, 0 } },
		--     pattern = "^"
		--   })
		-- end, desc = "Toggle Flash Search" },
	},
  init = function()
    vim.api.nvim_set_hl(0, 'FlashLabel', {fg = '#000000', bg = '#4078f2' })
    vim.api.nvim_set_hl(0, 'FlashMatch', {fg = '#fafafa', bg = '#4078f2'})
    vim.api.nvim_set_hl(0, 'FlashCurrent', {fg = '#fafafa', bg = '#4078f2'})
    vim.api.nvim_set_hl(0, 'FlashCursor', {fg = '#fafafa', bg = '#4078f2'})
  end,
}
