" 連続入力設定
inoremap <expr> = smartchr#loop('=', ' = ', ' == ', ' === ')
inoremap <expr> <S-=> smartchr#loop('+', ' + ')
inoremap <expr> - smartchr#loop('-', '--', ' - ')
inoremap <expr> , smartchr#loop(',', ', ')
inoremap <expr> . smartchr#loop('.', '..', '...')
inoremap <expr> < smartchr#loop('<', ' < ')
inoremap <expr> > smartchr#loop('>', ' > ', '->')

