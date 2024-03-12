local actions = require("telescope.actions")
require("trouble")
local trouble = require("trouble.providers.telescope")

local _core_extensions = require("plugins.configs.telescope").extensions_list
local _custom_extensions = {
  "session-lens",
  "yank_history",
}
local extensions_list = {}
for i=1, #_core_extensions do
    table.insert(extensions_list, _core_extensions[i])
end
for i=1, #_custom_extensions do
    table.insert(extensions_list, _custom_extensions[i])
end


local opts = {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
  extensions_list = extensions_list,
}

return opts
