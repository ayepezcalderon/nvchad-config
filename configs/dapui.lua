local M = {}

local dapui = require("dapui")
local dap = require("dap")
local utils = require("custom.utils")

--- Closes the (possibly) open ui
---@param close_repl boolean wether repl should be closed.
---@param close_dapui boolean wether dapui should be closed.
local function _close_ui(close_repl, close_dapui)
  dap.listeners.before.event_terminated["dapui_config"] = function ()
    if close_dapui then
      dapui.close()
    end
    if close_repl then
      dap.repl.close()
    end
  end
  dap.listeners.before.event_exited["dapui_config"] = function ()
    if close_dapui then
      dapui.close()
    end
    if close_repl then
      dap.repl.close()
    end
  end
end

--- Loads default ui of nvim-dapui
---@param close_repl boolean wether repl should be closed upon terminate/exit events.
---@param close_dapui boolean wether dapui should be closed upon terminate/exit events.
function M.load_dapui(close_repl, close_dapui)
  -- Open and close UI when debug is initialiaze and terminated/exited
  dap.listeners.after.event_initialized["dapui_config"] = function ()
    dap.repl.close()
    dapui.open()
    utils.delayed_dap_controls_refresh()
  end
  _close_ui(close_repl, close_dapui)
end

--- Loads ui composed of a repl with the repl controls given by nbim-dapui
---@param close_repl boolean wether repl should be closed upon terminate/exit events.
---@param close_dapui boolean wether dapui should be closed upon terminate/exit events.
function M.load_repl_ui(close_repl, close_dapui)
  -- Open and close repl when debug is initialiaze and terminated/exited
  -- First enable dapui controls for repl
  require('dapui.controls').enable_controls(require('dapui').elements['repl'])
  dap.listeners.after.event_initialized["dapui_config"] = function ()
    dapui.close()
    require('dapui.controls').refresh_control_panel()
    dap.repl.open()
  end
  _close_ui(close_repl, close_dapui)
end

--- Loads repl controls (use when none of the other loaders is used)
---@param close_repl boolean wether repl should be closed upon terminate/exit events.
---@param close_dapui boolean wether dapui should be closed upon terminate/exit events.
function M.load_repl_controls(close_repl, close_dapui)
  require('dapui.controls').enable_controls(require('dapui').elements['repl'])
  _close_ui(close_repl, close_dapui)
end

return M
