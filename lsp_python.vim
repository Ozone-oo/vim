let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let s:pyright_cmd = exepath('pyright-langserver')
if empty(s:pyright_cmd)
  let s:pyright_cmd = expand(getcwd().'/torch/bin/basedpyright-langserver')
endif

let lspServers = [
\ {
\   'name': 'pyright',
\   'filetype': 'python',
\   'path': s:pyright_cmd,
\   'args': ['--stdio'],
\   'rootUriPatterns': ['pyproject.toml', 'setup.cfg', 'setup.py', 'requirements.txt', '.git/'],
\   'workspaceConfig': {
\     'python': {
\       'analysis': {
\         'autoSearchPaths': v:true,
\         'useLibraryCodeForTypes': v:true,
\         'typeCheckingMode': 'basic'
\       }
\     }
\   }
\ }
\]

autocmd User LspSetup call LspAddServer(lspServers)

""--- 注册 LSP 服务器：basedpyright（纯 Python，无 Node）---
"augroup LspPython
"  autocmd!
"  autocmd User lsp_setup call lsp#register_server({
"        \ 'name': 'basedpyright',
"        \ 'cmd': {-> [
"        \   expand(getcwd().'/torch/bin/basedpyright-langserver'), '--stdio'
"        \ ]},
"        \ 'allowlist': ['python'],
"        \ })
"augroup END

" --- 诊断与高亮 ---
let g:lsp_diagnostics_enabled = 1
let g:lsp_document_highlight_enabled = 1
" 悬停高亮/离开清除
autocmd CursorHold  * silent! call lsp#document_highlight()
autocmd CursorMoved * silent! call lsp#clear_document_highlights()

" --- 使用 LSP 补全（asyncomplete 会自动接管弹窗）---
autocmd FileType python setlocal omnifunc=lsp#complete
let g:asyncomplete_auto_popup = 1

" --- 把 CoC 的快捷键一一复刻 ---
" 诊断导航
" nmap <silent><nowait> [g <Plug>(lsp-previous-diagnostic)
" nmap <silent><nowait> ]g <Plug>(lsp-next-diagnostic)

" 跳转

" nnoremap gd :LspGotoDefinition<CR>
" nnoremap gr :LspShowReferences<CR>
" nnoremap K  :LspHover<CR>
" nnoremap gl :LspDiag current<CR>
" nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
" nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
" inoremap <silent> <C-Space> <C-x><C-o>

" nmap <silent><nowait> gd <Plug>(lsp-definition)
" nmap <silent><nowait> gy <Plug>(lsp-type-definition)
" nmap <silent><nowait> gi <Plug>(lsp-implementation)
" nmap <silent><nowait> gr <Plug>(lsp-references)
" nmap <silent> K  <Plug>(lsp-hover)

" " 诊断列表（类似 CocList diagnostics）
" nnoremap <silent><nowait> <space>a :lopen<CR>
" " 文档大纲 / 工作区符号（类似 CocList outline/symbols）
" nnoremap <silent><nowait> <space>o :LspDocumentSymbol<CR>
" nnoremap <silent><nowait> <space>s :LspWorkspaceSymbol<Space>

" " 弹窗选择键（等价于你原来的 pumvisible() 逻辑）
" set completeopt=menuone,noinsert,noselect
" set shortmess+=c
" inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
" inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" —— 键位：尽量复刻你原来的 CoC 体验 ——
" 跳转/引用/悬停
nnoremap <silent><nowait> gd :LspGotoDefinition<CR>
nnoremap <silent><nowait> gy :LspGotoTypeDef<CR>
nnoremap <silent><nowait> gi :LspGotoImpl<CR>
nnoremap <silent><nowait> gr :LspShowReferences<CR>
nnoremap <silent> K  :LspHover<CR>

" 诊断导航与列表
nnoremap <silent><nowait> [g :LspDiag prev<CR>
nnoremap <silent><nowait> ]g :LspDiag next<CR>
nnoremap <silent><nowait> <space>a :LspDiag show<CR>

" 文档大纲/工作区符号（对应 <space>o / <space>s）
nnoremap <silent><nowait> <space>o :LspOutline<CR>
nnoremap <silent><nowait> <space>s :LspSymbolSearch<Space>

" 补全弹窗的 <CR>/<Tab> 选择（与 CoC 类似）
set completeopt=menuone,noinsert,noselect
set shortmess+=c
" inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
autocmd FileType python inoremap <buffer> <expr> <CR> get(complete_info(), 'pum_visible')
      \ ? (get(complete_info(),'selected')!=-1 ? "\<C-y>" : "\<C-e>")
      \ : "\<CR>"
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" --- 状态栏显示 LSP 诊断（等价 coc#status 的简单版）---
function! LspStatus() abort
  if exists('*lsp#get_buffer_diagnostics_counts')
    let d = lsp#get_buffer_diagnostics_counts()
    return printf(' LSP E:%d W:%d H:%d I:%d ',
          \ get(d,'error',0), get(d,'warning',0), get(d,'hint',0), get(d,'information',0))
  endif
  return ''
endfunction
set statusline^=%{LspStatus()}

autocmd User LspSetup call LspOptionsSet(#{
    \   diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \   noNewlineInCompletion: v:true,
    \   autoComplete: v:true,
    \ })
