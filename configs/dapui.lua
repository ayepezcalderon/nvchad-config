local M = {}

local dapui = require("dapui")
local dap = require("dap")

--- Loads default ui of nvim-dapui
function M.load_dapui()
  -- Open and close UI when debug is initialiaze and terminated/exited
  dap.listeners.after.event_initialized["dapui_config"] = function ()
    dap.repl.close()
    dapui.open()
    require('dapui.controls').refresh_control_panel()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function ()
    dap.repl.close()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function ()
    dap.repl.close()
    dapui.close()
  end
end

--- Loads ui composed of a repl with the repl controls given by nbim-dapui
function M.load_repl_ui()
  -- Open and close repl when debug is initialiaze and terminated/exited
  -- First enable dapui controls for repl
  require('dapui.controls').enable_controls(require('dapui').elements['repl'])
  dap.listeners.after.event_initialized["dap_repl"] = function ()
    dapui.close()
    require('dapui.controls').refresh_control_panel()
    dap.repl.open()
  end
  dap.listeners.before.event_terminated["dap_repl"] = function ()
    dap.repl.close()
    dapui.close()
  end
  dap.listeners.before.event_exited["dap_repl"] = function ()
    dap.repl.close()
    dapui.close()
  end
end

return M
