local colors = require("cobalt2.palette")

local function select_colors()
	local selected = { none = "none" }
	selected = vim.tbl_extend("force", selected, colors[vim.g.cobalt2_config.style])
	selected = vim.tbl_extend("force", selected, vim.g.cobalt2_config.colors)
	return selected
end

return select_colors()
