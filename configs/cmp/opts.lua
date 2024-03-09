local opts = {
  enabled = function()
    local disabled = false
    disabled = disabled or (vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
        and not require("cmp_dap").is_dap_buffer())
    disabled = disabled or (vim.fn.reg_recording() ~= '')
    disabled = disabled or (vim.fn.reg_executing() ~= '')
    return not disabled
  end,
}

return opts
