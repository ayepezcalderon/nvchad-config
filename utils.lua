local M = {}

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

--- Custom dap repl toggle function. Can enter repl in insert mode when toggle opens
function M.custom_dap_repl_toggle(insert, ...)
  if not require("dap").repl.close({ mode = 'toggle' }) then
    require("dap").repl.open(...)
    -- Move to repl
    vim.cmd(":wincmd p")
    -- Enter insert mode if required
    if insert then
      vim.cmd("startinsert")
    end
  end
end


return M
