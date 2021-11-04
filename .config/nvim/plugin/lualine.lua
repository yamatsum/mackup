local icons = require("nvim-nonicons")
local custom_onedark = require "lualine.themes.onedark"
local colors = {
  blue = "#61afef",
  green = "#98c379",
  purple = "#c678dd",
  red = "#e06c75",
  yellow = "#e5c07b",
  gray = "#5c6370",
  fg = "#abb2bf",
  bg = "#282c34"
}
custom_onedark.normal = {
  a = {fg = colors.green, bg = colors.bg},
  b = {fg = colors.fg, bg = colors.bg},
  c = {fg = colors.fg, bg = colors.bg},
  x = {fg = colors.gray, bg = colors.bg},
  y = {fg = colors.gray, bg = colors.bg},
  z = {fg = colors.gray, bg = colors.bg}
}
custom_onedark.insert.a = {fg = colors.blue, bg = colors.bg}
custom_onedark.visual.a = {fg = colors.purple, bg = colors.bg}
custom_onedark.replace.a = {fg = colors.red, bg = colors.bg}
custom_onedark.command = {a = {fg = colors.red, bg = colors.bg}}
custom_onedark.inactive.c.bg = colors.bg

vim.cmd("hi StatusLine guibg=NONE")

local mode = {
  NORMAL = {icon = icons.get("vim-normal-mode")},
  INSERT = {icon = icons.get("vim-insert-mode")},
  VISUAL = {icon = icons.get("vim-visual-mode")},
  REPLACE = {icon = icons.get("vim-replace-mode")},
  COMMAND = {icon = icons.get("vim-command-mode")},
  ["V-LINE"] = {icon = icons.get("vim-visual-mode")}
}

require("lualine").setup(
  {
    options = {
      theme = custom_onedark,
      section_separators = {left = "", right = ""},
      component_separators = {left = "", right = ""},
      disabled_filetypes = {"NvimTree"}
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            if mode[str] ~= nil then
              return "  " .. mode[str].icon
            end

            return str:sub(1, 1)
          end
        }
      },
      lualine_b = {
        "filename"
      },
      lualine_c = {},
      lualine_x = {},
      lualine_y = {
        {
          "branch",
          icon = icons.get("git-branch")
        }
      },
      lualine_z = {
        {
          "filetype",
          colored = false
        }
      }
    }
  }
)
