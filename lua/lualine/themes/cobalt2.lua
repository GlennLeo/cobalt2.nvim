local c = require('cobalt2.colors')
local cfg = vim.g.cobalt2_config
local colors = {
    bg = c.bg_blue,
    fg = c.fg,
    red = c.red,
    green = c.green,
    yellow = c.yellow,
    blue = c.blue,
    purple = c.purple,
    cyan = c.cyan,
    gray = c.grey
}

local cobalt2 = {
    inactive = {
        a = {fg = colors.gray, bg = colors.bg, gui = 'bold'},
        b = {fg = colors.gray, bg = colors.bg},
        c = {fg = colors.gray, bg = cfg.transparent and c.none or c.bg1},
    },
    normal = {
        a = {fg = colors.bg, bg = colors.yellow, gui = 'bold'},
        b = {fg = colors.fg, bg = c.bg3},
        c = {fg = colors.fg, bg = cfg.transparent and c.none or c.bg1},
    },
    visual = {a = {fg = colors.bg, bg = colors.purple, gui = 'bold'}},
    replace = {a = {fg = colors.bg, bg = colors.red, gui = 'bold'}},
    insert = {a = {fg = colors.bg, bg = colors.blue, gui = 'bold'}},
    command = {a = {fg = colors.bg, bg = colors.yellow, gui = 'bold'}},
    terminal = {a = {fg = colors.bg, bg = colors.cyan, gui = 'bold'}},
}
return cobalt2;
