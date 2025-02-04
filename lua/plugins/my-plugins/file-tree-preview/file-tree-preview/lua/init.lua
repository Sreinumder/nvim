-- File: ~/projects/personal/lua/file-tree-preview.nvim/lua/file-tree-preview.lua

local M = {}

M.config = {
	title = 'file-tree-preview',
	width = 30,
	position = "right",
	show_hidden = false,
	icons = true,
	sort_by = "name",
}

-- Check if exa is installed
local function check_exa()
	local handle = io.popen("which exa")
	local result = handle:read("*a")
	handle:close()

	if result == "" then
		vim.notify("exa is not installed. Please install exa first.", vim.log.levels.ERROR)
		return false
	end
	return true
end

-- Create buffer for tree view
local function create_tree_buffer()
	local buf = vim.api.nvim_create_buf(false, true)
	vim.bo[buf].buftype   = "nofile"
	vim.bo[buf].bufhidden = "wipe"
	vim.bo[buf].filetype  = "ExaTree"
	return buf
end

-- Get directory tree using exa
local function get_tree(path, show_hidden)
	local cmd = "exa --tree"
	if show_hidden then
		cmd = cmd .. " -a"
	end
	if M.opts.icons then
		cmd = cmd .. " --icons"
	end

	cmd = cmd .. " --sort=" .. M.opts.sort_by
	cmd = cmd .. ' "' .. path .. '"'

	local handle = io.popen(cmd)
	local result = handle:read("*a")
	handle:close()

	return vim.split(result, "\n")
end

-- Update tree view
function M.update_tree()
	if not check_exa() then
		return
	end

	local current_file = vim.fn.expand("%:p")
	local current_dir = vim.fn.expand("%:p:h")

	local tree_content = get_tree(current_dir, M.opts.show_hidden)
	local buf = create_tree_buffer()

	-- Set buffer content
	vim.api.nvim_buf_set_lines(buf, 0, -1, false, tree_content)

	-- Create window for tree view
	local win_opts = {
		relative = "editor",
		width = M.opts.width,
		height = vim.api.nvim_get_option("lines"),
		row = 0,
		col = M.opts.position == "left" and 0 or (vim.o.columns - M.opts.width),
		style = "minimal",
		border = "single",
	}

	local win = vim.api.nvim_open_win(buf, false, win_opts)

	vim.api.wo[win].wrap = false
	vim.api.wo[win].cursorline = true
	return buf, win
end

-- Toggle tree view
function M.toggle_tree()
	local existing_win = vim.fn.bufwinnr("ExaTree")
	if existing_win ~= -1 then
		vim.api.nvim_command(existing_win .. "wincmd c")
	else
		M.update_tree()
	end
end
-- Set up commands
local function create_commands()
	vim.api.nvim_create_user_command("ToggleTree", M.toggle_tree, {
		desc = "Toggle file tree preview",
	})

	vim.api.nvim_create_user_command("ToggleHidden", M.toggle_hidden, {
		desc = "Toggle hidden files",
	})

	vim.api.nvim_create_user_command("TreeSort", function(opts)
		M.change_sort(opts.args)
	end, {
		desc = "Change sort order",
		nargs = 1,
		complete = function()
			return { "name", "size", "date", "type" }
		end,
	})
end

function M.setup(opts)
	M.opts = vim.tbl_deep_extend("force", M.defaults, opts or {})
	print('helo')
	-- Set up keymaps
	vim.keymap.set("n", "<Leader>et", M.toggle_tree, {
		silent = true,
		desc = "Toggle Exa Tree",
	})

	-- Create commands
	create_commands()
end

return M
