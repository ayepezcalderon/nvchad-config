local M = {}

local dapui = require("dapui")
local dap = require("dap")
local utils = require("custom.utils")

--- Closes the (possibly) open ui
local function _close_ui()
  dap.listeners.before.event_terminated["dapui_config"] = function ()
    dapui.close()
    dap.repl.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function ()
    dapui.close()
    dap.repl.close()
  end
end

--- Loads default ui of nvim-dapui
function M.load_dapui()
  -- Open and close UI when debug is initialiaze and terminated/exited
  dap.listeners.after.event_initialized["dapui_config"] = function ()
    dap.repl.close()
    dapui.open()
    utils.delayed_dap_controls_refresh()
  end
  _close_ui()
end

--- Loads ui composed of a repl with the repl controls given by nbim-dapui
function M.load_repl_ui()
  -- Open and close repl when debug is initialiaze and terminated/exited
  -- First enable dapui controls for repl
  require('dapui.controls').enable_controls(require('dapui').elements['repl'])
  dap.listeners.after.event_initialized["dapui_config"] = function ()
    dapui.close()
    require('dapui.controls').refresh_control_panel()
    dap.repl.open()
  end
  _close_ui()
end

--- Loads repl controls (use when none of the other loaders is used)
function M.load_repl_controls()
  require('dapui.controls').enable_controls(require('dapui').elements['repl'])
  _close_ui()
end

return M
