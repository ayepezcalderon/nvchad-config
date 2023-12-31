local actions = require("telescope.actions")
require("trouble")
local trouble = require("trouble.providers.telescope")

local opts = {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

return opts
