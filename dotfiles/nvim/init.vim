" FIRST THINGS FIRST
aug vimrc | au! | aug end
let mapleader = ' '
scripte utf-8

" PLUGINS
cal plug#begin('~/.local/share/nvim/plugins')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'SirVer/ultisnips', { 'for': ['python', 'sh', 'snippets', 'tex', 'vim'] }
Plug 'airblade/vim-gitgutter'
Plug 'arcticicestudio/nord-vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'cohama/lexima.vim'
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'deoplete-plugins/deoplete-jedi', { 'for': 'python' }
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'machakann/vim-sandwich'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'yunake/vimux'
cal plug#end()

" APPEARANCE
au vimrc bufenter,focusgained * cal system("tmux rename-window " . expand("%:t"))
au vimrc vimleave * cal system("tmux setw automatic-rename")
let g:nord_bold = 0
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_underline = 1
let g:nord_uniform_diff_background = 1
let g:nord_uniform_status_lines = 1
colorscheme nord
hi statusline ctermbg=none ctermfg=16
hi statuslinenc ctermbg=none ctermfg=16
hi vertsplit ctermbg=none ctermfg=16
se fillchars+=eob:\ ,vert:\▏,fold:-,stl:_,stlnc:_
se stl=\  ls=0 noru nosc nosmd scl=yes

" AUTOCOMMANDS
au vimrc bufenter * se formatoptions-=cro
au vimrc bufreadpost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g'\"zz" | en
au vimrc bufwritepost * GitGutter
au vimrc filetype gitcommit,tex setl spell
au vimrc bufenter,focusgained * checkt
au vimrc textchanged,insertleave * nested silent up
au vimrc vimresized * winc =

" CLIPBOARD
nnoremap <c-c> "+yy
vnoremap <c-c> "+y
inoremap <c-v> <esc>"+pa
nnoremap <c-v> "+p
nnoremap <c-x> "+dd
vnoremap <c-x> "+d

" COMPLETION
cal deoplete#custom#option({
    \ 'min_pattern_length': 1,
    \ 'max_list': 8,
    \ 'num_processes': -1,
    \ 'ignore_sources': { '_': ['around', 'member'] },
\ })
cal deoplete#custom#source('_', 'matchers', ['matcher_fuzzy', 'matcher_length'])
cal deoplete#custom#var('omni', 'input_patterns', { 'tex': g:vimtex#re#deoplete })
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#enable_typeinfo = 0
let g:deoplete#sources#jedi#ignore_private_members = 1
se completeopt=menuone,noinsert
se shortmess+=c

" FOLD
se foldexpr=getline(v:lnum)=~'^\\s*$'&&getline(v:lnum+1)=~'\\S'?'<1':1
se foldlevel=4
se foldmethod=expr

" JEDI
hi function ctermbg=none ctermfg=blue
hi jedifat ctermbg=none ctermfg=red
hi jedifunction ctermbg=none ctermfg=white
hi none ctermbg=none ctermfg=white
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 0
let g:jedi#show_call_signatures = 2
let g:jedi#smart_auto_mappings = 1
let g:jedi#goto_assignments_command = 'ga'
let g:jedi#goto_command = 'gd'
let g:jedi#rename_command = '<leader>rr'

" KILL
nnoremap <silent> <leader>c :bw<cr>
nnoremap <silent> <leader>d :VimuxCloseRunner<cr>:qa<cr>
nnoremap <silent> <leader>q :VimuxCloseRunner<cr>:cal system("tmux kill-pane")<cr>
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

" MISC-MAPPINGS
nnoremap <silent> <leader>f :cal system("tmux neww && tmux send ~/.config/nvim/vtf.sh Enter")<cr>
nnoremap <silent> <leader>i :cal system("format " . bufname("%"))<cr>:e<cr>
nnoremap <silent> gs vip:sort u<cr>
vnoremap <silent> gs :sort u<cr>
nnoremap <c-j> 4<c-e>
nnoremap <c-k> 4<c-y>
nnoremap <cr> o<esc>
nnoremap Q <nop>
nnoremap cp cip
nnoremap dp dap
nmap s <nop>
xmap s <nop>

" MISC-SETTINGS
let g:UltiSnipsSnippetDirectories = [ $HOME.'/.config/nvim/UltiSnips' ]
let g:lexima_enable_endwise_rules = 0
let g:tex_flavor = 'latex'
let g:tex_no_error = 1
se commentstring=//\ %s
se confirm noswapfile
se expandtab shiftwidth=4 tabstop=4
se mouse=a
se notimeout
se path+=** path-=/usr/include
se splitbelow splitright

" NAVIGATION
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <a-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <a-j> :TmuxNavigateDown<cr>
nnoremap <silent> <a-k> :TmuxNavigateUp<cr>
nnoremap <silent> <a-l> :TmuxNavigateRight<cr>
nnoremap <silent> <a-w> :bp<cr>
nnoremap <silent> <a-e> :bn<cr>

" SEARCH & REPLACE
fu! CenterSearch()
    let cmdtype = getcmdtype()
    if cmdtype ==# '/' || cmdtype ==# '?' | retu "\<enter>zz" | en
    retu "\<enter>"
endfu
cnoremap <silent> <expr> <enter> CenterSearch()
nnoremap <silent> <esc> :noh<cr>:echo<cr><esc>
nnoremap <leader>rs :%s///gI<left><left><left><left>
nnoremap <leader>rw :%s/\<<C-r><C-w>\>//gI<left><left><left>
nnoremap <silent> , *``
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
se ignorecase smartcase inccommand=nosplit

" VIMUX
let g:VimuxHeight = '35'
let g:VimuxUseNearest = 0
nnoremap <silent> <leader>k :cal VimuxRunCommand("clear; ks")<cr>:VimuxZoomRunner<cr>
nnoremap <silent> <leader>l :cal VimuxRunCommand("clear; lint " . bufname("%"))<cr>
nnoremap <silent> <leader>a :cal VimuxRunCommand("clear; execute " . bufname("%"))<cr>:VimuxZoomRunner<cr>
au vimrc filetype tex nnoremap <silent> <leader>a :VimtexCompile<cr>
nnoremap <silent> <leader>v :cal VimuxZoomRunner()<cr>
nnoremap <silent> <leader>x :VimuxCloseRunner<cr>

" VIMTEX
let g:vimtex_compiler_callback_hooks = ['FocusViewer']
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_fold_enabled = 1
let g:vimtex_mappings_enabled = 0
let g:vimtex_matchparen_enabled = 0
let g:vimtex_view_general_viewer = 'zathura'
let g:vimtex_compiler_latexmk = {
    \ 'backend' : 'nvim',
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 0,
    \ 'executable' : 'latexmk',
    \ 'options' : [
        \ '-verbose',
        \ '-file-line-error',
        \ '-synctex=0',
        \ '-interaction=nonstopmode'
    \ ],
\ }
fu! FocusViewer(status)
    if system('pidof zathura')
       exe 'silent !wmctrl -xa zathura'
    el
       exe 'VimtexView'
    en
    exe 'echo'
endfu

" WHITESPACE
hi whitespace ctermbg=red
au vimrc bufwinenter * mat Whitespace /\s\+$\| \+\ze\t/
au vimrc insertenter * mat Whitespace /\s\+\%#\@<!$\| \+\ze\t/
au vimrc insertleave * mat Whitespace /\s\+$\| \+\ze\t/
au vimrc bufwinleave * cal clearmatches()

" WRAP
nnoremap $ g$
nnoremap 0 g0
nnoremap j gj
nnoremap k gk
se breakindent linebreak
