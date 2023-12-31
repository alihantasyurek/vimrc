let mapleader = " "
syntax on
set number
set ruler
set tabstop=4
set relativenumber
set nu rnu
let g:user42 = 'atasyure'
let g:mail42 = 'atasyure@student.42.fr'
set shortmess=a

set makeprg =gcc\ -Wall\ -Wextra\ -Werror\ %
nnoremap <leader>mk :cd %:h<CR>:compiler c<CR>:silent make<CR><C-l>:if !empty(getqflist()) \| copen \| endif<CR>
nnoremap <leader>co :copen<CR>
nnoremap <leader>cc :cclose<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>
nnoremap <leader>pv :Ex<CR>
nnoremap <leader>nm :silent Norminette<CR>

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'jacoborus/tender.vim'
Plug 'vim-syntastic/syntastic'
Plug 'alexandregv/norminette-vim'
call plug#end()

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme tender

" Set line number colors
highlight LineNr ctermfg=yellow guifg=yellow
highlight CursorLineNr ctermfg=yellow  guifg=yellow

" Enable norminette-vim (and gcc)
let g:syntastic_c_checkers = ['norminette', 'gcc']
let g:syntastic_aggregate_errors = 1

" Support headers (.h)
let g:c_syntax_for_h = 1
let g:syntastic_c_include_dirs = ['include', '../include', '../../include', 'libft', '../libft/include', '../../libft/include']

" Pass custom arguments to norminette (this one ignores 42header)
let g:syntastic_c_norminette_args = '-R CheckTopCommentHeader'

" Enable error list
let g:syntastic_always_populate_loc_list = 1

" Skip check when closing
let g:syntastic_check_on_wq = 0 
	 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0	 

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
xnoremap <leader>p "_dP

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
