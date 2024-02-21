local opts = {
  filetypes = {
    markdown = true,
    help = true,
    yaml = true,
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
