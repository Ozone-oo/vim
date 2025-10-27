" Set leader key
let mapleader = ";"

" Open netrw with <leader>cd
nnoremap <leader>cd :Ex<CR>

" Move selected lines up/down (like Alt-Up/Down)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Join lines with cursor preserved
nnoremap J mzJ`z

" Scroll half-page and center cursor
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Center on next/previous search result
nnoremap n nzzzv
nnoremap N Nzzzv

" Paste without overwriting clipboard
xnoremap <leader>p "_dP
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Make <C-c> behave like <Esc> in insert mode
inoremap <C-c> <Esc>

" Navigate quickfix list using Ctrl-j/k
nnoremap <C-j> :lnext<CR>
nnoremap <C-k> :lprev<CR>
nnoremap <leader>cl :lclose<CR>

" Disable Ex mode (accidental Q)
nnoremap Q <nop>

" Location list navigation
" nnoremap <leader>k :lnext<CR>zz
" nnoremap <leader>j :lprev<CR>zz

" Doge doc generator
nnoremap <leader>dg :DogeGenerate<CR>

" Substitute word under cursor on line
nnoremap <leader>s :s/\<<C-r><C-w>\>//gI<Left><Left><Left>

" Make current file executable
nnoremap <leader>x :!chmod +x %<CR>

" Yank via OSCYank
nmap <leader>y <Plug>OSCYankOperator
vmap <leader>y <Plug>OSCYankVisual

" Reload vimrc (adjust path as needed)
nnoremap <leader>rl :source ~/.vim/vimrc<CR>

" Source current file
nnoremap <leader><leader> :so<CR>

" 不关闭文件推出
nmap <Leader>z <C-Z>
" 水平分隔
nmap <Leader>s :Sex<CR>
" 竖直分隔
nmap <Leader>v :Vex<CR>

" 定义快捷键 关闭当前分割窗口
nmap <Leader>q :q<CR>

" 定义快捷键
nmap <Leader>w :w<CR>

" 删除光标所在单词
nmap e daw

nmap <Leader>r :%s/a/b/gc
" 快速移动到行首，行尾
map <Leader>1 ^
map <Leader>2 $
" 设置快捷键gs遍历各分割窗口。快捷键速记法：goto the next spilt window
nnoremap <Leader>gg <C-W><C-W>
" 向左
nnoremap <leader>h <C-W><C-H>
" 向右
nnoremap <leader>l <C-W><C-L>
" 向上
nnoremap <Leader>k <C-W><C-K>
" 向下
nnoremap <Leader>j <C-W><C-J>

inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

nnoremap <leader>d :bd<CR>

" shortcut for markdown
" 创建时间快捷键for markdown
nmap tm :call SetTime() <CR>
func SetTime()
        call append(line("."), "\# ".strftime('%a %d %b %Y'))
endfunc

nmap tb :call SetTable() <CR>
func SetTable()
        call append(line("."), "\| | | ")
        call append(line(".")+1, "\|---|---|")
        call append(line(".")+2, "\| | |")
endfunc

nmap pc :call SetPic() <CR>
func SetPic()
        call append(line("."), "\<img src='' width=600 alt=''> </img></div>")
endfunc

nmap pi :call SetPic1() <CR>
func SetPic1()
        call append(line("."), "\![]()")
endfunc

nmap vi :call SetVideo() <CR>
func SetVideo()
        call append(line("."), "\<video src='1.mp4' controls='controls' width='640' height='320' autoplay='autoplay'> Your browser does not support the video tag.</video></div>")
endfunc

nmap cl :call SetCollor() <CR>
func SetCollor()
        call append(line("."), "<span  style='color: #f16707;'> </span>")
endfunc

" vim cc
nmap cc :call SetCC() <CR>
func SetCC()
    call append(line("."), "// vim: et tw=100 ts=4 sw=4 cc=120")
endfunc
