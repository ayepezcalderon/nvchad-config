local M = {}

-- Telescope functionality
-- Here for lazy loading only on dap demand, not on telescope demand
require("telescope").load_extension("dap")


-- Colors for the dap highlight groups
local bp_groups = {
  'DapBreakpoint',
  'DapBreakpointCondition',
  'DapLogPoint',
  'DapStopped',
  'DapBreakpointRejected',
}

--- Creates the colors for the stop dap hl
local function stop_hl()
  local group = 'DapStopped'
  local linehl = nil
  if vim.api.nvim_get_hl(0, {name=group}).bg and group then
    linehl = group
  end
  vim.fn.sign_define(group, {text=nil, texthl=group, linehl=linehl, numhl=''})
end

--- Creates symbols for dap breakpoints
function M.symbol_hls()
  stop_hl()
  vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
end

--- Creates the colors for the dap hls
function M.color_hls()
  stop_hl()
  for _, group in ipairs(bp_groups) do
    vim.fn.sign_define(group, {text=nil, texthl=group, linehl=nil, numhl=nil})
  end
end

return M
