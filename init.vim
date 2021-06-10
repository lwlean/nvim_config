" 设置显示行
set number
" 设置显示命令
set showcmd
" 设置编码模式
set encoding=utf-8
" 设置保持缩进
" set autoindent
set ts=2
set sw=2
" 设置tab空格数
" set tabstop=2
" 设置不保存buffer
set hidden
" 语法是否高亮
syntax on
syntax enable
set t_Co=256
" 历史保留行数
set history=400
colorscheme snazzy 
" 自动重新读入
set autoread
" 设置自动忽略大小写
set ignorecase
set incsearch
set nohlsearch
set title
set laststatus=2
set scrolloff=5
" set report = 0
set confirm
" 设置标尺
" set ruler
set cursorline
set cursorcolumn
set matchpairs+=<:> 
highlight Pmenu ctermbg=251 guibg=white guifg=black 
" Pmenu          xxx ctermfg=0 ctermbg=13 gui=bold guifg=black guibg=white
let mapleader=" "

nnoremap vv :badd $MYVIMRC<cr> :bn<cr>
nnoremap <leader>n :bn<cr>
nnoremap <leader>p :bp<cr>
nnoremap <leader>s ^
nnoremap <leader>e $
nnoremap <leader>d :bd<cr>
nnoremap tt :NERDTree<cr>
nnoremap z q
nnoremap q :q<cr>
nnoremap s :w<cr>
nnoremap N :set nu!<cr>
nnoremap L :set cursorline! cursorcolumn!<cr>
nnoremap <C-h> :History<cr>
nnoremap <C-p> :Files<cr>

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'connorholyday/vim-snazzy'
Plug 'plasticboy/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'luochen1990/rainbow'
Plug 'alvan/vim-closetag'
Plug 'yianwillis/vimcdoc'
Plug 'preservim/nerdcommenter'
Plug 'fatih/vim-go'
Plug 'nsf/gocode'
call plug#end()

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'
let g:vim_markdown_folding_disabled = 1

" 主题透明
let g:SnazzyTransparent = 1
" ===
" " === coc
" " ===
" " fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-marketplace', 'coc-python', 'coc-vimlsp', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-snippets', 'coc-vetur', 'coc-pairs']
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

nnoremap <C-j> :m .+1<cr>==
nnoremap <C-k> :m .-2<cr>==


imap <C-l> <Plug>(coc-snippets-expand)
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
" mytest
" inoremap ssig -- <cr>Steve Losh<cr>steve@steve.com<cr>

" 自定义函数
let g:is_win_flag = 0 
function Check_is_win()
let isWin = has('win32') || has('win64') || has('win95') || has('win16')
g:is_win_flag = isWin ? 1 : 0
endfunction

" buf

