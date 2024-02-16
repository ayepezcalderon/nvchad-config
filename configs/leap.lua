-- Default mappings
require('leap').create_default_mappings()

-- Suggested additional tweaks
require('leap').opts.special_keys.prev_target = '<bs>'
require('leap').opts.special_keys.prev_group = '<bs>'
require('leap.user').set_repeat_keys('<cr>', '<bs>')

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
