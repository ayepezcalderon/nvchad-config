--- @type UIConfig
local ui = {
  theme = 'catppuccin',
  transparency = true,
  hl_override = {
    LineNr = {fg = "orange"},
    Comment = {fg = "light_grey"},
    IndentBlanklineContextStart = {bg = "NONE"},

    -- dap
    -- DapBreakpoint = {fg = "red"},
    -- DapStopped = {bg = "sun"}
  },
  extended_integrations = {
    "dap",
  }
}

return ui
