set laststatus=2
set showtabline=2       " 总是显示 tabline（否则顶栏可能不出现）

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#shorten_path = 1

let g:lightline = {
      \ 'colorscheme' : 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename'
      \ }
      \ }

function! LightlineFilename()
  return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

nmap <Tab>   <Plug>lightline#bufferline#go_next()
nmap <S-Tab> <Plug>lightline#bufferline#go_previous()
