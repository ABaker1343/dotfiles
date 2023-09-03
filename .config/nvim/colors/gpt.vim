" MyColorScheme.vim
" ------------------

" Define the base color
let s:base00 = '#4e79a7'

" Define the shades of red
let s:red01 = '#fbb4ae'
let s:red02 = '#f768a1'
let s:red03 = '#c51b8a'
let s:red04 = '#7a0177'
let s:red05 = '#4d004b'

" Define the colors for Neovim
hi Normal guibg=s:base00
hi Comment guifg=s:red01
hi Constant guifg=s:red02
hi Identifier guifg=s:red03
hi Statement guifg=s:red04
hi PreProc guifg=s:red05
