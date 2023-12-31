---@type ChadrcConfig
local M = {}

--- @type UIConfig
M.ui = require("custom.ui")
M.plugins = "custom.plugins"
M.mappings = require ("custom.mappings")
M.lazy_nvim = require("custom.lazy_nvim")

return M
