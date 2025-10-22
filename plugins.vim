" plugins.vim - Dead simple plugin manager
" Just source this file in your vimrc
let s:plugin_dir = expand('~/.vim/plugged')

" Install a plugin if it doesn't exist
function! s:ensure(repo)
  let name = split(a:repo, '/')[-1]
  let path = s:plugin_dir . '/' . name
  
  if !isdirectory(path)
    if !isdirectory(s:plugin_dir)
      call mkdir(s:plugin_dir, 'p')
    endif
    execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)
  endif
  
  execute 'set runtimepath+=' . fnameescape(path)
endfunction

" Your plugins
call s:ensure('junegunn/fzf')
call s:ensure('junegunn/fzf.vim')
call s:ensure('rakr/vim-one')
call s:ensure('ghifarit53/tokyonight-vim')
call s:ensure('yegappan/lsp')
call s:ensure('ojroques/vim-oscyank')
call s:ensure('sheerun/vim-polyglot')
call s:ensure('tpope/vim-commentary')
call s:ensure('itchyny/lightline.vim')
call s:ensure('jiangmiao/auto-pairs')
call s:ensure('prabirshrestha/vim-lsp')
" call s:ensure('mattn/vim-lsp-settings')
call s:ensure('prabirshrestha/asyncomplete.vim')
call s:ensure('prabirshrestha/asyncomplete-lsp.vim')
