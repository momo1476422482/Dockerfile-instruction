call plug#begin('~/.vim/plugged')

" Need to move the installed colors folder to  ~/.vim 
Plug 'flazz/vim-colorschemes'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/syntastic'
call plug#end()

map <Space> <Leader>

" Turn on the Wild menu
set wildmenu

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark

""""""""""""""""""""""""""""""
" Mouse
""""""""""""""""""""""""""""""
set mouse=a
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

""""""""""""""""""""""""""""""
" ALE 
""""""""""""""""""""""""""""""
let g:ale_fixers = {'python': ['isort', 'black', 'trim_whitespace', 'remove_trailing_lines']}
let g:clang_cpp_options = '-std=c++11 -stdlib=libc++'
let g:clang_check_syntax_auto = 1
let g:clang_format_auto = 1
let g:ale_linters = { 'c++': ['clang'],}
let g:ale_fix_on_save = 1
let g:ale_python_flake8_options = '--max-line-length=88'
let g:ale_python_pylint_options = '--disable=line-too-long,too-many-instance-attributes,too-many-locals,no-else-return,consider-using-generator,import-outside-toplevel,too-many-branches,too-many-public-methods'
nmap<silent> <C-j> <Plug>(ale_next_wrap)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => search related 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

""""""""""""""""""""""""""""""
" jedi 
""""""""""""""""""""""""""""""
let g:jedi#show_call_signatures = "2"
let g:jedi#popup_on_dot = 0
let g:jedi#use_splits_not_buffers = "left"
let g:jedi#completions_command = "<C-Space>"

""""""""""""""""""""""""""""""
" airline 
""""""""""""""""""""""""""""""
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', '%3v'])
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'
let g:airline_theme='distinguished'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.colnr = ':'
let g:airline_symbols.crypt = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.paste = ''
let g:airline_symbols.spell = ''
let g:airline_symbols.notexists = ''
let g:airline_symbols.whitespace = 'Ξ'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction
