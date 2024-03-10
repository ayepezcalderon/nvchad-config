-- Mappings
-- This function is a copy-paste from leap.create_default_mappings, with some exceptions
-- 1. The leap keys are arguments
-- 2. There is the option to override keys instead of raising warning
-- Needed due to some conflict with lazy.nvim
---@param leap_keys table<string>
---@param force boolean
local function create_default_mappings(leap_keys, force)
  for _, _1_ in ipairs({{{"n", "x", "o"}, leap_keys[1], "<Plug>(leap-forward)", "Leap forward"}, {{"n", "x", "o"}, leap_keys[2], "<Plug>(leap-backward)", "Leap backward"}, {{"n", "x", "o"}, leap_keys[3], "<Plug>(leap-from-window)", "Leap from window"}}) do
    local _each_2_ = _1_
    local modes = _each_2_[1]
    local lhs = _each_2_[2]
    local rhs = _each_2_[3]
    local desc = _each_2_[4]
    for _0, mode in ipairs(modes) do
      local rhs_2a = vim.fn.mapcheck(lhs, mode)
      if (rhs_2a == "") or force then
        vim.keymap.set(mode, lhs, rhs, {silent = true, desc = desc})
      else
        if (rhs_2a ~= rhs) then
          local msg = ("leap.nvim: create_default_mappings() " .. "found conflicting mapping for " .. lhs .. ": " .. rhs_2a)
          vim.notify(msg, vim.log.levels.WARN)
        else
        end
      end
    end
  end
  return nil
end
create_default_mappings({"s", "S", "gs"}, true)

-- Suggested additional tweaks
require('leap').opts.special_keys.prev_target = '<bs>'
require('leap').opts.special_keys.prev_group = '<bs>'
require('leap').opts.special_keys.next_target = '|'
require('leap').opts.special_keys.next_group = '|'
require('leap.user').set_repeat_keys('|', '<bs>')

-- Workaround for the duplicate cursor bug when autojumping (Until neovim/neovim#20793 is fixed)
-- Hide the (real) cursor when leaping, and restore it afterwards.
vim.api.nvim_create_autocmd('User', { pattern = 'LeapEnter',
    callback = function()
      vim.cmd.hi('Cursor', 'blend=100')
      vim.opt.guicursor:append { 'a:Cursor/lCursor' }
    end,
  }
)
vim.api.nvim_create_autocmd('User', { pattern = 'LeapLeave',
    callback = function()
      vim.cmd.hi('Cursor', 'blend=0')
      vim.opt.guicursor:remove { 'a:Cursor/lCursor' }
    end,
  }
)
