" " 1. 只匹配“看起来就是多变量赋值”的行：a, b, c = ...
" "    注意这里必须有 '='，所以函数调用不会命中
" syntax match pythonAssignLHS /^\s*\h\w*\%(,\s*\h\w*\)*\s*=/ contains=pythonAssignVar

" " 2. 在这行的左边部分里，把每个变量挑出来
" "    第一个变量
" syntax match pythonAssignVar /\h\w*/ contained
" "    逗号后面的变量
" syntax match pythonAssignVar /,\s*\zs\h\w*/ contained

" " 3. 上色
" hi! link pythonAssignVar Identifier
