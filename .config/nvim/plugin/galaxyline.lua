local icons = require("nvim-nonicons")
local condition = require("galaxyline.condition")
local colors = {
  gray = "#4b5263"
}

require("galaxyline").section.left[1] = {
  ViMode = {
    provider = function()
      local mode = {
        n = {color = "String", icon = icons.get("vim-normal-mode")},
        i = {color = "Function", icon = icons.get("vim-insert-mode")},
        v = {color = "Conditional", icon = icons.get("vim-visual-mode")},
        V = {color = "Conditional", icon = icons.get("vim-visual-mode")},
        c = {color = "Keyword", icon = icons.get("vim-command-mode")}
      }
      vim.api.nvim_command("hi link GalaxyViMode " .. mode[vim.fn.mode()].color)
      if mode[vim.fn.mode()].icon ~= nil then
        return "    " .. mode[vim.fn.mode()].icon
      end
    end,
    separator = "  ",
    condition = condition.hide_in_width
  }
}
require("galaxyline").section.left[2] = {
  FileName = {
    provider = function()
      local fname = require("galaxyline.provider_fileinfo").get_current_file_name("*", icons.get("lock"))

      if (require("galaxyline.condition").check_git_workspace()) then
        local git_dir = require("galaxyline.provider_vcs").get_git_dir(vim.fn.expand("%:p"))
        local current_dir = vim.fn.expand("%:p:h")
        if git_dir == current_dir .. "/.git" or git_dir == nil then
          return fname
        end
        local get_path_from_git_root = current_dir:sub(#git_dir - 3)
        return get_path_from_git_root .. "/" .. fname
      end
      return fname
    end,
    condition = condition.hide_in_width or condition.buffer_not_empty
  }
}
require("galaxyline").section.right[1] = {
  FileIcon = {
    provider = "FileIcon",
    condition = condition.hide_in_width or condition.buffer_not_empty,
    highlight = {colors.gray}
  }
}
require("galaxyline").section.right[2] = {
  FileTypeName = {
    provider = function()
      return vim.bo.filetype
    end,
    condition = condition.hide_in_width or condition.buffer_not_empty,
    highlight = {colors.gray}
  }
}
require("galaxyline").section.right[3] = {
  GitBranch = {
    provider = "GitBranch",
    icon = icons.get("git-branch") .. " ",
    separator = "  ",
    condition = require("galaxyline.condition").check_git_workspace and condition.hide_in_width,
    highlight = {colors.gray}
  }
}
