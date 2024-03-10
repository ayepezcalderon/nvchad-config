local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.texlab.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "tex", "plaintex", "bib" },
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
        executable = "latexmk",
        forwardSearchAfter = true,
        onSave = false,
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = true
      },
      diagnosticsDelay = 50,
      formatterLineLength = 80,
      forwardSearch = {
        -- -- evince-synctex
        -- args = {"-f", "%l", "%p", "\"code -g %f:%l\""},
        -- executable = "evince-synctex",

        -- okular
        args = {"--unique", "file:%p#src:%l%f"},
        executable = "okular",

        -- -- zathura
        -- args = {"--synctex-forward", "%l:1:%f", "%p"},
        -- executable = "zathura",
      },
      latexFormatter = "texlab",
      latexindent = {
        modifyLineBreaks = false
      }
    }
  }
})

