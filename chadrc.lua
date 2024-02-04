---@type ChadrcConfig
local M = {}

--- @type UIConfig
-- Values that change telescope changes dynamically in this location
M.ui = {
  theme = 'catppuccin',
  transparency = false,
}
-- Extend with static values in config file
M.ui = vim.tbl_deep_extend("force", M.ui, require("custom.ui"))

M.plugins = "custom.plugins"

M.mappings = require ("custom.mappings")

M.lazy_nvim = require("custom.lazy_nvim")

return M
