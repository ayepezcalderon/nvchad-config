local opts = {
  enabled = function()
    local disabled = false
    disabled = disabled or (vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt')
    disabled = disabled or (vim.fn.reg_recording() ~= '')
    disabled = disabled or (vim.fn.reg_executing() ~= '')
    disabled = disabled or require("cmp_dap").is_dap_buffer()
    return not disabled
  end,
}

return opts
