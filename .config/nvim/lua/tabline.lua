local left_separator = "▎"

local getTabLabel = function(n)
  local current_win = vim.api.nvim_tabpage_get_win(n)
  local current_buf = vim.api.nvim_win_get_buf(current_win)
  local file_name = vim.api.nvim_buf_get_name(current_buf)

  file_name = vim.api.nvim_call_function("fnamemodify", {file_name, ":p:t"})
  if file_name == "" then
    return "no name"
  end
  return file_name
end

function tabLine()
  local tabline = ""
  local tab_list = vim.api.nvim_list_tabpages()
  local current_tab = vim.api.nvim_get_current_tabpage()

  for _, val in ipairs(tab_list) do
    local file_name = getTabLabel(val)

    if val == current_tab then
      tabline = tabline .. "%#Operator#  " .. left_separator
      tabline = tabline .. "%#Title# " .. file_name
    else
      tabline = tabline .. "%#NonText#   "
      tabline = tabline .. "%#NonText# " .. file_name
    end
  end
  return tabline
end

vim.opt.tabline = [[%!luaeval('tabLine()')]]
