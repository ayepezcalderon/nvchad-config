---@type MappingsTable
local M = {}

--- Add keymaps to current buffer to easily close it with q and <ESC> in normal mode
local function set_buf_easy_close_mappings()
  vim.keymap.set('n', 'q', "<cmd>:q<CR>", { buffer = 0 })
  vim.keymap.set('n', '<ESC>', "<cmd>:q<CR>", { buffer = 0 })
end

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },

    ["<leader>tt"] = {
      function()
         require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
  },

  v = {
    ["<leader>fm"] = {
      function ()
          vim.lsp.buf.format({
          async = true,
          })
      end,
      "LSP formatting",
    }
  },
}

local neogen_opts = { noremap = true, silent = true }
M.neogen = {
  n = {
    ["<leader>fd"] = {
      function ()
        require("neogen").generate({ type = 'func' })
      end,
      "Function docstring",
      opts = neogen_opts,
    },

    ["<leader>cd"] = {
      function ()
        require("neogen").generate({ type = 'class' })
      end,
      "Class docstring",
      opts = neogen_opts,
    },
  },
}

M.dap = {
  plugin = true,

  n = {
    -- for general convenience
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Debug breakpoint"},
    ['<Leader>dr'] = {function() require('dap').repl.toggle() end, "dap repl toggle"},
    ['<Leader>dtm'] = {
      function()
        require('dap').terminate()
        require('dap').repl.close()
      end,
      "dap terminate",
    },
    ['<Leader>dcb'] = {
      function()
        require('dap').clear_breakpoints()
      end,
      "dap clear breakpoints",
    },
    ['<Leader>dtc'] = {
      function()
        require('dap').run_to_cursor()
      end,
      "dap run to cursor",
    },

    -- for debugging actions
    ['<F2>'] = {function() require('dap').down() end, "dap down"},
    ['<F3>'] = {function() require('dap').up() end, "dap up"},
    ['<F5>'] = {function() require('dap').continue() end, "dap continue"},
    ['<F7>'] = {function() require('dap').step_over() end, "dap step over"},
    ['<F8>'] = {function() require('dap').step_into() end, "dap step into"},
    ['<F9>'] = {function() require('dap').step_out() end, "dap step out"},

    -- for widgets
    ['<Leader>dh'] = {
      function()
        require('dap.ui.widgets').hover()
        set_buf_easy_close_mappings()
      end,
      "dap hover",
    },
    ['<Leader>dp'] = {
      function()
        require('dap.ui.widgets').preview()
      end,
      "dap preview",
    },
    ['<Leader>df'] = {
      function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
        set_buf_easy_close_mappings()
      end,
      "dap frames",
    },
    ['<Leader>ds'] = {
      function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
        set_buf_easy_close_mappings()
      end,
      "dap scopes",
    },
  },
}

M.dapui = {
  plugin = true,

  n = {
    ["<leader>dui"] = {function() require("dapui").toggle() end, "dapui toggle"},
    ["<leader>dw"] = {
      function()
        require("dapui").float_element('watches')
      end,
      "dapui watches",
    },
    ["<leader>dco"] = {
      function()
        require("dapui").float_element('console')
      end,
      "dapui console",
    },
    ["<leader>dlb"] = {
      function()
        require("dapui").float_element('breakpoints')
      end,
      "dapui list breakpoints",
    },
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
        require('dap-python').test_method()
      end,
      "Debug python run"
    }
  }
}

M.black = {
  n = {
    ["<leader>kn"] = {
      function ()
        vim.fn.setreg('+', '# fmt: on', 1)  -- Set the register '+'
        vim.cmd('normal! "+p')  -- Paste from register '+'
      end,
      "black-> # fmt: on",
    },
    ["<leader>kf"] = {
      function ()
        vim.fn.setreg('+', '# fmt: off', 1)  -- Set the register '+'
        vim.cmd('normal! "+p')  -- Paste from register '+'
      end,
      "black-> # fmt: off",
    },
    ["<leader>ks"] = {
      function ()
        vim.fn.setreg('+', '# fmt: skip', 1)  -- Set the register '+'
        vim.cmd('normal! "+p')  -- Paste from register '+'
      end,
      "black-> # fmt: skip",
    },
  },
}


return M

