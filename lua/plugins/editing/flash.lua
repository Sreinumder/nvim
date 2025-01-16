return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    modes = {
      char = {
        enabled = false,
        autohide = true,
        jump_labels = false,
        highlight = { backdrop = false },
      },
      search = {
        enabled = true,
        jump_labels = false,
      },
    },
    rainbow = {
      enabled = false,
      shade = 1,
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
      desc = "Flash",
    },
    {
      "R",
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
    { "s", false },
    { "S", false },
    {
      "<leader>ts",
      mode = { "o", "x" },
      function()
        require("flash").treesitter_search()
      end,
      desc = "Treesitter Search",
    },
    { "<A-s>", false },
    -- {
    --   "<A-8>",
    --   mode = { "n" },
    --   function()
    --     require("flash").jump({ pattern = vim.fn.expand("<cword>") })
    --   end,
    --   desc = "Toggle Flash Search",
    -- },
    -- {
    --   "<leader>mj",
    --   mode = { "n", "x" },
    --   function()
    --     require("flash").jump({
    --       pattern = vim.fn.expand("<cword>"),
    --     })
    --   end,
    -- },
    -- { "tj", mode = { "n" }, function()
    --   require("flash").jump({
    --     search = { mode = "search", max_length = 0 },
    --     label = { after = { 0, 0 } },
    --     pattern = "^"
    --   })
    -- end, desc = "Toggle Flash Search" },
  },
}
