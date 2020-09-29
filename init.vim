syntax on
set showmatch
set number
set relativenumber
set wrap
set t_Co=256
set showcmd
set hlsearch
set incsearch
exec "nohlsearch"
set ignorecase
set wildmenu

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on


set encoding=utf-8
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif












let mapleader=" "


noremap <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

noremap H 5h
noremap J 5j
noremap K 5k
noremap L 5l


map ; :
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set splitbelow<CR>:split<CR>
map sk :set nosplitbelow<CR>:split<CR>

map <LEADER>k <C-w>j
map <LEADER>i <C-w>k
map <LEADER>j <C-w>h
map <LEADER>l <C-w>l

map  <UP> :res +5<CR>
map  <down> :res -5<CR>
map  <left> :vertical resize-5<CR>
map  <right> :vertical resiz+5<CR>

map  tt :tabe<CR>
map  qq :-tabnext<CR>
map  ee :+tabnext<CR>

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'

Plug 'connorholyday/vim-snazzy'

Plug 'preservim/nerdtree'

Plug 'dense-analysis/ale'

Plug 'vim-php/tagbar-phpctags.vim'

Plug 'majutsushi/tagbar'

Plug 'mbbill/undotree'

Plug 'Yggdroot/indentLine'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'roxma/LanguageServer-php-neovim',{'do': 'composer install && composer run-script parse-stubs'}

Plug 'vimeo/psalm'

Plug 'majutsushi/tagbar'

Plug 'mattn/emmet-vim'

Plug 'kien/ctrlp.vim'
call plug#end()

color


" ====
" ====NERDTree
" ====
map ff :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = ""
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = ""
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = ""
let NERDTreeMapChangeRoot = ""

" ====
" ====rainbow
" ====
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\   'ctermfgs': ['lightyellow', 'lightcyan','lightblue', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['darkorange3', 'seagreen3', 'royalblue3', 'firebrick'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}


" ====
" ====coc.vim
" ====
let g:coc_global_extensions = [
        \ 'coc-actions',
        \ 'coc-css',
        \ 'coc-diagnostic',
        \ 'coc-explorer',
        \ 'coc-flutter-tools',
        \ 'coc-gitignore',
        \ 'coc-html',
        \ 'coc-lists',
        \ 'coc-prettier',
        \ 'coc-pyright',
        \ 'coc-python',
        \ 'coc-snippets',
        \ 'coc-sourcekit',
        \ 'coc-stylelint',
        \ 'coc-syntax',
        \ 'coc-tasks',
        \ 'coc-todolist',
        \ 'coc-translator',
        \ 'coc-tslint-plugin',
        \ 'coc-tsserver',
        \ 'coc-vimlsp',
        \ 'coc-vimlsp',
        \ 'coc-yaml',
        \ 'coc-yank',
				\ 'coc-highlight',
				\ 'coc-snippets',
				\ 'coc-sh',
				\ 'coc-syntax',
				\ 'coc-git',
				\	'coc-sql',
				\ 'coc-eslint',
				\ 'coc-phpls']
inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
function! s:check_back_space() abort
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <c-o> coc#refresh()
function! Show_documentation()
        call CocActionAsync('highlight')
        if (index(['vim','help'], &filetype) >= 0)
                execute 'h '.expand('<cword>')
        else
                call CocAction('doHover')
        endif
endfunction
nnoremap <LEADER>h :call Show_documentation()<CR>
nnoremap <silent><nowait> <LEADER>d :CocList diagnostics<cr>
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev)
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next)
nnoremap <c-c> :CocCommand<CR>
" Text Objects
xmap kf <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap kf <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
xmap kc <Plug>(coc-classobj-i)
omap kc <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
" Useful commands
autocmd CursorMoved * silent! exe printf('match Underlined /\<%s\>/', expand('<cword>'))
autocmd CursorHold * silent! exe printf('match Underlined /\<%s\>/', expand('<cword>'))
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap tt :CocCommand explorer<CR>
" coc-translator
nmap ts <Plug>(coc-translator-p)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
" coctodolist
nnoremap <leader>tn :CocCommand todolist.create<CR>
nnoremap <leader>tl :CocList todolist<CR>
nnoremap <leader>tu :CocCommand todolist.download<CR>:CocCommand todolist.upload<CR>
" coc-tasks
noremap <silent> <leader>ts :CocList tasks<CR>
" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-e> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-e>'
let g:coc_snippet_prev = '<c-n>'
imap <C-e> <Plug>(coc-snippets-expand-jump)
let g:snips_author = 'David Chen'
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" ===
" ===indentLine
" ===
let g:indent_guides_guide_size            = 1   
let g:indent_guides_start_level           = 2



" ===
" ===tagbar
" ===
let g:tagbar_width=30
nnoremap <silent> <F4> :TagbarToggle<CR> 

" ===
" ===ctrlp
" ===
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = 'find %s -type f'

" ===
" ===embd
" ===
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key='<C-L>'
