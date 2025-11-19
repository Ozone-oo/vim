"davidhalter/jedi-vim
"" —— Python3 provider（可选：指定你常用的 python3 路径）——
let g:python3_host_prog = '/data/ouzhilong/code/accelerate_hydra/torch/bin/python'
let g:jedi#environment_path = expand('/data/ouzhilong/code/accelerate_hydra/torch')
" —— 补全体验 ——
set completeopt=menuone,noinsert,noselect
set shortmess+=c

" —— jedi-vim 选项（常用、好用、基本不踩坑）——
" let g:jedi#auto_initialization = 1          " 打开文件自动启用
" let g:jedi#completions_enabled = 1          " 启用补全
" let g:jedi#popup_on_dot = 1                 " 输入点号后自动弹补全
" let g:jedi#use_splits_not_buffers = 'right' " 跳转用分屏（'left'/'right'/'top'/'bottom'）
" let g:jedi#show_call_signatures = 1         " 插入模式显示函数签名
" let g:jedi#force_py_version = 3             " 强制按 Python3 解析

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 1
let g:jedi#popup_on_dot = 1
let g:jedi#show_call_signatures = 1
let g:jedi#use_splits_not_buffers = 'right'

" —— 常用快捷键（自己喜欢怎么绑就怎么绑）——
nnoremap <silent> gd :JediGoto<CR>          " 跳定义
nnoremap <silent> gD :JediGotoSplit<CR>     " 分屏跳定义
nnoremap <silent> K  :JediShowDoc<CR>       " 查看文档
nnoremap <silent> <leader>r :JediRename<CR> " 重命名
nnoremap <silent> <leader>u :JediUsage<CR>  " 查引用
