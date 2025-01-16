local map = vim.keymap.set
local nomap = vim.keymap.del
nomap("n", "<S-h>")
nomap("n", "<S-l>")
map({ "n", "x", "o" }, "<S-h>", "^", { desc = "^" })
map({ "n", "x", "o" }, "<S-l>", "g_", { desc = "g_" })
map({ "n", "x" }, "<A-n>", ";", { desc = "Down" })
map({ "n", "x" }, "<A-p>", ",", { desc = "Up" })

-- delete with x d or D and cut with alt + x + d + D
map({ "n", "x" }, "x", '"_x')
map({ "n", "x" }, "X", '"_X')
map({ "n", "x" }, "d", '"_d')
map({ "n", "x" }, "D", '"_D')
map({ "n", "x" }, "c", '"_c')
map({ "n" }, "c", '"_c')
map({ "n", "x" }, "C", '"_C')
map({ "n", "x" }, "<A-x>", "x")
map({ "n", "x" }, "<A-X>", "X")
map({ "n", "x" }, "<A-d>", "d")
map({ "n", "x" }, "<A-D>", "D")
map({ "n", "x" }, "<A-c>", "c")
map({ "n", "x" }, "<A-C>", "C")
map({ "n", "x" }, "<A-d><A-d>", "dd")
map({ "n", "x" }, "<A-c><A-c>", "cc")
map({ "v", "x" }, "p", '"_dP')
map({ "v", "x" }, "P", '"_dp')
map({ "v", "x" }, "<A-p>", "p")
map({ "v", "x" }, "<A-P>", "P")

-- simple editing hacks
-- clone sentences up and down
map("n", "<A-J>", 'V"cy"cP==gv<Esc>', { desc = "clone line Down" })
map("n", "<A-K>", 'V"cy"cgp==gv<Esc>', { desc = "clone line Up" })
map("x", "<A-J>", '"cy"cP==gv', { desc = "clone selection Down" })
map("x", "<A-K>", '"cy"cgp==gv', { desc = "clone selection Up" })

map("n", "<A-y>", 'V"cy"cP==<CMD>norm gcc<CR>gv<Esc>', { desc = "tiny versioning" })

-- move/clone selection to new line above or below
map("x", "<leader><A-j>", '"bdo<esc>"bp==', { desc = "move selection Down(v) to new line" })
map("x", "<leader><A-k>", '"bdO<esc>"bp==', { desc = "move selection Up(v) to new line" })
map("x", "<leader><A-J>", '"byo<esc>"bp==', { desc = "clone selection Down(v) to new line" })
map("x", "<leader><A-K>", '"byO<esc>"bp==', { desc = "clone selection Up(v) to new line" })

-- move selection with vi motion of web(ge)/WEB(GE)/HML/gg/G
map("n", "<A-v>", "vlh", { desc = "vi single char under cursor" })
map("x", "<A-w>", '"bdw"bp`[v`]', { desc = "move selection with w" })
map("x", "<A-e>", '"bde"bp`[v`]', { desc = "move selection with e" })
map("x", "<A-b>", '"bdb"bP`[v`]', { desc = "move selection with b" })
map("x", "<A-W>", '"bdW"bp`[v`]', { desc = "move selection with W" })
map("x", "<A-E>", '"bdE"bp`[v`]', { desc = "move selection with e" })
map("x", "<A-B>", '"bdB"bP`[v`]', { desc = "move selection with b" })
map("x", "<A-H>", '"bd^"bP`[v`]', { desc = "move selection with H" })
map("x", "<A-M>", '"bdgM"bP`[v`]', { desc = "move selection with H" })
map("x", "<A-L>", '"bd$"bp`[v`]', { desc = "move selection with L" })
map("x", "<A-g><A-e>", '"bdge"bp`[v`]', { desc = "move selection with ge" })
map("x", "<A-g><A-E>", '"bdgE"bp`[v`]', { desc = "move selection with gE" })
map("x", "<A-g><A-g>", '"bdgg"bp`[v`]', { desc = "move selection with gg" })
map("x", "<A-G>", '"bdG"bp`[v`]', { desc = "move selection with G" })
map("x", "<A-{>", '"bd{"bp`[v`]', { desc = "move selection with {" })
map("x", "<A-}>", '"bd}"bp`[v`]', { desc = "move selection with }" })

map("i", "<c-u>", "<Esc>viw~ea", { desc = "toggle case" })
map("i", "<c-t>", "<Esc>b~lea", { desc = "change word case to title" })
map("i", "<C-k>", function() -- capitalize word
  local line = vim.fn.getline(".")
  local col = vim.fn.getpos(".")[3]
  local substring = line:sub(1, col - 1)
  local result = vim.fn.matchstr(substring, [[\v<(\k(<)@!)*$]])
  return "<C-w>" .. result:upper()
end, { expr = true })
map("i", "<C-l>", '<C-r>=expand("%:p:h") . "/" <CR>', { desc = "write file path" })

--- Emacs style
map({ "i", "c", "t" }, "<A-h>", "<Left>", { desc = "Insert mode left" })
map({ "i", "c", "t" }, "<A-j>", "<Down>", { desc = "Insert mode down" })
map({ "i", "c", "t" }, "<A-k>", "<Up>", { desc = "Insert mode up" })
map({ "i", "c", "t" }, "<A-l>", "<Right>", { desc = "Insert mode Right" })
map({ "i", "c" }, "<C-A>", "<HOME>")
map({ "i", "c" }, "<C-E>", "<END>")
map("c", "<C-A-K>", "\\(.*\\)", { desc = "kirby " })

-- look for changes
vim.cmd([[command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis | wincmd p | diffthis]])
map("n", "<leader>sc", "<cmd>DiffOrig<CR>", { desc = "unsaved changes diff" })

-- Move to window using the <ctrl> hjkl keys
nomap("n", "<C-h>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<C-l>")

-- Resize window using <ctrl> arrow keys
nomap("n", "<C-Up>")
nomap("n", "<C-Down>")
nomap("n", "<C-Left>")
nomap("n", "<C-Right>")

-- Move Lines
nomap("n", "<A-j>")
nomap("n", "<A-k>")
nomap("i", "<A-j>")
nomap("i", "<A-k>")
nomap("v", "<A-j>")
nomap("v", "<A-k>")

-- buffers
nomap("n", "[b")
nomap("n", "]b")
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
nomap("n", "<leader>bD")

-- Clear search and stop snippet on escape
-- map({ "i", "n", "s" }, "<esc>", function()
--   vim.cmd("noh")
--   LazyVim.cmp.actions.snippet_stop()
--   return "<esc>"
-- end, { expr = true, desc = "Escape and Clear hlsearch" })

-- save file
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

--keywordprg
-- map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })

-- commenting
map("n", "gcO", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gco", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- lazy
nomap("n", "<leader>l")

-- new file
nomap("n", "<leader>fn")

nomap("n", "<leader>xl")
nomap("n", "<leader>xq")
map("n", "<leader>ql", "<cmd>lopen<cr>", { desc = "Location List" })
map("n", "<leader>qf", "<cmd>copen<cr>", { desc = "Quickfix List" })

-- formatting
nomap({ "n", "v" }, "<leader>cf")

nomap("n", "<leader>cd")
-- map("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
-- map("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
-- map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
-- map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
-- map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
-- map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- toggle options
LazyVim.format.snacks_toggle():map(",uf")
LazyVim.format.snacks_toggle(true):map(",uF")
Snacks.toggle.option("spell", { name = "Spelling" }):map(",us")
Snacks.toggle.option("wrap", { name = "Wrap" }):map(",uw")
Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map(",uL")
Snacks.toggle.diagnostics():map(",ud")
Snacks.toggle.line_number():map(",ul")
Snacks.toggle.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2, name = "Conceal Level" }):map(",uc")
Snacks.toggle.option("showtabline", { off = 0, on = vim.o.showtabline > 0 and vim.o.showtabline or 2, name = "Tabline" }):map(",uA")
Snacks.toggle.treesitter():map(",uT")
Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map(",ub")
Snacks.toggle.dim():map(",uD")
Snacks.toggle.animate():map(",ua")
Snacks.toggle.indent():map(",ug")
Snacks.toggle.scroll():map(",uS")
Snacks.toggle.profiler():map(",dpp")
Snacks.toggle.profiler_highlights():map(",dph")
if vim.lsp.inlay_hint then
  Snacks.toggle.inlay_hints():map(",uh")
end

-- lazygit
if vim.fn.executable("lazygit") == 1 then
  map("n", "<leader>glg", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
  map("n", "<leader>glG", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
  map("n", "<leader>glf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
  map("n", "<leader>gll", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log" })
  map("n", "<leader>glL", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
end

-- map("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
-- map({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
-- map({"n", "x" }, "<leader>gY", function()
--   Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
-- end, { desc = "Git Browse (copy)" })

-- quit
nomap("n", "<leader>qq")

-- highlights under cursor
nomap("n", "<leader>ui")
nomap("n", "<leader>uI")

-- LazyVim Changelog
nomap("n", "<leader>L")
map("n", "<leader>nnn", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })

-- floating terminal
nomap("n", "<leader>fT")
nomap("n", "<leader>ft")
nomap("n", "<c-/>")
nomap("n", "<c-_>")

-- Terminal Mappings
nomap("t", "<C-/>")
nomap("t", "<c-_>")

-- windows
nomap("n", "<leader>w")
nomap("n", "<leader>-")
nomap("n", "<leader>|")
nomap("n", "<leader>wd")
-- Snacks.toggle.zoom():map(",wm"):map(",uZ")
-- Snacks.toggle.zen():map(",uz")

-- tabs
nomap("n", "<leader><tab>l")
nomap("n", "<leader><tab>o")
nomap("n", "<leader><tab>f")
nomap("n", "<leader><tab><tab>")
nomap("n", "<leader><tab>]")
nomap("n", "<leader><tab>d")
nomap("n", "<leader><tab>[")
