" plugins.vim - Dead simple plugin manager
" Just source this file in your vimrc
let s:plugin_dir = expand('~/.vim/plugged')

" Install a plugin if it doesn't exist
function! s:ensure(repo, ...) abort
  let name = split(a:repo, '/')[-1]
  let path = s:plugin_dir . '/' . name

  " branch 参数可选（第二个参数）
  let branch = get(a:000, 0, '')

  if !isdirectory(path)
    if !isdirectory(s:plugin_dir)
      call mkdir(s:plugin_dir, 'p')
    endif
    if branch != ''
      execute '!git clone --depth=1 --branch ' . branch . ' https://github.com/' . a:repo . ' ' . shellescape(path)
    else
      execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)
    endif
  endif

  execute 'set runtimepath+=' . fnameescape(path)
endfunction

" Your plugins
call s:ensure('junegunn/fzf')
call s:ensure('junegunn/fzf.vim')
call s:ensure('rakr/vim-one')
" call s:ensure('yegappan/lsp')
call s:ensure('ojroques/vim-oscyank')
call s:ensure('sheerun/vim-polyglot')
call s:ensure('tpope/vim-commentary')
call s:ensure('itchyny/lightline.vim')
call s:ensure('mengelbrecht/lightline-bufferline')
call s:ensure('jiangmiao/auto-pairs')
call s:ensure('preservim/nerdtree')
call s:ensure('neoclide/coc.nvim', 'release')
call s:ensure('liuchengxu/vista.vim')
" call s:ensure('vim-scripts/taglist.vim')

