local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function ()
      local dapui = require("dapui")
      dapui.setup()
      -- Open and close UI when debug is initialiaze and terminated/exited
      -- local dap = require("dap")
      -- dap.listeners.after.event_initialized["dapui_config"] = function ()
      --   dapui.open()
      -- end
      -- dap.listeners.before.event_terminated["dapui_config"] = function ()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function ()
      --   dapui.close()
      -- end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = "rcarriga/nvim-dap-ui",
    config = function (_, opts)
      require("core.utils").load_mappings("dap")

      -- Open and close repl when debug is initialiaze and terminated/exited
      -- First enable dapui controls for repl
      require('dapui.controls').enable_controls(require('dapui').elements['repl'])
      local dap = require("dap")
      dap.listeners.after.event_initialized["dap_repl"] = function ()
        dap.repl.open()
      end
      dap.listeners.before.event_terminated["dap_repl"] = function ()
        dap.repl.close()
      end
      dap.listeners.before.event_exited["dap_repl"] = function ()
        dap.repl.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
      require("custom.configs.dap-python")
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "debugpy",
        "black",
        "yapf",
        "ruff",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require("custom.configs.treesitter")
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = {"python"},
    opts = function()
      return require "custom.configs.neogen"
    end,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
  },
}

return plugins
