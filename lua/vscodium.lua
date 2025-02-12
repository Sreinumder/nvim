local lazy_config = require("lazy-config")
vim.opt.shortmess:append("I")

require("lazy").setup({
  { import = "plugins.treesitter" },
  { import = "plugins.editing" },
  -- { import = "plugins.git+others" },

  -- just use multicursor of nvim
  -- {
  --   'vscode-neovim/vscode-multi-cursor.nvim',
  --   event = 'VeryLazy',
  --   enabled = false
  --   cond = not not vim.g.vscode,
  --   config = function()
  --     local cursors = require('vscode-multi-cursor')
  --     local map = vim.keymap.set
  --     map({ 'n', 'x' }, 'mc', cursors.create_cursor, { expr = true, desc = 'vscode-mc Create cursor' })
  --     map({ 'n' }, 'mcc', cursors.cancel, { desc = 'vscode-mc Cancel/Clear all cursors' })
  --     map({ 'n', 'x' }, 'mi', cursors.start_left, { desc = 'vscode-mc Start cursors on the left' })
  --     map({ 'n', 'x' }, 'mI', cursors.start_left_edge, { desc = 'vscode-mc Start cursors on the left edge' })
  --     map({ 'n', 'x' }, 'ma', cursors.start_right, { desc = 'vscode-mc Start cursors on the right' })
  --     map({ 'n', 'x' }, 'mA', cursors.start_right, { desc = 'vscode-mc Start cursors on the right' })
  --     map({ 'n' }, '[mc', cursors.prev_cursor, { desc = 'vscode-mc Goto prev cursor' })
  --     map({ 'n' }, ']mc', cursors.next_cursor, { desc = 'vscode-mc Goto next cursor' })
  --     map({ 'n' }, 'mcs', cursors.flash_char, { desc = 'vscode-mc Create cursor using flash' })
  --     map({ 'n' }, 'mcw', cursors.flash_word, { desc = 'vscode-mc Create selection using flash' })
  --   end,
  -- }
}, lazy_config)
require("options")
require("mappings")
require("hacks")
local map = vim.keymap.set
map("n", "<leader>f", function() require("vscode").action("workbench.action.quickOpen") end, {desc = "open quickpicker"})
map("n", "<leader>j", function() require("vscode").action("workbench.action.showCommands") end, {desc = "commands"})
map("n", "<leader>k", function() require("vscode").action("workbench.action.showAllEditors") end, {desc = "tabs"})

map("n", "<A-o>", function() require("vscode").action("breadcrumbs.focusAndSelect") end, {desc = "breadcrumbs.toggle"})
map("n", ";hr", function() require("vscode").action("git.revertSelectedRanges") end, {desc = "reset range"})
map("n", ";hs", function() require("vscode").action("git.stageSelectedRanges") end, {desc = "stage range"})
map("n", ";hu", function() require("vscode").action("git.unstageSelectedRanges") end, {desc = "unstage range"})
map("n", ";hd", function() require("vscode").action("git.openChange") end, {desc = "buffer diff"})
map("n", ";ho", function() require("vscode").action("gitlens.openOnlyChangedFiles") end, {desc = "gitlens.openOnlyChangedFiles"})

map("n", "]c", function() require("vscode").action("editor.action.marker.nextInFiles") end, {desc = "breadcrumbs.toggle"})
map("n", "[c", function() require("vscode").action("editor.action.marker.prevInFiles") end, {desc = "breadcrumbs.toggle"})

map("n", ",s", function() require("vscode").action("editor.action.toggleStickyScroll") end, {desc = "toggle sticky scroll"})
map("n", ",o", function() require("vscode").action("breadcrumbs.toggle") end, {desc = "toggle breadcrumbs"})
map("n", ",i", function() require("vscode").action("workbench.action.toggleStatusbarVisibility") end, {desc = "toggle statusbar"})

-- map("n", "<A-w>", function()
--   require("vscode").action("workbench.action.closeWindow")
-- end, {desc = "open periscope"})

-- <C-p> for workspace file picker
-- <C-S-p> for command palleke
-- <C-g> for line jumper
-- <C-S-o> for current document symbol picker
-- <C-o> for workspace document symbol picker
-- <C-S-.> or <C->> for breadcrumb focus

-- <C-K><C-R> for hunk reset