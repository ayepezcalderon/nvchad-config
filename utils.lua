M = {}

--- Add keymaps to current buffer to easily close it with q and <ESC> in normal mode
function M.set_buf_easy_close_mappings()
  vim.keymap.set('n', 'q', "<cmd>:q<CR>", { buffer = 0 })
  vim.keymap.set('n', '<ESC>', "<cmd>:q<CR>", { buffer = 0 })
end

--- Refreshes the controls of the dapui repl with a delay. Default delay is 1ms.
function M.delayed_dap_controls_refresh(delay)
  local _delay = delay or 1

  vim.defer_fn(
  function()
    require('dapui.controls').refresh_control_panel()
  end,
  _delay)
end


return M
