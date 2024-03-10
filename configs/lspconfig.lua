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
        forwardSearchAfter = false,
        onSave = false
      },
      chktex = {
        onEdit = false,
        onOpenAndSave = false
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
      forwardSearch = {
        args = {"-f", "%l", "%p", "\"code -g %f:%l\""},
        executable = "evince-synctex",
      },
      latexFormatter = "texlab",
      latexindent = {
        modifyLineBreaks = false
      }
    }
  }
})

