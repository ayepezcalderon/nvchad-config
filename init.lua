local opt = vim.opt

-------------------------------------- options ------------------------------------------
-- Numbers
opt.relativenumber = true

-------------------------------------- commands -----------------------------------------
--- toggles highlight for IndentBlanklineContextStart from given color to nothing
local function toggle_context_start()
  local new_config = {
    bg = "#363545",
  }
  local curr_config = vim.api.nvim_get_hl(0, {name = "IndentBlanklineContextStart"})
  if not vim.deep_equal(curr_config, vim.empty_dict()) then
    vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", {})
  else
    vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", new_config)
  end
end
vim.api.nvim_create_user_command('ToggleIndentBlanklineContextStart', toggle_context_start, {
  nargs = 0,
  desc = 'Toggle highlighting for IndentBlanklineContextStart',
})


------------------------------------ autocommands ---------------------------------------
-- Adds colorcolumn for python
vim.api.nvim_create_augroup('colorcolumns', { clear = true })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile", "BufEnter", "BufWinEnter"}, {
  pattern = {"*.py"},
  group = 'colorcolumns',
  callback = function() opt.colorcolumn = '88' end,
})

-- Adds and removes files to harpoon upon opening or closing them
-- Allows for integration with tabufline
-- vim.api.nvim_create_augroup('harpoon_personal', { clear = true })
-- vim.api.nvim_create_autocmd({"BufAdd"}, {
--   pattern = '*',
--   group = 'harpoon_personal',
--   -- callback = function() require("harpoon"):list():append(vim.cmd(":expand('#:p')")) end,
--   callback = function() require("harpoon"):list():append() end,
-- })
-- vim.api.nvim_create_autocmd({"BufDelete"}, {
--   -- pattern = '*',
--   buffer = function() vim.fn.bufnr('#') end,
--   group = 'harpoon_personal',
--   callback = function() require("harpoon"):list():remove() end,
-- })
--
