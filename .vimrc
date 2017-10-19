" My Vimrc
" the most of these is not my original code
" 

autocmd! bufwritepost .vimrc source %

" set pastetoggle=<F2>
" set clipboard=unnamed

set mouse=a
" set bs=2

" map <f3> :NERDTreeToggle<CR>

let mapleader=","

" Work with Tabs
map <Leader>n :tabprevious<CR>
map <Leader>m :tabnext<CR>

noremap <Leader>T :tabnew<CR>
noremap <Leader>e :wq<CR>
noremap <Leader>E :wqa<CR>
noremap <Leader>q :q!<CR>
noremap <Leader>Q :qa!<CR>

" Copy-paste the line below
map <c-d> yyp

" Remove highlighting the search
noremap <Leader># :nohlsearch<CR>

" Map <> keys for moving text block (after visual them)
vnoremap < <gv
vnoremap > >gv

" Theme
set t_Co=256
color wombat256mod
" color monokai

if &term =~ '256color'
    set t_ut = 
endif


" Stuff
syntax on
filetype off
filetype plugin indent on

" Highlight 81-st column
set number
set tw=80
set nowrap
set fo-=t
set colorcolumn=81
highlight ColorColumn ctermbg=233


" vmap Q gq
" nmap Q gqap

set history=700
set undolevels=700

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

set hlsearch
set incsearch
set ignorecase
set smartcase

" ------ Plugins ------- "

" execute pathogen#infect()
" execute pathogen#helptags()


" set laststatus=2

" let g:ctrlp_max_height=15
" set wildignore+=*.pyc
" set wildignore+=*_build/*
" set wildignore+=*/coverage/*

" map <Leader>g :call RopeGotoDefinition()<CR>
" let g:pymode_rope_goto_definition_bind="<C-g>"
" let ropevim_enable_shortcuts=1
" let g:pymode_rope_goto_def_newwin="vnew"
" let g:pymode_rope_extended_complete=1
" let g:pymode_breakpoint=0
" let g:pymode_syntax=1
" let g:pymode_syntax_builtin_objs=0
" let g:pymode_syntax_builtin_funcs=0
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" set completeopt=longest,menuone
" function! OmniPopup(action)
    " if pumvisible()
        " if a:action == 'j'
            " return "\<C-N>"
        " elseif a:action == 'k'
            " return "\<C-P>"
        " endif
    " endif
    " return a:action
" endfunction

" inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
" inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" save from insert mode
" inoremap <F5> <C-o>:w<CR>

" set nofoldenable

" ---------------------- "


augroup HelpInTabs
    autocmd!
    autocmd BufEnter *.txt call HelpInNewTab()
augroup END

function! HelpInNewTab()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction



" map <f9> :w\|!clear && /home/vlfedotov/progs/anaconda/bin/python %
