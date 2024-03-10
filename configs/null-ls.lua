-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require('null-ls')

local opts = {
  sources = {
    -- null_ls.builtins.diagnostics.ruff,  -- not supported by none-ls
    null_ls.builtins.formatting.black,  -- also supports range_formatting in none-ls
    null_ls.builtins.diagnostics.textidote.with({
      cwd = function(params)
        return "/opt/textidote/"
      end,
    }),
  },
  -- on_attach = function(client, bufnr)
  --   if client.supports_method("textDocument/formatting") then
  --     vim.api.nvim_clear_autocmds({
  --       group = augroup,
  --       buffer = bufnr,
  --     })
  --     vim.api.nvim_create_autocmd("BufWritePre", {
  --       group = augroup,
  --       buffer = bufnr,
  --       callback = function ()
  --         vim.lsp.buf.format({ bufnr = bufnr })
  --       end,
  --     })
  --   end
  -- end,
}
return opts
