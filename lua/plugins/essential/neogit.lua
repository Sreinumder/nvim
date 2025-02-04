return {
  "NeogitOrg/neogit",
  cmd = "Neogit",
  keys = {
    {"<localleader>c", "<cmd>Neogit<CR>", {desc = "Neogit"}},
  },
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "ibhagwan/fzf-lua",              -- optional
  },
  opts = {
    kind = "floating",
    notification_icon = "N",
  }
}
