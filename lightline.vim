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

nmap <Leader>c1 <Plug>lightline#bufferline#delete(1)
nmap <Leader>c2 <Plug>lightline#bufferline#delete(2)
nmap <Leader>c3 <Plug>lightline#bufferline#delete(3)
nmap <Leader>c4 <Plug>lightline#bufferline#delete(4)
nmap <Leader>c5 <Plug>lightline#bufferline#delete(5)
nmap <Leader>c6 <Plug>lightline#bufferline#delete(6)
nmap <Leader>c7 <Plug>lightline#bufferline#delete(7)
nmap <Leader>c8 <Plug>lightline#bufferline#delete(8)
nmap <Leader>c9 <Plug>lightline#bufferline#delete(9)
nmap <Leader>c0 <Plug>lightline#bufferline#delete(10)

" 关闭当前 buffer，但保留窗口布局，不退出 Vim
function! s:DeleteBufferKeepWindow() abort
  let l:buf = bufnr('%')
  let l:listed = getbufinfo({'buflisted': 1})

  " 只有一个已列出的 buffer：先新建空缓冲，再删当前
  if len(l:listed) <= 1
    enew
    execute 'bdelete ' . l:buf
    return
  endif

  " 否则切到前一个，再删原来的；若没切走就试 bnext
  bprevious
  if bufnr('%') == l:buf
    bnext
  endif
  execute 'bdelete ' . l:buf
endfunction

nnoremap <silent> <leader>bd :call <SID>DeleteBufferKeepWindow()<CR>
