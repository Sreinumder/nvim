return {
  "echasnovski/mini.files",
  keys = {
    { "<A-Space>", function()  
      if not MiniFiles.close() then MiniFiles.open() end
    end , {desc= "mini.file"}},
    { "-", function() 
      local buffer_path = vim.api.nvim_buf_get_name(0)
      local parent_directory = vim.fn.fnamemodify(buffer_path, ":h") 
      print(parent_directory)
      require('mini.files').open(parent_directory) end , {desc= "mini.file"}
    },
  },
  opts = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowUpdate',
      callback = function(args) 
        vim.wo[args.data.win_id].relativenumber = true 
        vim.wo[args.data.win_id].number = true 
      end,
    })
    return {
      content = { prefix = function() end },
      mappings = {
        close       = '<ESC>',
        -- go_in       = '<A-l>',
        go_in       = '<A-l>',
        go_in_plus  = '<CR>',
        -- go_out      = '<A-h>',
        go_out      = '-',
        go_out_plus = '<A-h>',
        mark_goto   = "'",
        mark_set    = 'm',
        reset       = '<BS>',
        reveal_cwd  = '@',
        show_help   = 'g?',
        synchronize = '<leader><A-Space>',
        trim_left   = '<',
        trim_right  = '>',
      },

      -- General options
      options = { -- Whether to delete permanently or move into module-specific trash
        permanent_delete = true, -- Whether to use for editing directories
        use_as_default_explorer = true,
      },

      -- Customization of explorer windows
      windows = {
        max_number = math.huge,
        preview = true,
        width_focus = 50,
        width_nofocus = 15,
        width_preview = 25,
      },
    }
  end,
}
