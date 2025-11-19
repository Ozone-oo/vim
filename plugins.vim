" plugins.vim - Dead simple plugin manager
" Just source this file in your vimrc
let s:plugin_dir = expand('~/.vim/plugged')

" Install a plugin if it doesn't exist
" function! s:ensure(repo, ...) abort
"   let name = split(a:repo, '/')[-1]
"   let path = s:plugin_dir . '/' . name

"   " branch 参数可选（第二个参数）
"   let branch = get(a:000, 0, '')

"   if !isdirectory(path)
"     if !isdirectory(s:plugin_dir)
"       call mkdir(s:plugin_dir, 'p')
"     endif
"     if branch != ''
"       execute '!git clone --depth=1 --branch ' . branch . ' https://github.com/' . a:repo . ' ' . shellescape(path)
"     else
"       execute '!git clone --depth=1 https://github.com/' . a:repo . ' ' . shellescape(path)
"     endif
"   endif

"   execute 'set runtimepath+=' . fnameescape(path)
" endfunction
function! s:ensure(repo, ...) abort
  let name      = split(a:repo, '/')[-1]
  let path      = s:plugin_dir . '/' . name

  " 可选参数：branch, recursive(0/1), depth(整数; 0/'' 表示不加 --depth)
  let branch    = get(a:000, 0, '')
  let recursive = get(a:000, 1, 0)
  let depth     = get(a:000, 2, 1)

  if !isdirectory(path)
    if !isdirectory(s:plugin_dir)
      call mkdir(s:plugin_dir, 'p')
    endif

    " 组装 clone 命令
    let cmd = 'git clone '
    if type(depth) == type(0) && depth > 0
      let cmd .= '--depth=' . depth . ' '
    endif
    if recursive
      " 老写法 --recursive；新写法可用 --recurse-submodules --shallow-submodules
      let cmd .= '--recurse-submodules '
      if type(depth) == type(0) && depth > 0
        let cmd .= '--shallow-submodules '
      endif
    endif
    if !empty(branch)
      let cmd .= '--branch ' . shellescape(branch) . ' '
    endif
    let cmd .= 'https://github.com/' . a:repo . ' ' . shellescape(path)

    execute '!' . cmd

    " 兜底：防止子模块没完全拉齐；若 depth>0 则对子模块也做浅化
    if recursive
      let subcmd = 'git submodule update --init --recursive'
      if type(depth) == type(0) && depth > 0
        let subcmd .= ' --depth ' . depth
      endif
      execute '!(cd ' . shellescape(path) . ' && ' . subcmd . ')'
    endif
  endif

  execute 'set runtimepath+=' . fnameescape(path)
endfunction

" Your plugins
call s:ensure('junegunn/fzf')
call s:ensure('junegunn/fzf.vim')
call s:ensure('sheerun/vim-polyglot')
" call s:ensure('rakr/vim-one')
" call s:ensure('morhetz/gruvbox')
call s:ensure('tinted-theming/tinted-vim')
" call s:ensure('yegappan/lsp')
call s:ensure('ojroques/vim-oscyank')
call s:ensure('tpope/vim-surround')
call s:ensure('tpope/vim-repeat')
call s:ensure('tpope/vim-commentary')
call s:ensure('tpope/vim-unimpaired')
call s:ensure('tpope/vim-obsession')
call s:ensure('itchyny/lightline.vim')
call s:ensure('mengelbrecht/lightline-bufferline')
call s:ensure('jiangmiao/auto-pairs')
call s:ensure('preservim/nerdtree')
call s:ensure('neoclide/coc.nvim', 'release')
call s:ensure('liuchengxu/vista.vim')
" call s:ensure('vim-scripts/taglist.vim')
call s:ensure('unblevable/quick-scope')
call s:ensure('MattesGroeger/vim-bookmarks')
call s:ensure('mg979/vim-visual-multi')
call s:ensure('wellle/targets.vim')
call s:ensure('junegunn/goyo.vim')
" call s:ensure('davidhalter/jedi-vim', '', 1, 0)
" call s:ensure('luk400/vim-jukit')

" call s:ensure('prabirshrestha/async.vim')
" call s:ensure('prabirshrestha/asyncomplete.vim')
" call s:ensure('prabirshrestha/vim-lsp')
" call s:ensure('prabirshrestha/asyncomplete-lsp.vim')
" call s:ensure('prabirshrestha/asyncomplete-file.vim')
