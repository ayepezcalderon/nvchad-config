local opt = vim.opt
local o = vim.o

-------------------------------------- options ------------------------------------------
-- Numbers
opt.relativenumber = true
o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.cmd('set nofixeol')

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
vim.api.nvim_create_augroup('Colorcolumns', { clear = true })
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile", "BufEnter", "BufWinEnter"}, {
  pattern = {"*.py"},
  group = 'Colorcolumns',
  callback = function() opt.colorcolumn = '88' end,
})
