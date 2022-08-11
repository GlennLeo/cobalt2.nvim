local M = {}


---Change cobalt2 option (vim.g.cobalt2_config.option)
---It can't be changed directly by modifing that field due to a Neovim lua bug with global variables (cobalt2_config is a global variable)
---@param opt string: option name
---@param value any: new value
function M.set_options(opt, value)
  local cfg = vim.g.cobalt2_config
  cfg[opt] = value
  vim.g.cobalt2_config = cfg
end

---Apply the colorscheme (same as ':colorscheme cobalt2')
function M.colorscheme()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
  vim.o.termguicolors = true
  vim.g.colors_name = "cobalt2"
  if vim.o.background == 'light' then
    M.set_options('style', 'light')
  elseif vim.g.cobalt2_config.style == 'light' then
    M.set_options('style', 'dark')
  end
  require('cobalt2.highlights').setup()
  require('cobalt2.terminal').setup()
end

local default_config = {
  -- Main options --
  style = 'dark', -- choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
  transparent = false, -- don't set background
  term_colors = true, -- if true enable the terminal
  ending_tildes = false, -- show the end-of-buffer tildes
  cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

  -- Changing Formats --
  code_style = {
    comments = 'italic',
    keywords = 'none',
    functions = 'none',
    strings = 'none',
    variables = 'none'
  },

  -- Custom Highlights --
  colors = {}, -- Override default colors
  highlights = {}, -- Override highlight groups

  -- Plugins Related --
  diagnostics = {
    darker = true, -- darker colors for diagnostic
    undercurl = true, -- use undercurl for diagnostics
    background = true, -- use background color for virtual text
  },
}

---Setup cobalt2.nvim options, without applying colorscheme
---@param opts table: a table containing options
function M.setup(opts)
  if not vim.g.cobalt2_config or not vim.g.cobalt2_config.loaded then -- if it's the first time setup() is called
    vim.g.cobalt2_config = vim.tbl_deep_extend('keep', vim.g.cobalt2_config or {}, default_config)
    M.set_options('loaded', true)
  end
  if opts then
    vim.g.cobalt2_config = vim.tbl_deep_extend('force', vim.g.cobalt2_config, opts)
  end
end

function M.load()
  vim.api.nvim_command('colorscheme cobalt2')
end

return M
