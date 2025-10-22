" Enable diagnostics highlighting
let lspOpts = #{autoHighlightDiags: v:true}
autocmd User LspSetup call LspOptionsSet(lspOpts)

let s:pyright_cmd = exepath('pyright-langserver')
if empty(s:pyright_cmd)
  let s:pyright_cmd = expand('~/.npm-global/bin/pyright-langserver')
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

" Key mappings
nnoremap gd :LspGotoDefinition<CR>
nnoremap gr :LspShowReferences<CR>
nnoremap K  :LspHover<CR>
nnoremap gl :LspDiag current<CR>
nnoremap <leader>nd :LspDiag next \| LspDiag current<CR>
nnoremap <leader>pd :LspDiag prev \| LspDiag current<CR>
inoremap <silent> <C-Space> <C-x><C-o>

" Set omnifunc for completion
autocmd FileType php setlocal omnifunc=lsp#complete

" Custom diagnostic sign characters
autocmd User LspSetup call LspOptionsSet(#{
    \   diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \ })
