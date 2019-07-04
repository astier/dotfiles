call plug#begin('~/.local/share/nvim/plugins')

Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/lexima.vim'
Plug 'junegunn/fzf.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'

call plug#end()

" LEADERS
let mapleader=' '
let maplocalleader=' '

"""""""""""
" PLUGINS "
"""""""""""

" MISC
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_node_provider = 1
let g:loaded_python_provider = 1
let g:loaded_ruby_provider = 1
let g:python3_host_prog = '/bin/python'

" FZF
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>t :Tags<cr>

""""""""""""""""""
" VANILLA-NEOVIM "
""""""""""""""""""

" MISC
au BufEnter * se fo-=cro
au FocusGained,BufEnter,VimResume * checkt
au VimResized * wincmd =
se autowriteall
se confirm
se fillchars+=fold:\ 
se iskeyword-=_
se mouse=a
se path-=/usr/include
se shortmess+=c
se splitbelow splitright
se tabstop=4 shiftwidth=4
nnoremap Q <nop>
nnoremap <cr> o<esc>
nnoremap <leader>s <c-z>

" COLORSCHEME
let g:enable_italic_font = 1
let g:hybrid_transparent_background = 1
colorscheme hybrid_material
hi cursorline guibg=#383c4a
se cursorline
se termguicolors

" COPY & PASTE
nnoremap <a-p> "+p
inoremap <a-p> <esc>"+pa
vnoremap <leader>y "+y

" KILL
nnoremap <silent> <leader>q :qa<cr>
nnoremap <silent> <leader>c :clo<cr>
nnoremap <silent> <leader>d :bd<cr>

" NAVIGATION
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <a-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <a-j> :TmuxNavigateDown<cr>
nnoremap <silent> <a-k> :TmuxNavigateUp<cr>
nnoremap <silent> <a-l> :TmuxNavigateRight<cr>
nnoremap <silent> <a-b> :TmuxNavigatePrevious<cr>
nnoremap <silent> <a-i> :bp<cr>
nnoremap <silent> <a-o> :bn<cr>
nnoremap <leader>w <c-w>

" PUM
se completeopt=menu,noinsert
inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<C-j>"

" SEARCH & REPLACE
nnoremap <silent> <esc> :noh<cr><esc>
nnoremap <leader>rw :%s/\<<C-r><C-w>\>//gI<left><left><left>
nnoremap <leader>rr :%s///gI<left><left><left><left>
nnoremap <silent> , *``
nnoremap n nzz
nnoremap N Nzz
se ignorecase
se inccommand=nosplit
se smartcase

" STATUSLINE
se laststatus=1
se noruler
se noshowcmd
se noshowmode

" WRAP
nnoremap $ g$
nnoremap 0 g0
nnoremap j gj
nnoremap k gk
se breakindent linebreak
