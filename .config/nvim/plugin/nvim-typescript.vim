let g:nvim_typescript#default_signs =
      \ get(g:, 'nvim_typescript#default_signs', [
      \  {
      \  'TSerror': {
      \   'texthl': 'SpellBad',
      \   'signText': '',
      \   'signTexthl': 'NeomakeErrorSign'
      \  }
      \},
      \{
      \  'TSwarning': {
      \   'texthl': 'SpellBad',
      \   'signText': '',
      \   'signTexthl': 'NeomakeWarningSign'
      \  }
      \},
      \{
      \  'TSinformation': {
      \   'texthl': 'SpellBad',
      \   'signText': '',
      \   'signTexthl': 'NeomakeInfoSign'
      \   }
      \},
      \{
      \  'TShint': {
      \   'texthl': 'SpellBad',
      \   'signText': '',
      \   'signTexthl': 'NeomakeInfoSign'
      \   }
      \}
      \])
" Use ale for lint
let g:nvim_typescript#diagnostics_enable = 0
