---@type MappingsTable
local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },
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
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Debug breakpoint"},
    ['<F5>'] = {function() require('dap').continue() end, "dap continue"},
    ['<F7>'] = {function() require('dap').step_over() end, "dap step over"},
    ['<F8>'] = {function() require('dap').step_into() end, "dap step into"},
    ['<F9>'] = {function() require('dap').step_out() end, "dap step out"},
    ['<Leader>dh'] = {
      function()
        require('dap.ui.widgets').hover()
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
      end,
      "dap frames",
    },
    ['<Leader>ds'] = {
      function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
      end,
      "dap scopes",
    },
  },
}

M.dapui = {
  n = {
    ["<leader>dui"] = {function() require("dapui").toggle() end, "dapui toggle"},
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

