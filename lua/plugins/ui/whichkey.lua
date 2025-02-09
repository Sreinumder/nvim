return {
	"folke/which-key.nvim",
  event = "UIEnter",
  cmd = "WhichKey",
  opts = {
    preset = "helix",
    triggers = {
      {";", mode = "nxso"},
      {"g", mode = "nxso"},
      {"<leader>s", mode = "nxso"},
      {"<leader>e", mode = "nxso"},
      {"<leader>y", mode = "nxso"},
      {"<leader>f", mode = "nxso"},
      {"<leader>l", mode = "nxso"},
      {"<leader>g", mode = "nxso"},
      {"<leader>i", mode = "nxso"},
      {"<leader>u", mode = "nxso"},
      {"g<leader>i", mode = "nxso"},
      {"g<leader>u", mode = "nxso"},
      {"c", mode = "nxso"},
      {"d", mode = "nxso"},
      {"s", mode = "nxso"},
      {'"', mode = "nxso"},
      {"'", mode = "nxso"},
      {"'", mode = "nxso"},
    },
    spec = {
      {
        mode = { "n", "v" },
        { ";", group = "local-leader" },
        { "<leader>", group = "leader" },
        { ";h", group = "hunks" },
        { ";t", group = "todo" },
        { ";n", group = "notes" },
        { ";w", group = "close buffer-tabs" },
        { ";;", group = "local-leader-other-layer" },
        { "<leader>d", group = "change directory"},
        { "<leader>e", group = "buffer operation" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>i", group = "increment", icon = { icon = "+ " }},
        { "<leader>l", group = "lsp" },
        { "<leader>t", group = "translate" },
        { "<leader>u", group = "decrement", icon = { icon = "- " }},
        { "<leader>y", group = "yank"},
        { "g<leader>", group = "increment/decrement"},
        { "g<leader>i", group = "increment", icon = { icon = "g+ " }},
        { "g<leader>u", group = "decrement", icon = { icon = "g- " }},
        { "gs", group = "get-surround" },
        { "cs", group = "change-surround" },
        { "ds", group = "delete-surround" },
      },
    },
  },
  keys = {
    {
      "<leader>w<space>",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "Window Hydra Mode (which-key)",
    },
  },
}
