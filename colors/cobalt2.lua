for k in pairs(package.loaded) do
    if k:match(".*cobalt2.*") then package.loaded[k] = nil end
end

require('cobalt2').setup()
require('cobalt2').colorscheme()
