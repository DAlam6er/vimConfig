" Pathogen plugin manager
"execute pathogen#infect()

" Syntax recognition
syntax on

" Filetype detection
filetype plugin indent on

"   Кодировка utf-8 по умолчанию
set encoding=utf8

" vim-plug plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" -------------------------------------------------------------------------
"  Маппинг клавиш
" -------------------------------------------------------------------------
" Отключить клавиши перемещения по стрелкам
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Выход в нормальный режим вместо Esc
imap jj <Esc>

" Начать искать плагины в этой директории
call plug#begin('~/.vim/bundle')
    Plug 'rafi/awesome-vim-colorschemes'
    Plug 'edkolev/tmuxline.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'mattia72/vim-delphi'
    Plug 'ryanoasis/vim-devicons'
    Plug 'iamcco/markdown-preview.nvim'
    Plug 'preservim/vim-markdown'
    Plug 'tpope/vim-fugitive'
    Plug 'https://github.com/airblade/vim-gitgutter.git'
    Plug 'tpope/vim-surround'
call plug#end()

" Рабочая директория vim
set dir=~/.vim

" Убирает включение режима VISUAL по нажатию правой кнопки мыши
"set mouse=
set ttymouse=

" убирает -- INSERT --
set noshowmode

" Добавить выделение текущей строки
set cursorline

" Замена табов на пробелы. Влияет на отступы, добавляемые командами >> и <<
set expandtab 

" Нажатие TAB в начале строки до первого непробельного символа приведет к 
" добавлению отступа, ширина которого будет равна shiftwidth
" Нажатие на backspace удалит 1 отступ, а не только 1 символ, что очень
" полезно при включенной expandtab 
set smarttab

" Количество пробелов, которыми символ табуляции отображается в тексте.
" Оказывает влияние как на уже существующие табуляции, так и на новые. 
set tabstop=4

" Количество пробелов, которыми символ табуляции отображается при добавлении
" Например, при установленных tabstop равной 8 и softtabstop равной 4, 
" троекратное нажатие Tab приведет к добавлению отступа шириной 12 пробелов, 
" однако сформирован он будет из одного символа табуляции и 4 пробелов.
set softtabstop=4

" По умолчанию используется для регулирование ширины отступов в пробелах, 
" добавляемых командами >> и <<. Если значение опции не равно tabstop, 
" как и в случае с softtabstop, отступ может состоять 
" как из символов табуляций так и из пробелов. 
" При включении опции — smarttab, оказывает дополнительное влияние.
set shiftwidth=4

" Гибридная нумерация строк (относительная + абсолютная)
set number relativenumber

" Копирует отступы с текущей строки при добавлении новой
"set autoindent
" Делает то же, что и autoindent плюс автоматически выставляет отступы 
" в «нужных» местах. В частности, отступ ставится после строки, 
" которая заканчивается символом {, перед строкой, которая заканчивается символом }, 
" удаляется перед символом #, если он следует первым в строке и т.д. 
" (подробнее help 'smartindent').
set smartindent

" Включаем колонку сбоку, которая показывает плюсики для скрытия кусков текста
set foldcolumn=1

"   Цветовая схема
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" Отключение обратной совместимости с Vi
set nocompatible

" Включить перенос длинных строк
set wrap

"   RUS-ENG-- Ctrl+^ = rus-eng
set keymap=russian-jcukenwin

" Язык ввода при старте vim - английский
set iminsert=0

" Язык поиска при старте vim - русский
set imsearch=0

highlight lCursor guifg=NONE guibg=Cyan
:setlocal spell spelllang=ru_yo,en_us
:set spellfile=~/.vim/spell/en.utf-8.add
:set nospell

"... для изменения курсора в разных режимах используйте это:
" где 1 - это мигающий прямоугольник
"     2 - обычный прямоугольник
"     3 - мигающее подчёркивание
"     4 - просто подчёркивание
"     5 - мигающая вертикальная черта
"     6 - просто вертикальная черта
set ttimeoutlen=10 "Понижаем задержку ввода escape последовательностей
let &t_SI.="\e[5 q" "SI = режим вставки
let &t_SR.="\e[3 q" "SR = режим замены
let &t_EI.="\e[2 q" "EI = нормальный режим

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
set wildmode=longest:list,full
" y and d put stuff into system clipboard (so that other apps can see it) also, p works nicely.
set clipboard^=unnamed,unnamedplus

" Using tmuxline stock preset
let g:tmuxline_preset = 'full'

" Highlighting mistakes in VIM
let g:gruvbox_guisp_fallback = "bg"
" Включить поддержку unicode
let g:Powerline_symbols='unicode' "Поддержка unicode


" -------------------------------------------------------------------------
" vim-airline plugin settings
" -------------------------------------------------------------------------
"   Using specific airline theme
let g:airline_theme='papercolor'

" Включить поддержку Powerline шрифтов
let g:airline_powerline_fonts = 1

" vim-airline extensions need to be load
let g:airline_extensions = ['branch', 'tmuxline', 'hunks', 'tabline', 'keymap']

" Отображаемый текст в случае, если ветка не найдена
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"]

" Автоматически отображает все буферы, когда открыта только одна вкладка.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
" Как пути к файлам отображаются на каждой отдельной вкладке, 
" а также индикатор текущего буфера в правом верхнем углу.
"let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#tab_min_count = 2
"let g:airline#extensions#tabline#buffer_min_count = 2

" Не показывать текущий маппинг: 
" скроет его индикатор из строки статуса (аналог останется в строке команд)
let g:airline#extensions#keymap#enabled = 0

"let g:airline_section_a = airline#section#create(['mode',' ','branch'])
"let g:airline_section_b = '%{strftime("%Y-%m-%d %H-%M")}'
"let g:airline_section_b = airline#section#create_left(['ffenc','hunks','%f'])
"let g:airline_section_c = airline#section#create(['filetype'])
let g:airline_detect_spell=0
let g:airline_detect_spelllang=0
