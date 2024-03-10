local opts = {
  ensure_installed = {
    -- defaults 
    "vim",
    "lua",

    -- web dev 
    "html",
    "css",
    "javascript",
    "typescript",

    -- high level 
    "python",
    "cpp",

    -- low level
    "c",

    -- shell
    "bash",

    -- build
    "cmake",
    "make",

    -- reporting
    "latex",

    -- documentation
    "vimdoc",

    -- database
    "sql",

    -- serialization
    "json",
    "yaml",
    "toml",

    -- regex
    "regex",
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {
      "latex",
    },
  },
}

return opts
