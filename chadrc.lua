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
M.lazy_nvim = require("custom.lazy_nvim")

return M
