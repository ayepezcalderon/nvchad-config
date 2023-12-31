local M = {}

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
  vim.fn.sign_define(group, {texthl=group, linehl=group, numhl=''})
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
