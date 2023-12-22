local opts = {
  snippet_engine = "luasnip",

  languages = {
    python = {
      template = {
        annotation_convention = "numpydoc",
      },
    },
  },
}

return opts
