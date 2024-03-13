---@type MappingsTable
local M = {}

local utils = require("custom.utils")

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

    ["<C-p>"] = { "<C-I>", "Jump to next (<C-i> remap)" },
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

M.trouble = {
  plugin = true,

  n = {
    ["<leader>tx"] = {
      function()
        require("trouble").toggle()
      end,
    "Toggle trouble",
    },
    ["<leader>tw"] = {
      function()
        require("trouble").toggle("workspace_diagnostics")
      end,
    "Toggle workspace diagnostics",
    },
    ["<leader>tg"] = {
      function()
        require("trouble").toggle("document_diagnostics")
      end,
    "Toggle document diagnostics",
    },
    ["<leader>tq"] = {
      function()
        require("trouble").toggle("quickfix")
      end,
    "Toggle quickfix",
    },
    ["<leader>tl"] = {
      function()
        require("trouble").toggle("loclist")
      end,
    "Toggle loclist",
    },
    ["<leader>tr"] = {
      function()
        require("trouble").toggle("lsp_references")
      end,
    "Toggle LSP references",
    },
  },
}

local neogen_opts = { noremap = true, silent = true }
M.neogen = {
  plugin = true,

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
    ["<leader>dB"] = {
      function()
        require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end,
      "Breakpoint Condition",
    },
    ['<Leader>lp'] = {
      function()
        require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
      end
    },
    ['<Leader>dr'] = {
      function()
        require('dapui').close()
        utils.custom_dap_repl_toggle(false)
      end,
      "dap repl toggle"
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
    ['<F4>'] = {function() require('dap').run_last() end, "dap run last"},
    ['<F5>'] = {function() require('dap').continue() end, "dap continue"},
    ['<F7>'] = {function() require('dap').step_over() end, "dap step over"},
    ['<F8>'] = {function() require('dap').step_into() end, "dap step into"},
    ['<F9>'] = {function() require('dap').step_out() end, "dap step out"},
    ['<F12>'] = {function() require('dap').terminate() end, "dap terminate"},

    -- for widgets
    ['<Leader>dh'] = {
      function()
        require('dap.ui.widgets').hover()
        utils.set_buf_easy_close_mappings()
      end,
      "dap hover",
    },
    ['<Leader>dp'] = {
      function()
        require('dap.ui.widgets').preview()
      end,
      "dap preview",
    },
    -- replaced in favor of telescope_dap
    -- ['<Leader>df'] = {
    --   function()
    --     local widgets = require('dap.ui.widgets')
    --     widgets.centered_float(widgets.frames)
    --     utils.set_buf_easy_close_mappings()
    --   end,
    --   "dap frames",
    -- },
    ['<Leader>ds'] = {
      function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
        utils.set_buf_easy_close_mappings()
      end,
      "dap scopes",
    },
  },
}

M.dapui = {
  plugin = true,

  n = {
    ["<leader>dui"] = {
      function()
        require('dap').repl.close()
        require("dapui").toggle()
        utils.delayed_dap_controls_refresh()
      end,
      "dapui toggle"
    },
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
    -- replaced in favor of telescope_dap
    -- ["<leader>dlb"] = {
    --   function()
    --     require("dapui").float_element('breakpoints')
    --   end,
    --   "dapui list breakpoints",
    -- },
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

M.telescope_dap = {
  plugin = true,
  n = {
    ["<leader>dlb"] = {
      function()
        require'telescope'.extensions.dap.list_breakpoints{}
      end,
      "List breakpoints",
    },
    ['<Leader>df'] = {
      function()
        require'telescope'.extensions.dap.frames{}
      end,
      "dap frames",
    },
  }
}

M.telescope = {
  n = {
    ["<leader>fy"] = { "<cmd> Telescope yank_history <CR>", "Yank history" },
  }
}

M.auto_session = {
  plugin = true,
  n = {
    ["<leader>fs"] = {
      function ()
        require("auto-session.session-lens").search_session()
      end,
      "Find session"
    }
  }
}

M.yanky = {
  plugin = true,
  n = {
    -- For yank ring
    ["p"] = {"<Plug>(YankyPutAfter)", "Put after"},
    ["P"] = {"<Plug>(YankyPutBefore)", "Put before"},
    ["gp"] = {"<Plug>(YankyGPutAfter)", "Put after and move"},
    ["gP"] = {"<Plug>(YankyGPutBefore)", "Put before and move"},
    ["<M-p>"] = {"<Plug>(YankyPreviousEntry)", "Previous yank"},
    ["<M-n>"] = {"<Plug>(YankyNextEntry)", "Next yank"},
    -- for vim-umpaired usage
    -- indent linewise
    ["]p"] = {"<Plug>(YankyPutIndentAfterLinewise)", "Put indent after linewise"},
    ["[p"] = {"<Plug>(YankyPutIndentBeforeLinewise)", "Put indent before linewise"},
    ["]P"] = {"<Plug>(YankyPutIndentAfterLinewise)", "Put indent after linewise"},
    ["[P"] = {"<Plug>(YankyPutIndentBeforeLinewise)", "Put indent before linewise"},
    -- indent shift
    [">p"] = {"<Plug>(YankyPutIndentAfterShiftRight)", "Put indent after shift right"},
    ["<p"] = {"<Plug>(YankyPutIndentAfterShiftLeft)", "Put indent after shift left"},
    [">P"] = {"<Plug>(YankyPutIndentBeforeShiftRight)", "Put indent before shift right"},
    ["<P"] = {"<Plug>(YankyPutIndentBeforeShiftLeft)", "Put indent before shift left"},
    -- filter put
    ["=p"] = {"<Plug>(YankyPutAfterFilter)", "Put indent before shift right"},
    ["=P"] = {"<Plug>(YankyPutBeforeFilter)", "Put indent before shift left"},
    -- for yanking
    ["y"] = {"<Plug>(YankyYank)", "Yank"},
    -- text object
    ["<M-y>"] = {
      function()
        require("yanky.textobj").last_put()
      end,
      "Last put text object",
    },
  },
  x = {
    -- For yank ring
    ["p"] = {"<Plug>(YankyPutAfter)", "Put after"},
    ["P"] = {"<Plug>(YankyPutBefore)", "Put before"},
    ["gp"] = {"<Plug>(YankyGPutAfter)", "Put after and move"},
    ["gP"] = {"<Plug>(YankyGPutBefore)", "Put before and move"},
    -- for yanking
    ["y"] = {"<Plug>(YankyYank)", "Yank"},
    -- text object
    ["lp"] = {
      function()
        require("yanky.textobj").last_put()
      end,
      "Last put text object",
    },
  },
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

