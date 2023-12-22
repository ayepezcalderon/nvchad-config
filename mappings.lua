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
    ["fd"] = {
      function ()
        require("neogen").generate({ type = 'func' })
      end,
    "Function docstring",
    opts = neogen_opts,
    },

    ["cd"] = {
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
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>", "Debug breakpoint"}
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

