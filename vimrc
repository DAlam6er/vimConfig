set noshowmode
"Отступы и нумерация строк
"   Замена табов на пробелы
set expandtab 
"   Количество пробелов в начале строке
"   равное shiftwidth
set smarttab
"   Количество пробелов в табе 
set tabstop=4
"   Количество пробелов в табе при удалении
set softtabstop=4
set shiftwidth=4

"   Нумерация строк
set number

"   Добавить отступ
"   между левой части окна
set foldcolumn=1

"   Цветовая схема
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

"   Подсветка синтаксиса
syntax on

"   Кодировка utf-8 по умолчанию
set encoding=utf8

"   Перенос длинных строк
set wrap

"   RUS-ENG-- Ctrl+^ = rus-eng
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
:setlocal spell spelllang=ru_yo,en_us
:set spellfile=~/.vim/spell/en.utf-8.add
:set nospell

"   WORKDIR
set dir=~/.vim

"   Pathogen plugin manager
execute pathogen#infect()

"   Using specific airline theme
let g:airline_theme='papercolor'

"   Using Powerline fonts
let g:airline_powerline_fonts = 1

"   Set vim font to a Nerd Font
set guifont=Hack\ Nerd\ Font\ Mono\ 16

"   Using tmuxline stock preset
let g:tmuxline_preset = 'full'

"   Highlighting mistakes in VIM
let g:gruvbox_guisp_fallback = "bg"

" enable tabline
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_b = '%{strftime("%Y-%m-%d %H-%M")}'
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0
let g:airline#extensions#tabline#tab_min_count = 2
"let g:airline#extensions#tabline#buffer_min_count = 2

" set width 75 symbols
if exists('+colorcolumn')
    highlight ColorColumn ctermbg=235 guibg=#2c2d27
    highlight CursorLine ctermbg=235 guibg=#2c2d27
    highlight CursorColumn ctermbg=235 guibg=#2c2d27
    let &colorcolumn=join(range(76,999),",")
else
    autocmd BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
end

set wildmenu
set wildmode=longest,list,full
" y and d put stuff into system clipboard (so that other apps can see it) also, p works nicely.
set clipboard=unnamed
