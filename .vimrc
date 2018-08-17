

" noremap ; :
let mapleader="\<space>"

nmap <Leader>ev :e ~/.vimrc<CR>

" ------ Plugins ------- "

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'ryanoasis/vim-devicons'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-surround'
Plugin 'gko/vim-coloresque'
Plugin 'flazz/vim-colorschemes'


call vundle#end()
filetype plugin indent on


set list!
set listchars=tab:▸▸           " ┐
" set listchars+=space:.
set listchars+=trail:·         " │ Use custom symbols to
" set listchars+=eol:↴         " │ represent invisible characters
set listchars+=nbsp:_          " ┘

" highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red | match ExtraWhitespace /^\t*\zs \+/

" Autosaving on change
" autocmd TextChanged,TextChangedI <buffer> silent write
" GitGutter update highlights on update buffer
autocmd BufWritePost * GitGutter


"execute pathogen#infect()
"execute pathogen#helptags()

source ~/.vim/configs/windows.vim
source ~/.vim/configs/tabs.vim
source ~/.vim/configs/folding.vim
" autocmd! bufwritepost .vimrc source %


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set encoding=UTF-8
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

set guifont=Inconsolata\ Nerd\ Font


" A command-line fuzzy finder
" set rtp+=~/.fzf


set pastetoggle=<F2>
" set clipboard=unnamed

set mouse=a
set mousehide
" set bs=2

set ruler

set scrolloff=5

set wildmenu

map <F3> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>


" Copy-paste the line below
map <c-d> yyp
" Remove highlighting the search
" noremap <esc> :nohlsearch<CR>
" Map <> keys for moving text block (after visual them)
vnoremap < <gv
vnoremap > >gv

nnoremap j gj
nnoremap k gk

" Theme
"
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
      set t_Co=256
  endif
" set t_Co=256
if (has("termguicolors"))
  set termguicolors
endif
if &term =~ '256color'
    set t_ut = 
endif

color wombat256mod
" color monokai
" colorscheme OceanicNext
" set background=dark
" colorscheme solarized
" let g:solarized_termcolors=256

" Stuff
syntax on
set number relativenumber

" Highlight 81-st column
set textwidth=80
set nowrap
set fo-=t
set colorcolumn=+1
highlight ColorColumn ctermbg=50
" asdjfhalksdjhfalksdjhalksdjflaksdjhalksdjhaksdfhlaksdjhlkasjdhlaksjdhkasjdhkajsdhajshdf.,ajsd.,asdf
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)


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




set laststatus=2
set cursorline

" let g:ctrlp_max_height=15
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

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
