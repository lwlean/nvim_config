" 设置显示行号
" set number
" 设置显示命令
set showcmd
" 设置编码模式
set encoding=utf-8
" 设置保持缩进
set autoindent
" 设置tab空格数
set tabstop=2
" 设置不保存buffer
set hidden
" 语法是否高亮
syntax on
syntax enable
set t_Co=256
" colorscheme snazzy 
" 历史保留行数
set history=400
" 自动重新读入
set autoread
" 设置自动忽略大小写
set ignorecase
set incsearch
set hlsearch
set title
set laststatus=2
set scrolloff=5
" set report = 0
set confirm
" 设置标尺
" set ruler
set matchpairs+=<:> 

let mapleader=" "

nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap tt :NERDTree<cr>
nnoremap q :q<cr>
nnoremap s :w<cr>
nnoremap N :set nu!<cr>


call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'liuchengxu/eleline.vim'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree'
Plug 'godlygeek/tabular'
Plug 'connorholyday/vim-snazzy'
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

" 主题透明
let g:SnazzyTransparent = 1
" ===
" " === coc
" " ===
" " fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore']
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
								let col = col('.') - 1
												return !col || getline('.')[col - 1]	=~ '\s'
								endfunction
								inoremap <silent><expr> <Tab>
																				\ pumvisible() ? "\<C-n>" :
																				\ <SID>check_back_space() ? "\<Tab>" :
																				\ coc#refresh()
								inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
								inoremap <silent><expr> <c-space> coc#refresh()
" Useful commands				
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <leader>rn <Plug>(coc-rename)

" mytest
" inoremap ssig -- <cr>Steve Losh<cr>steve@steve.com<cr>
