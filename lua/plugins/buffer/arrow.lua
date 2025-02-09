return {
  "otavioschwanck/arrow.nvim",
  enabled = true,
  keys = {
    {",", desc = "arrow mark"},
    {"m", desc = "arrow buffer"},
    -- {"<C-m>", function() require("arrow.persist").toggle() end, {desc = "arrow toggle"}},
  },
  opts = {
    show_icons = true,
    leader_key = 'm',
    buffer_leader_key = ',',
    mappings = {
      edit = ".",
      delete_mode = "k",
      clear_all_items = "C",
      toggle = "<leader>", -- add to arrow list
      open_vertical = "l",
      open_horizontal = "j",
      quit = "<ESC>",
      next_item = "m",
      prev_item = ","
    },
    save_key = "git_root", -- what will be used as root to save the bookmarks. Can be also `git_root` and `git_root_bare`.
    index_keys = "asdfqwerzxcv;jk123456789bnmZXVBNM,ghjklAFGHJKLtyuiopWRTYUIOP", -- keys mapped to bookmark index, i.e. 1st bookmark will be accessible by 1, and 12th - by c
    per_buffer_config = {
      sort_automatically = true, -- Auto sort buffer marks.
    },
    window = {
      width = 40
    }
  }
}
