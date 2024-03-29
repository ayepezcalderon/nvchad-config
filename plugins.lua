--- @type LazySpec
local plugins = {
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = function()
      return require("custom.configs.auto-session")
    end,
    config = function(_, opts)
      require("auto-session").setup(opts)
      require("core.utils").load_mappings("auto_session")
    end
  },
  {
    "zbirenbaum/copilot.lua",
    -- event = "InsertEnter",
    cmd = "Copilot",
    build = ":Copilot auth",
    opts = function ()
      return require("custom.configs.copilot")
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
      })
    end
  },
  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function (_, opts)
      require("custom.configs.leap")
    end,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup(
        -- api key as OPENAI_API_KEY (encrypted)environment variable, so api_key_cmd not used
      )
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = {'python', 'lua'},
    config = function (_, opts)
      require("trouble").setup(opts)
      require("core.utils").load_mappings("trouble")
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function ()
      return vim.tbl_deep_extend(
        "force",
        require("plugins.configs.telescope"),
        require("custom.configs.telescope")
      )
    end
  },
  {
    "tpope/vim-fugitive",
  },
  {
    "tpope/vim-repeat",
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = "tpope/vim-fugitive",
  },
  {
    "RRethy/vim-illuminate",
    lazy = false,
    opts = {
      delay = 100,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    -- keys = {
    --   { "]]", desc = "Next Reference" },
    --   { "[[", desc = "Prev Reference" },
    -- },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "rcarriga/nvim-dap-ui",
    -- dependencies = "mfussenegger/nvim-dap",
    config = function ()
      require("dapui").setup()
      require("core.utils").load_mappings("dapui")
      require("custom.configs.dapui").load_repl_controls(true, false)
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "rcarriga/cmp-dap",
    },
    config = function (_, opts)
      -- uncomment to use nvchad cached colors
      -- dofile(vim.g.base46_cache .. "dap")
      require("core.utils").load_mappings("dap")
      require("custom.configs.dap").color_hls()
    end,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function ()
      require("core.utils").load_mappings("telescope_dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function (_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings("dap_python")
      require("custom.configs.dap-python")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"python", "tex", "plaintex", "bib"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function ()
      return require("custom.configs.mason")
    end
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
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = function ()
      return vim.tbl_deep_extend(
        "force",
        require("plugins.configs.treesitter"),
        require("custom.configs.treesitter")
      )
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    opts = function()
      return require("custom.configs.treesitter-text-objects").opts
    end,
    config = function (_, opts)
      require("custom.configs.treesitter-text-objects").setup(_, opts)
    end
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = {"python", "lua"},
    opts = function()
      return require "custom.configs.neogen"
    end,
    config = function (_, opts)
      require("neogen").setup(opts)
      require("core.utils").load_mappings("neogen")
    end
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function ()
      return vim.tbl_deep_extend(
        "force",
        require("plugins.configs.cmp"),
        require("custom.configs.cmp.opts")
      )
    end,
    config = function (_, opts)
      -- this is the config in plugins init.lua
      -- check if this is still the case upon updating nvchad
      require("cmp").setup(opts)
      -- call custom extra setup commands
      require("custom.configs.cmp.setup")
    end
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      require("custom.configs.vimtex")
    end
  },
  {
    "gbprod/yanky.nvim",
    lazy = false,
    opts = function ()
      return require("custom.configs.yanky")
    end,
    config = function(_, opts)
      require("yanky").setup(opts)
      require("core.utils").load_mappings("yanky")
    end
  },
}

return plugins
