local diagnostic = require('galaxyline.provider_diagnostic')
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local extension = require('galaxyline.provider_extensions')
local buffer = require('galaxyline.provider_buffer')
local colors = {
  bg = '#282C34',
  fg = '#ABB2BF',
}
require('galaxyline').section.left[1]= {
  FirstElement = {
    provider = function() return '    ' end,
    highlight = {colors.blue,colors.line_bg}
  },
}
require('galaxyline').section.left[2]= {
  ViMode = {
    provider = function()
      if vim.fn.mode() == 'n' then vim.api.nvim_command('hi link GalaxyViMode String')
      elseif vim.fn.mode() == 'i' then vim.api.nvim_command('hi link GalaxyViMode Function')
      elseif vim.fn.mode() == 'v' then vim.api.nvim_command('hi link GalaxyViMode Conditional')
      elseif vim.fn.mode() == 'V' then vim.api.nvim_command('hi link GalaxyViMode Conditional')
      elseif vim.fn.mode() == 'c' then vim.api.nvim_command('hi link GalaxyViMode Keyword')
      end
      local alias = {n = 'ᆁ ',i = 'ᆀ ',c= 'ᅿ ',v= 'ᆅ ',V= 'ᆅ ', [''] = 'ᆅ '}
      return alias[vim.fn.mode()] .. ' '
    end,
    separator = ' ',
    separator_highlight = {colors.bg,colors.bg},
    highlight = {colors.magenta,colors.line_bg},
  },
}
require('galaxyline').section.left[3]= {
  FileName = {
    provider = function()
      local file = vim.fn.expand('%:t')
      if vim.fn.empty(file) == 1 then return '' end

      if (require('galaxyline.provider_vcs').check_git_workspace()) then
        git_dir = require('galaxyline.provider_vcs').get_git_dir(vim.fn.expand('%:p'))
        current_dir = vim.fn.expand('%:p:h')
        if git_dir == current_dir then
          return require('galaxyline.provider_fileinfo').get_current_file_name()
        end
        get_path_from_git_root = current_dir:sub(git_dir:len() + 2)
        return get_path_from_git_root .. '/' .. require('galaxyline.provider_fileinfo').get_current_file_name()
      end
      return require('galaxyline.provider_fileinfo').get_current_file_name()
    end,
    condition = buffer_not_empty,
    highlight = {colors.fg,colors.line_bg}
  }
}
require('galaxyline').section.right[1]= {
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.line_bg},
  },
}
require('galaxyline').section.right[3]= {
  BufferType = {
    provider = function()
      return '  ' .. vim.bo.filetype
    end,
    condition = buffer_not_empty,
  },
}
require('galaxyline').section.right[4]= {
  GitIcon = {
    provider = function() return '     ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
  }
}
require('galaxyline').section.right[5]= {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
  }
}
