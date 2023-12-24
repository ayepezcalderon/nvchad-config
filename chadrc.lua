---@type ChadrcConfig
local M = {}

--- @type UIConfig
M.ui = {
  theme = 'catppuccin',
  transparency = true,
  hl_override = {
    LineNr = {fg = "orange"},
    Comment = {fg = "light_grey"},
  }
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
