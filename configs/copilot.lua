local opts = {
  filetypes = {
    markdown = true,
    python = true,
    lua = true,
    javascript = true,
    typescript = true,
    c = true,
    cpp = true,
    rust = true,
    sh = true,
    ["*"] = false,
  },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<M-j>",
      accept_line = "<M-k>",
      accept_word = "<M-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
}

return opts
