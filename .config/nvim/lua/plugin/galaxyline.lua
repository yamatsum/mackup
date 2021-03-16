local icons = require("nvim-nonicons")
local colors = {
  bg = "#282C34",
  fg = "#ABB2BF",
  fg2 = "#4b5263"
}

local not_nvimtree = function()
  if vim.bo.filetype == "NvimTree" then
    return false
  end
  return true
end
local buffer_not_empty = function()
  if vim.bo.filetype == "NvimTree" then
    return false
  end
  if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
    return true
  end
  return false
end
local function file_readonly()
  if vim.bo.filetype == "help" then
    return ""
  end
  if vim.bo.readonly == true then
    return " " .. icons.get("lock")
  end
  return ""
end
local function get_current_file_name()
  local file = vim.fn.expand("%:t")
  if string.len(file_readonly()) ~= 0 then
    return file .. file_readonly()
  end
  if vim.bo.modifiable then
    if vim.bo.modified then
      return file .. " * "
    end
  end
  return file .. " "
end
require("galaxyline").section.left[1] = {
  ViMode = {
    provider = function()
      if vim.fn.mode() == "n" then
        vim.api.nvim_command("hi link GalaxyViMode String")
      elseif vim.fn.mode() == "i" then
        vim.api.nvim_command("hi link GalaxyViMode Function")
      elseif vim.fn.mode() == "v" then
        vim.api.nvim_command("hi link GalaxyViMode Conditional")
      elseif vim.fn.mode() == "V" then
        vim.api.nvim_command("hi link GalaxyViMode Conditional")
      elseif vim.fn.mode() == "c" then
        vim.api.nvim_command("hi link GalaxyViMode Keyword")
      end
      local alias = {
        n = icons.get("vim-command-mode"),
        i = icons.get("vim-insert-mode"),
        c = icons.get("vim-command-mode"),
        v = icons.get("vim-visual-mode"),
        V = icons.get("vim-visual-mode"),
        [""] = icons.get("vim-normal-mode"),
        [" "] = "a",
        no = "n",
        s = "s",
        S = "S",
        ic = "i",
        R = "R",
        Rv = "R",
        cv = "c",
        ce = "c",
        r = "r",
        rm = "r",
        ["r?"] = "r",
        ["!"] = "!",
        t = "t"
      }
      if alias[vim.fn.mode()] ~= nil then
        return "    " .. alias[vim.fn.mode()]
      end
    end,
    separator = "  ",
    separator_highlight = {colors.bg, colors.bg},
    condition = not_nvimtree,
    highlight = {colors.magenta, colors.line_bg}
  }
}
require("galaxyline").section.left[2] = {
  FileName = {
    provider = function()
      if (require("galaxyline.condition").check_git_workspace()) then
        local git_dir = require("galaxyline.provider_vcs").get_git_dir(vim.fn.expand("%:p"))
        local current_dir = vim.fn.expand("%:p:h")
        if git_dir == current_dir .. "/.git" or git_dir == nil then
          return get_current_file_name()
        end
        local get_path_from_git_root = current_dir:sub(#git_dir - 3)
        return get_path_from_git_root .. "/" .. get_current_file_name()
      end
      return get_current_file_name()
    end,
    condition = buffer_not_empty,
    highlight = {colors.fg, colors.line_bg}
  }
}
require("galaxyline").section.right[1] = {
  FileIcon = {
    provider = "FileIcon",
    condition = buffer_not_empty,
    -- highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.line_bg}
    highlight = {colors.fg2, colors.line_bg}
  }
}
require("galaxyline").section.right[2] = {
  BufferType = {
    provider = function()
      return "  " .. vim.bo.filetype
    end,
    condition = buffer_not_empty,
    highlight = {colors.fg2, colors.line_bg}
  }
}
require("galaxyline").section.right[3] = {
  GitBranch = {
    provider = "GitBranch",
    icon = "    " .. icons.get("git-branch") .. " ",
    condition = require("galaxyline.condition").check_git_workspace and not_nvimtree,
    highlight = {colors.fg2, colors.line_bg}
  }
}
