require('gitsigns').setup {
  signs = {
    add          = {hl = 'diffadded'   , text = '│'},
    change       = {hl = 'signifysignchange', text = '│'},
    delete       = {hl = 'diffremoved', text = '│'},
    topdelete    = {hl = 'diffremoved', text = '│'},
    changedelete = {hl = 'signifysignchange', text = '│'},
  },
}
