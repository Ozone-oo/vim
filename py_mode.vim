" 总开关
let g:pymode = 1

" 语法高亮开关
let g:pymode_syntax = 1

" 高亮全部 python 语法元素（更丰富）
let g:pymode_syntax_all = 1

" 高亮缩进错误/空格错误（可选，但很实用）
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors  = g:pymode_syntax_all

" 常用增强高亮项（按需保留）
let g:pymode_syntax_string_formatting = 1
let g:pymode_syntax_string_templates  = 1
let g:pymode_syntax_doctests          = 1
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_highlight_async   = 1   " 异步高亮（更顺滑）
