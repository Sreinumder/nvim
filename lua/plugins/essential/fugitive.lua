  return {
    "tpope/vim-fugitive",
    cmd = { "Git", "Dot", "Yit", "Gread", "Gwrite", "Gvdiffsplit", "Gdiffsplit" },
    keys = {
      {"<leader>ss", "<CMD>Git<CR>", desc = "Git" },
      {"<leader>sr", "<CMD>Gread<CR>", desc = "Gread (reset)" },
      {"<leader>sw", "<CMD>Gwrite<CR>", desc = "Gwrite (stage)" },
      {"<leader>sb", "<CMD>Git blame<CR>", desc = "git blame" },
      {"<leader>sD", "<CMD>Git diff<CR>", desc = "Git diff (project)" },
      {"<leader>sD", "<CMD>Gvdiffsplit!<CR>", desc = "Git diff (buffer)" },
      {"<leader>sP", "<CMD>Git push<CR>", desc = "Git push" },
      {"<leader>sp", "<CMD>Git pull<CR>", desc = "Git pull" },
      {"<leader>s+", "<CMD>Git stash push<CR>", desc = "Git stash push" },
      {"<leader>s-", "<CMD>Git stash pop<CR>", desc = "Git stash pop" },
      {"<leader>sl", "<CMD>Git log --stat %<CR>", desc = "Git log (buffer)" },
      {"<leader>sL", "<CMD>Git log --stat -n 100<CR>", desc = "Git log (project)" }
    }
  }
