require("tabline_framework").setup({
  render = function(f)
    f.make_tabs(function(info)
      if info.current then
        f.add({ "▎ ", fg = "#fb8532" })
      else
        f.add({ "  " })
      end
      f.add(info.filename or "[no name]")
      f.add("  ")
    end)
  end,
  hl = { fg = "#666666", bg = "#24292e" },
  hl_sel = { fg = "#c9d1d9", bg = "#24292e" },
  hl_fill = { fg = "#282c34", bg = "#24292e" },
})
