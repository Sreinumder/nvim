return {
  'echasnovski/mini.pairs',
  version = '*',
  event = "InsertEnter",
  opts = {},
  init = function()
    local lt_opts = {
      action = 'open',
      pair = '<>',
      neigh_pattern = '\r.',
      register = { cr = false },
    }
    require("mini.pairs").map('i', '<', lt_opts)
  end
}
