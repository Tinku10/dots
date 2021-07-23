
syntax on

set guicursor=
set encoding=UTF-8
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set hlsearch
set showtabline =1
set scrolloff=8
set noshowmode
set linespace=3
set completeopt=menuone,noinsert,noselect
" set showmatch
" Give more space for displaying messages.
set cmdheight=2
"
" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=5
filetype plugin on
set nocompatible
set nowrap
"
" " Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set rtp+=~/.vim/bundle/nerdtree
set pastetoggle=<F2>
" set clipboard=unnamed
" set clipboard=unnamedplus

call plug#begin('~/.vim/plugged')
" Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/Tabtastic'
" Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
Plug 'jiangmiao/auto-pairs'
" Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
" Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
" Plug 'nlknguyen/papercolor-theme'
" Plug 'sainnhe/gruvbox-material'
" Plug 'rakr/vim-one'
Plug 'jremmen/vim-ripgrep'
" Plug 'chrisbra/vim-autosave'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'Tinku10/dsa'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Valloric/YouCompleteMe'
" Plug 'pechorin/any-jump.vim'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
call plug#end()

function Template(tmpl_file)
    exe "0read " . a:tmpl_file
    let substDict = {}
    let substDict["name"] = "pasnger"
    let substDict["date"] = strftime("%Y %b %d %X")
    exe '%s/<<\([^>]*\)>>/\=substDict[submatch(1)]/g'
    set nomodified
    normal G
endfunction

autocmd BufNewFile *.c,*.cc,*.cpp,*.h call Template("~/.vim/tmpl.cpp")

" enable zsh commands from within vim
" autocmd vimenter * let &shell='/bin/zsh -i'

let g:gruvbox_contrast_dark = 'medium'
" let g:autosave_timer      = 5000
"
" kind of autosave
autocmd TextChanged,TextChangedI <buffer> silent write

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" add ripgrep as the search engine for CtrlP
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
endif

" let g:airline_powerline_fonts = 1
let g:gruvbox_invert_selection='1'
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

let g:vim_be_good_log_file = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
" let g:ycm_max_diagnostics_to_display = 30
" turn off syntax checker with ycm
" let g:ycm_show_diagnostics_ui = 1

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

colorscheme gruvbox
" colorscheme one
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

" uncomment to turn off matching parenthesis
" let loaded_matchparen = 1

" matching parenthesis colored on cursor position
hi MatchParen cterm=bold ctermbg=none ctermfg=131

" leader key mapped to <space>
let mapleader = " "

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8  }  }
let $FZF_DEFAULT_OPTS='--reverse'

let g:airline_theme='angr'

nnoremap <leader>f :CtrlP<CR>
nnoremap <leader>n :nohl<CR>
nnoremap <leader>gc :GBranches<CR>
nnoremap <leader>ga :Git fetch --all<CR>
nnoremap <leader>grum :Git rebase upstream/master<CR>
nnoremap <leader>grom :Git rebase origin/master<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>bs /<C-R>=escape(expand("<cWORD>"), "/")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <Leader>pf :Files<CR>
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>rp :resize 100<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
:nnoremap <F10> :buffers<CR>:buffer<Space>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
vnoremap <Leader>c "+y<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:DTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize =30
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

nnoremap <silent> <F3> :NERDTreeToggle<CR>

map <F8> :w <CR> :!clear ; g++ -Wall -Wextra -pedantic -std=c++17 -O2 -Wformat=2 -Wfloat-equal -Wconversion -Wcast-qual -Wunused-variable -Wcast-align -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -fsanitize=address -fsanitize=undefined -fno-sanitize-recover=all -fstack-protector %; if [ -f a.out  ]; then time ./a.out; rm a.out; fi <CR>
nnoremap <C-c> :w <CR> :!clear ; g++ -o  %:r % -std=c++17 -Wall -fsanitize=address -fsanitize=undefined -Wshift-overflow <CR>
" nnoremap <C-c> :w <CR> :!clear; makef %:r <CR>
nnoremap <C-x> :!./%:r <Enter>

:imap jj <Esc>
