" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

nnoremap <silent> <Leader>n  :NERDTreeToggle <CR> 
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"

let NERDTreeShowLineNumbers=1 " 显示行号

" 设置忽略的文件
let NERDTreeIgnore=['\.vim$', '\~$', '\.o$', '\.d$', '\.a$', '\.out$', '\.tgz$']
