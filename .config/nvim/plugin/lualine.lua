local icons = require("nvim-nonicons")
local theme = require("github-theme.plugins.lualine")
local util = require("github-theme.util")
local p = require("github-theme.palette").get_palette("dark")

local get_group_color = function(color)
  local group = {
    a = { bg = p.bg, fg = util.darken(color, 0.4, p.bg) },
    b = { bg = p.bg, fg = p.syntax.comment },
    c = { bg = p.bg, fg = p.syntax.comment },
    y = { bg = p.bg, fg = p.syntax.comment },
    z = { bg = p.bg, fg = p.syntax.comment },
  }
  return group
end
theme = {
  normal = get_group_color(p.green),
  insert = get_group_color(p.bright_blue),
  command = get_group_color(p.bright_red),
  visual = get_group_color(p.bright_magenta),
  replace = get_group_color(p.bright_red),
  terminal = get_group_color(p.orange),
}

vim.cmd("hi StatusLine guibg=NONE")

local mode = {
  NORMAL = { icon = icons.get("vim-normal-mode") },
  INSERT = { icon = icons.get("vim-insert-mode") },
  VISUAL = { icon = icons.get("vim-visual-mode") },
  REPLACE = { icon = icons.get("vim-replace-mode") },
  COMMAND = { icon = icons.get("vim-command-mode") },
  ["V-LINE"] = { icon = icons.get("vim-visual-mode") },
}

require("lualine").setup({
  options = {
    -- theme = custom_dark,
    theme = theme,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree" },
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
        end,
      },
    },
    lualine_b = {
      {
        "filename",
        path = 1,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {
      {
        "branch",
        icon = icons.get("git-branch"),
      },
    },
    lualine_z = {
      {
        "filetype",
        colored = false,
      },
    },
  },
})
