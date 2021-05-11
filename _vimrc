set number
set ai
set ruler

highlight Comment ctermfg=green

set encoding=utf-8
set noexpandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
syntax enable

" Disable the default Vim startup message.
set shortmess+=I


let g:airline_theme='ayu_dark'
let g:airline_powerline_fonts = 1


"set background=dark

set spell




if has('gui_running')
  set guifont=Hack_Nerd_Font_Mono:h10:cANSI:qDRAFT
endif


au GUIEnter * simalt ~x

set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=


" Key Mapping
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
nmap <C-a> ggVG
nmap <C-c> "+y
nmap <C-p> "+p

" Floaterm configuration
let g:floaterm_keymap_new    = '<F5>'
let g:floaterm_keymap_prev   = '<F6>'
let g:floaterm_keymap_next   = '<F11>'
let g:floaterm_keymap_toggle = '<F12>'


" Set floaterm window's background to black
hi Floaterm guibg=black
" Set floating window border line color to cyan, and background to orange
hi FloatermBorder guibg=green 


" c++ file running key mapping
nnoremap <F8> :!g++ -o  %:r.exe % -std=c++14 -O2 -Wall && %:r.exe<Enter>
nnoremap <F9> :!g++ -o  %:r.exe % -std=c++11 -O2 -Wall && %:r.exe<Enter>

" python file running key mapping
nnoremap <F10> :!python %<Enter>


" skeleton file
if has("autocmd")
  augroup templates
    autocmd BufNewFile *.cpp 0r C:\Users\Saurabh\.vim\templates\skeleton.cpp
    autocmd BufNewFile *.py 0r C:\Users\Saurabh\.vim\templates\skeleton.py
  augroup END
endif

" startify
"let g:startify_custom_header = 'startify#pad(startify#fortune#cowsay())'
let g:startify_custom_header = [
			\ '     _______.     ___      __    __  .______          ___      .______    __    __     ',
			\ '   /         |   /   \    |  |  |  | |   _  \        /   \     |   _  \  |  |  |  |    ',
			\ '   |    (----`  /  ^  \   |  |  |  | |  |_)  |      /  ^  \    |  |_)  | |  |__|  |    ',
			\ '    \   \      /  /_\  \  |  |  |  | |      /      /  /_\  \   |   _  <  |   __   |    ',
			\ '.----)   |    /  _____  \ |  `--`  | |  |\  \----./  _____  \  |  |_)  | |  |  |  |    ',
			\ '|_______/    /__/     \__\ \______/  | _| `._____/__/     \__\ |______/  |__|  |__|    ',
			\ '                                                                                       ',
            \ '            ____    ____  ___       _______       ___   ____    ____                ',
            \ '            \   \  /   / /   \     |       \     /   \  \   \  /   /                ',
            \ '             \   \/   / /  ^  \    |  .--.  |   /  ^  \  \   \/   /                 ',
            \ '              \_    _/ /  /_\  \   |  |  |  |  /  /_\  \  \      /                  ',
            \ '                |  |  /  _____  \  |  .--.  | /  _____  \  \    /                   ',
            \ '                |__| /__/     \__\ |_______/ /__/     \__\  \__/                    ',
            \ '                                                                                    ',
			\ ]



" Plugins
"Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/vim-color-forest-night'
Plug 'vim-airline/vim-airline'
Plug 'raimondi/delimitmate'
Plug 'lervag/vimtex'
Plug 'scrooloose/syntastic'
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'
Plug 'djoshea/vim-autoread'
Plug 'kien/ctrlp.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'srcery-colors/srcery-vim'
Plug 'mhinz/vim-startify'
Plug 'yggdroot/indentline'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/Wombat'
Plug 'jaredgorski/spacecamp'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()




" coc configuration

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


colorscheme gruvbox
let g:everforest_background = 'hard'
set t_Co=256


" Important!!
if has('termguicolors')
  set termguicolors
endif

" For dark version.
set background=dark

