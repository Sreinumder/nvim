return {
  "folke/snacks.nvim",
  enabled = true,
  lazy = false,
  opts = {
    quickfile = { enabled = true },
    picker = {
      layout = {
        backdrop = false,
        row = 1,
        width = 0.4,
        min_width = 80,
        height = 0.8,
        border = "none",
        box = "vertical",
        { win = "preview", title = "{preview}", height = 0.4, border = "rounded" },
        {
          box = "vertical",
          border = "rounded",
          title = "{title} {live} {flags}",
          title_pos = "center",
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
        },
      },
    },
    explorer = {},
    gitbrowse = { enabled = true },
  },
  keys = {
    { "<leader>go", function() Snacks.gitbrowse() end, desc = "open gitbrowse", mode = { "n", "x"}},
    -- Top Pickers & Explorer
    -- { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    -- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    -- find
    -- { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    -- { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    -- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    -- { "<leader>fo", function() Snacks.picker.recent() end, desc = "Recent" },
    -- Grep
    { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    -- { "<leader>sw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    -- search
    { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
    { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
    { "<leader>su", function() Snacks.picker.undo() end, desc = "Undo History" },
  },
}
