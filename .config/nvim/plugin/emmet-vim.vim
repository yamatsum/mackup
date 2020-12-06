" autocmd FileType html imap <buffer><expr><tab>
"     \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
"     \ "\<tab>"
"
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
