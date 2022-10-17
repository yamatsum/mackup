if vim.g.vscode then
  return
end

local icons = require "nvim-nonicons"
local theme = require "github-theme.plugins.lualine"
local util = require "github-theme.util"
local nonicons_extention = require "nvim-nonicons.extentions.lualine"
local p = require("github-theme.palette").get_palette "dark"

-- vim.api.nvim_set_hl(0, "StatusLine", { fg = p.syntax.comment, bg = "#24292e" })

local get_group_color = function(color)
  local normal = { bg = "#24292e", fg = p.syntax.comment }
  local group = {
    a = { bg = "#24292e", fg = util.darken(color, 0.4, p.bg) },
    b = normal,
    c = normal,
    x = normal,
    y = normal,
    z = normal,
  }
  return group
end
theme = {
  alt_bg = get_group_color(p.green),
  normal = get_group_color(p.green),
  insert = get_group_color(p.bright_blue),
  command = get_group_color(p.bright_red),
  visual = get_group_color(p.bright_magenta),
  replace = get_group_color(p.bright_red),
  terminal = get_group_color(p.orange),
}

require("lualine").setup {
  options = { theme = theme },
  sections = {
    lualine_a = { nonicons_extention.mode },
    lualine_b = {
      {
        "filename",
        path = 1,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {
      {
        "branch",
        icon = icons.get "git-branch",
      },
    },
  },
}
