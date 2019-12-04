cal plug#begin('~/.local/share/nvim/plugins')

" BASICS
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator', { 'on': ['TmuxNavigateDown', 'TmuxNavigateLeft', 'TmuxNavigateRight', 'TmuxNavigateUp'] }
Plug 'cohama/lexima.vim'
Plug 'junegunn/fzf.vim', { 'on': ['Buffers', 'Files', 'Tags'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" IDE
Plug 'SirVer/ultisnips', { 'for': ['gitcommit', 'python', 'snippets', 'tex'] }
Plug 'benmills/vimux', { 'for': 'python' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'w0rp/ale', { 'for': ['python', 'sh', 'tex', 'vim'] }
Plug 'zefei/vim-wintabs'
Plug 'zefei/vim-wintabs-powerline'

cal plug#end()

" LEADERS
let mapleader = ' '
let maplocalleader = ' '

" ALE
nnoremap <silent> <leader>i :%retab<cr>:silent! ALEFix<cr>
let g:ale_disable_lsp = 1
let g:ale_history_enabled = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_format = '[%linter%][%code%] %s'
let g:ale_sh_shfmt_options = '-ci -sr -p -s -i 4'
let g:ale_fixers = {
    \ '*': ['remove_trailing_lines', 'trim_whitespace'],
    \ 'python': ['isort', 'black'],
    \ 'sh': ['shfmt'],
 \}

" APPEARANCE
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_diff_background = 1
let g:nord_uniform_status_lines = 1
colorscheme nord
hi search guibg=#d08770
se fillchars+=eob:\ ,vert:\▏,fold:-
se signcolumn=yes termguicolors

" AUTOCOMMANDS
au bufenter * se formatoptions-=cro
au bufreadpost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"zz" | en
au bufwritepost * GitGutter
au filetype gitcommit,tex setl spell
au focusgained,vimresume * checkt
au textchanged,insertleave * nested silent up
au vimresized * wincmd =

" CLIPBOARD
nnoremap <RightMouse> "+p
vnoremap <RightMouse> "+y
nnoremap <c-c> "+yy
vnoremap <c-c> "+y
inoremap <c-v> <esc>"+pa
nnoremap <c-v> "+p
vnoremap <c-v> dk"+p
nnoremap <c-x> "+dd
vnoremap <c-x> "+d

" COC
let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-vimtex']
au cursorhold * silent cal CocActionAsync('highlight')
inoremap <silent> <expr> <c-space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)zz
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nnoremap <silent> K :cal <SID>show_documentation()<cr>
fu! s:show_documentation()
    if index(['vim','help'], &filetype) >= 0
        exe 'h '.expand('<cword>')
    el | cal CocAction('doHover') | en
endfu
se completeopt=menuone,noinsert shortmess+=c

" FOLD
se foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
se foldlevel=4
se foldmethod=expr

" FZF
au filetype fzf se ls=0
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>f :Files<cr>
nnoremap <silent> <leader>t :Tags<cr>

" KILL
nnoremap <silent> <leader>c :clo<cr>
nnoremap <silent> <leader>d :bp\|bd #<cr>
nnoremap <silent> <leader>q :qa<cr>
nnoremap <silent> <leader>s <c-z>

" LOADED
let g:loaded_gzip = 1
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_node_provider = 1
let g:loaded_python_provider = 1
let g:loaded_ruby_provider = 1
let g:loaded_tar = 1
let g:loaded_tarPlugin = 1
let g:loaded_zip = 1
let g:loaded_zipPlugin = 1
let g:python3_host_prog = '/bin/python'

" MAPPINGS
nnoremap <cr> o<esc>
nnoremap <leader>z <c-w>s
nnoremap <leader>x <c-w>v
nnoremap <silent> gs vip:sort u<cr>
vnoremap <silent> gs :sort u<cr>
nnoremap Q <nop>

" NAVIGATION
let g:tmux_navigator_no_mappings = 1
nnoremap <c-j> 4<c-e>
nnoremap <c-k> 4<c-y>
nnoremap <silent> <a-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <a-j> :TmuxNavigateDown<cr>
nnoremap <silent> <a-k> :TmuxNavigateUp<cr>
nnoremap <silent> <a-l> :TmuxNavigateRight<cr>
nnoremap <silent> <a-e> :bp<cr>
nnoremap <silent> <a-r> :bn<cr>
nnoremap <silent> <leader><leader> :silent! b #<cr>

" NERDTREE
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeBookmarksFile = $HOME.'/.local/share/nvim/NERDTreeBookmarks'
let g:NERDTreeIgnore = ['.git', '__pycache__', 'tags', '^tex']
let g:NERDTreeMinimalMenu = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeMouseMode = 2
let g:NERDTreeQuitOnOpen = 2
let g:NERDTreeShowHidden = 1
let g:NERDTreeStatusline = ''
" let g:NERDTreeWinPos = 'right'
nnoremap <silent> <leader>e :NERDTreeToggle<cr>

" SETTINGS
let g:UltiSnipsSnippetDirectories = [ $HOME.'/.config/nvim/UltiSnips' ]
let g:lexima_enable_endwise_rules = 0
let g:rooter_resolve_links = 1
let g:rooter_silent_chdir = 1
se commentstring=//\ %s
se confirm noswapfile
se expandtab shiftwidth=4 tabstop=4
se mouse=a
se path+=** path-=/usr/include
se splitbelow splitright
sil! cal repeat#se('\<Plug>vim-surround', v:count)

" SEARCH & REPLACE
" au CursorHold * exe 'mat StatusLineTerm /'.expand('<cword>').'/'
fu! CenterSearch()
    let cmdtype = getcmdtype()
    if cmdtype == '/' || cmdtype == '?' | retu "\<enter>zz" | en
    retu "\<enter>"
endfu
cnoremap <silent> <expr> <enter> CenterSearch()
nnoremap <silent> <esc> :noh<cr>:echo<cr><esc>
nnoremap <leader>re :%s/\<<C-r><C-w>\>//gI<left><left><left>
nnoremap <leader>rw :%s///gI<left><left><left><left>
nnoremap <silent> , *``
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
se ignorecase smartcase inccommand=nosplit

" STATUS- & TABLINE
au vimenter * if len(getbufinfo({'buflisted':1})) < 2 | se stal=1 | else | exe 'WintabsAllBuffers' | en
au filetype fzf,nerdtree if len(getbufinfo({'buflisted':1})) < 2 | se stal=1 | en
au bufadd,winenter * if len(getbufinfo({'buflisted':1})) > 1 | exe 'WintabsAllBuffers' | se stal=2 | en
au bufdelete * if len(getbufinfo({'buflisted':1})) < 3 | se stal=1 | en
hi statusline guibg=#3b4252
hi statuslinenc guibg=#3b4252
hi wintabsactive guibg=#4c566a guifg=#d8dee9
let g:wintabs_ignored_filetypes = []
se statusline=\  ls=0 nosc nosmd noru

" VIMTEX
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_fold_enabled = 1
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : 'tex',
    \ 'callback' : 1,
    \ 'continuous' : 0,
    \ 'executable' : 'latexmk',
    \ 'options' : [
        \ '-verbose',
        \ '-file-line-error',
        \ '-synctex=0',
        \ '-interaction=nonstopmode'
    \ ],
\}
let g:vimtex_compiler_callback_hooks = ['FocusViewer']
fu! FocusViewer(status)
    if system('pidof zathura')
        exe 'silent !wmctrl -xa zathura'
    el
        exe 'VimtexView'
    en
endfu

" VIMUX
nnoremap <silent> <Leader>vr :call VimuxRunCommand("clear; python " . bufname("%"))<cr>
nnoremap <silent> <leader>vd :VimuxCloseRunner<cr>
nnoremap <silent> <leader>vi :VimuxInspectRunner<cr>
nnoremap <silent> <leader>vl :VimuxRunLastCommand<cr>
nnoremap <silent> <leader>vp :VimuxPromptCommand<cr>
nnoremap <silent> <leader>vx :VimuxInterruptRunner<cr>
nnoremap <silent> <leader>vz :cal VimuxZoomRunner()<cr>

" WHITESPACE
hi whitespace guibg=#bf616a
au bufwinenter * mat Whitespace /\s\+$\| \+\ze\t/
au insertenter * mat Whitespace /\s\+\%#\@<!$\| \+\ze\t/
au insertleave * mat Whitespace /\s\+$\| \+\ze\t/
au bufwinleave * cal clearmatches()

" WRAP
nnoremap $ g$
nnoremap 0 g0
nnoremap j gj
nnoremap k gk
se breakindent linebreak
