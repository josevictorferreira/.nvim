if exists("b:current_syntax")
  finish
endif

syn match placeHolder '\${\d\+\(:.\{-}\)\=}' contains=snipCommand
syn match tabStop '\$\d\+'
syn match snipEscape '\\\\\|\\`'
syn match snipCommand '\%(\\\@<!\%(\\\\\)*\)\@<=`.\{-}\%(\\\@<!\%(\\\\\)*\)\@<=`'

hi link placeHolder   Special
hi link tabStop       Special
hi link snipEscape    SpecialChar
hi link snipCommand   String

let b:current_syntax = 'snippet'
