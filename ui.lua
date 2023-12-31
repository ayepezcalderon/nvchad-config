--- @type UIConfig
local ui = {
  hl_override = {
    LineNr = {fg = "orange"},
    Comment = {fg = "light_grey"},
    IndentBlanklineContextStart = {bg = "NONE"},

    -- dap --> uncomment to override nvchad cached colors
    -- DapBreakpoint = {fg = "red"},
    -- DapStopped = {bg = "sun"}
    -- DapBreakpoint = {fg = "blue"},
  },
  hl_add = {
    -- dap -> uncomment to define hls when nvchad defaults are not used
    DapBreakpoint = { fg = "red" },
    DapBreakpointCondition = { fg = "yellow" },
    DapLogPoint = { fg = "cyan" },
    DapStopped = {
      fg = "baby_pink",
      -- bg="blue",
    },
  },
  -- uncomment entries to use/restore nvchad cached defaults
  extended_integrations = {
    -- "dap",
  }
}

return ui
