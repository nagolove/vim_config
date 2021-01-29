"fu! RunLove()
    "let path=expand('%:p:h')
    "execute "! love " . path
"endfu
"map <F9> :call RunLove()<CR>

"fu! RunLua()
    "let path=expand('%:p')
    "execute "! luajit " . path
"endfu
"map <C-F9> :call RunLua()<CR>

fu! SourceConfig()
    source ~/.config/nvim/init.vim
endfu

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

"Показать список заметок в домашнем каталоге. Используется если хочешь
"освежить знания или составить конспект по какой-то теме.
map <F7> :!find ~ -maxdepth 1 -name "*.md" -or -name "*.MD"<CR>

"https://vim.fandom.com/wiki/Search_for_visually_selected_text
"поиск визуально выделенного текста
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"https://vim.fandom.com/wiki/Search_for_current_word_in_multiple_files
nnoremap GR :grep '\b<cword>\b' %:p:h/*<CR>

" отключить своп файлы. Актуально для неовима, раздражает вопросами.
set noswapfile

" перемотка соседнего окна в вертикальном сплите
nmap <a-j> <c-w>w<c-e><c-w>w
nmap <a-k> <c-w>w<c-y><c-w>w

map <a-j> <c-w>w<c-e><c-w>w
map <a-k> <c-w>w<c-y><c-w>w

set nocompatible              " be iMproved, required
filetype off                  " required
"syntax off
set nohlsearch

"if has('win32') || has('win64')
"    set rtp+=~/vimfiles/bundle/vundle
"    call vundle#rc('~/vimfiles/bundle/vundle')
"else
"    set rtp+=~/.vim/bundle/Vundle
"endif
"set rtp+=~/.vim/bundle/Vundle.vim
" Specify a directory for plugins
"
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.config/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

Plug 'gmarik/Vundle.vim'

Plug 'nvim-treesitter/nvim-treesitter'

" Teal language support
Plug 'teal-language/vim-teal'

" Optional dependencies; will be loaded on-demand when editing Teal files
Plug 'dense-analysis/ale', { 'for': 'teal' }
Plug 'tpope/vim-endwise', { 'for': 'teal' }

Plug 'OmniSharp/omnisharp-vim'
Plug 'neoclide/coc.nvim'
Plug 'davidhalter/jedi-vim'

Plug 'inkarkat/vim-SyntaxRange'
Plug 'inkarkat/vim-ingo-library'

Plug 'Skrip42/sRegister.git'
map <M-F9> :call sRegister#toggle()<CR>
map <C-F9> :call sRegister#toggle()<CR>

if has('nvim')
    "Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePluginins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
"let g:deoplete#enable_at_startup = 1

"Plugin 'DoxygenToolkit.vim'
"Plugin 'L9'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'Shougo/neosnippet-snippets'
"Plugin 'Shougo/neosnippet.vim'
"Plugin 'SirVer/ultisnips'
"Plugin 'file:///home/gmarik/path/to/plugin'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'godlygeek/tabular'
"Plugin 'honza/vim-snippets'
"Plugin 'junegunn/fzf'
"Plugin 'junegunn/vim-peekaboo'
"Plugin 'kien/ctrlp.vim'
"Plugin 'koron/minimap-vim.git'
"Plugin 'mynewplugin'
"Plugin 'nagolove/nvim-example-lua-plugin'
"Plugin 'prabirshrestha/asyncomplete.vim'
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdtree'
"Plugin 'tpope/vim-fugitive'
"Plugin 'user/L9', {'name': 'newL9'}
"Plugin 'vim-signature'
"Plugin 'xolox/vim-lua-ftplugin'
"source '~/.vim/lovelaunch.vim'

"Plugin 'MattesGroeger/vim-bookmarks'
"Plugin 'a.vim'
"Plugin 'ack.vim'
"Plugin 'bufexplorer.zip'
"Plugin 'davisdude/vim-love-docs'
"Plugin 'luochen1990/rainbow'
"Plugin 'majutsushi/tagbar'
"Plugin 'morhetz/gruvbox'
"Plugin 'rafi/awesome-vim-colorschemes'
"Plugin 'scrooloose/nerdcommenter'
"Plugin 'severin-lemaignan/vim-minimap'
"Plugin 'tikhomirov/vim-glsl'
"Plugin 'tpope/vim-fugitive'
"Plugin 'tpope/vim-surround'
"Plugin 'tpope/vim-vinegar'
"Plugin 'vim-airline/vim-airline'
"Plugin 'xolox/vim-misc'
vnoremap <Leader>a y:Ack <C-r>=fnameescape(@")<CR><CR>

Plugin 'nvim-treesitter/nvim-treesitter'

" Teal language support
Plugin 'teal-language/vim-teal'

" Optional dependencies; will be loaded on-demand when editing Teal files
Plugin 'dense-analysis/ale', { 'for': 'teal' }
Plugin 'tpope/vim-endwise', { 'for': 'teal' }

Plugin 'nvim-lua/popup.nvim'
Plugin 'nvim-lua/plenary.nvim'
Plugin 'nvim-telescope/telescope.nvim'

" Using lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"lua require'telescope.builtin'.planets{}
"nnoremap <Leader>pp :lua require'telescope.builtin'.planets{}

Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'a.vim'
Plugin 'ack.vim'
"Plugin 'mileszs/ack.vim'
Plugin 'bufexplorer.zip'
Plugin 'davisdude/vim-love-docs'
Plugin 'luochen1990/rainbow'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'scrooloose/nerdcommenter'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'tikhomirov/vim-glsl'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-vinegar'
Plugin 'vim-airline/vim-airline'
Plugin 'xolox/vim-misc'
"Plugin 'neoclide/coc.nvim'

call vundle#end()            " required
call plug#end()

filetype plugin indent on    " required

let g:airline#extensions#keymap#enabled = 0
"let g:airline_section_a = 0
let g:airline_section_y = 0

"colorscheme molokai
colorscheme atom

"регистро-независимый поиск
"set ic                                  

"умный учет регистра
set smartcase                           

"разрыв строки
set nowrap                              

"размер таба
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

"syntax enable

"???
set showcmd

"высота коммандной строки
set cmdheight=1                         

"инкреметный поиск
set is                                  

"указатели конца строки
"set listchars+=precedes:<,extends:>     
set lcs+=eol:$,tab:>-,trail:.,nbsp:%,precedes:<,space:.
"set listchars=tab:>.,trail:_,extends:>,precedes:<

"авто сохранение при компиляции
set autowrite                           

"включаем в обработку .vimrc из локального каталога, где запущен редактор.
"удобно для подключения файлов тегов
set exrc                                

"настройка backspace
set backspace=indent,eol,start          

"отключаем бэкапы
"set nobackup                            

"отключаем vi привычки
set nocompatible                        

filetype plugin indent on

"nnoremap <up> gk
"nnoremap <down> gj
"nnoremap j gj
"nnoremap k gk

"let g:neocomplcache_enable_at_startup = 1
"}}}

"улучшаем прокрутку чтобы курсор возвращался на место при PageUp/PageDown
"nmap <PageUp> <C-U><C-U>
"imap <PageUp> <C-O><C-U><C-O><C-U>
"nmap <PageDown> <C-D><C-D>
"imap <PageDown> <C-O><C-D><C-O><C-D>

" Find definition of current symbol using Gtags
map <C-?> <esc>:Gtags -r <CR>
" Find references to current symbol using Gtags
"map <C-F> <esc>:Gtags <CR>

"привычный C-del, удаляет слово вперед
imap <C-Del> <ESC>ldwi

"{{{ Русификация
"для набора русских символов в лаинской раскладке
"if has('vim')
"endif
set keymap=russian-jcukenwin 

"а поиск оставляем по английски
set imsearch=0
set iminsert=0

"для корректного перехода по русским словам
set iskeyword=@,48-57,_,192-255         

"можно переключать раскладку в нормальном режиме а не только в режиме вставки
noremap <C-^> a<C-^><ESC>

"при русской раскладке в режиме вставки цвет курсора - красный
hi lCursor guifg=NONE guibg=Red

"{{{ Языковые установки
"настройка для Python
let python_highlight_all = 1

"{{{ Кодировка
"добавляем меню, управляемое табом для выбора кодировки
menu Encoding.cp866         :e ++enc=cp866<CR>
menu Encoding.windows-1251  :e ++enc=cp1251<CR>
menu Encoding.koi8-r        :e ++enc=koi8-r<CR>
menu Encoding.utf-8         :e ++enc=utf8<CR>
map <C-F1> :emenu Encoding.<TAB>
"}}}

"{{{ Складки
"добавляем меню, управляемое табом для выбора режима фолдинга
menu Fold.syntax         :set foldmethod=syntax<CR>
menu Fold.marker         :set foldmethod=marker<CR>
menu Fold.manual         :set foldmethod=manual<CR>
menu Fold.indent         :set foldmethod=indent<CR>
map <C-F3> :emenu Fold.<TAB>

set foldmethod=manual
set foldlevel=5
"}}}

"{{{ Плагины
"NERD tree
"nnoremap <silent> <M-F8> :NERDTreeToggle<CR>
"nnoremap <silent> <M-F9> :NERDTreeToggle<CR>
let NERDTreeWinSize=30
let NERDTreeIgnore=['.*\.o', '.*\.a', '.*\.so', 'tags']

"список буферов
map <C-\> :BufExplorer<CR>
let g:bufExplorerShowRelativePath=1  " Show relative paths.

"настройка DoxygenToolkit
let g:DoxygenToolkit_compactDoc = "yes"
let g:DoxygenToolkit_briefTag_pre = ""
let g:DoxygenToolkit_paramTag_pre = "@param  "
let g:DoxygenToolkit_returnTag =    "@return "

"включает автоматическую doxygen подсветку
let g:load_doxygen_syntax=1 
"}}}

"map <F9> :make<CR>

"Plugin 'w0rp/ale'
"map <F9> :!luacheck <RETURN>
"""""""""""""""""""""""""""""""""" syntastic """""""""""""""""""""

"Plugin 'vim-syntastic/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"""""""""""""""""""""""""""""""""" syntastic """""""""""""""""""""

"устанавливаем scons вместо make
"set makeprg=scons
"set makeprg=mingw32-make
au BufRead,BufNewFile *.proto set filetype=proto
au BufRead,BufNewFile *.json set filetype=javascript
au BufRead,BufNewFile SConstruct set filetype=python
au BufRead,BufNewFile SConscript set filetype=python

"создание тэгов в текущем каталоге
"map <C-F9> :!ctags -R --c++-kinds=+p --exclude=Session.vim --exclude=\*.html --fields=+iaS --extra=+q .<CR>
"}}}

"{{{ Разное
"сохранение файла
map <F2> :w<CR>
"сохранение всех файлов
map <C-F2> :wall<CR>

"перемещение по ошибкам
"map <C-S-Right> :clast<CR><ESC>
"map <C-S-Left> :cfirst<CR><ESC>
"map <C-S-Up> :cprevious<CR><ESC>
"map <C-S-Down> :cnext<CR><ESC>

map <C-S-k> :cprevious<CR><ESC>
map <C-S-j> :cnext<CR><ESC>
map <C-S-l> :clast<CR><ESC>
map <C-S-h> :cfirst<CR><ESC>

"переключение в меню табом
set wildcharm=<TAB>

"перезагрузка .vimrc при его сохранении
"autocmd bufwritepost $MYVIMRC source $MYVIMRC

"подсветка строчек длинне 80 символов
set colorcolumn=80

"добавляем Doxygen комментарий
autocmd Filetype c,cpp set comments^=:///

"}}}

"{{{ Markdown
augroup mkd
autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:>
augroup END
"}}}

au BufNewFile,BufRead *.i set filetype=swig 
au BufNewFile,BufRead *.swg set filetype=swig

noremap <F12> :set list!<CR>
noremap <F10> :set relativenumber!<CR>
nnoremap <silent> <F8> :Tagbar<CR>

if has('win32') 
    set encoding=utf-8
    setglobal fileencoding=utf-8 bomb
    set fileencodings=utf-8,cp1251,koi8-r,latin1
    set fileformats=dos,unix,mac

    "добавляем общий тег-файл
    "set tags+=$HOME/.vim/systags/tags
    "set tags+=/MinGW/include/tags
else
    "добавляем общий тег-файл
    set tags+=$HOME/tags
endif

set autoread
set foldopen-=block

"map <leader>b :FufBuffer<CR>
"map <leader>l :FufLine<CR>

"map <leader>r :w<CR>:!C:\Python27\python.exe % <CR>

"g:neocomplete#enable_at_startup = 1

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|o|a)$',
            \ }
let g:ctrlp_max_depth = 4

"Impontantable Killer feature
autocmd InsertLeave * if pumvisible() == 0|pclose|endif"
"↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ что делает эта строчка ?? ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

set noeb vb

let g:bookmark_manage_per_buffer = 1

" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"отключение "визуального звонка" - противного мигания при перемотке на первой
"или последней строке файла
set t_vb=


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"хак, позволяющий сохранять файлы через sudo запуская vim в пользовательском
"режиме. Источник: https://stackoverflow.com/questions/2600783/how-does-the-vim-write-with-sudo-trick-work
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null % 
