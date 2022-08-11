local c = require('cobalt2.colors')
local cfg = vim.g.cobalt2_config
local colors = {
  bg = c.bg_blue,
  fg = c.fg,
  red = c.red,
  green = c.green,
  yellow = c.yellow,
  orange = c.orange,
  blue = c.blue,
  purple = c.purple,
  cyan = c.cyan,
  gray = c.grey,
  black = c.black
}

local cobalt2 = {
  inactive = {
    a = { fg = colors.gray, bg = colors.bg, gui = 'bold' },
    b = { fg = colors.gray, bg = colors.bg },
    c = { fg = colors.gray, bg = cfg.transparent and c.none or c.bg_blue },
  },
  normal = {
    a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
    b = { fg = colors.black, bg = c.bg_blue },
    c = { fg = colors.black, bg = cfg.transparent and c.none or c.bg_blue },
  },
  visual = { a = { fg = colors.black, bg = colors.purple, gui = 'bold' } },
  replace = { a = { fg = colors.black, bg = colors.red, gui = 'bold' } },
  insert = { a = { fg = colors.black, bg = colors.blue, gui = 'bold' } },
  command = { a = { fg = colors.black, bg = colors.orange, gui = 'bold' } },
  terminal = { a = { fg = colors.black, bg = colors.cyan, gui = 'bold' } },
}
return cobalt2;
