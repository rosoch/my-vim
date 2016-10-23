" don't make vim compatible with vi 
set nocompatible

" turn on syntax highlighting
syntax on
" and show line numbers
set number
set mouse=a
colo mango
colo jellybeans

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
    
    " Использовать больше цветов в терминале
    set t_Co=256
    " Включаем перенос строк
    set wrap
    " Перенос строк по словам, а не по буквам
    set linebreak
    " Включаем отображение выполняемой в данный момент команды в правом нижнем углу экрана.
    " К примеру, если вы наберете 2d, то в правом нижнем углу экрана Vim отобразит строку 2d.
    set showcmd
    " Показывать первую парную скобку после ввода второй
    set showmatch
    " Показывать строку вкладок всегда
    set showtabline=2
    " Показывать строку статуса всегда
    set laststatus=2
    " Показывать имя буфера в заголовке терминала
    set title
    " Формат заголовка
    set titlestring=%t%(\ %m%)%(\ %r%)%(\ %h%)%(\ %w%)%(\ (%{expand(\"%:p:~:h\")})%)\ -\


    function! CurTime()
       let ftime=''
       let ftime=ftime.' '.strftime('%H:%M:%S')
       return ftime
    endf
    
    function! HighlightSearch()
        if &hls
            return 'H'
        else
            return ''
        endif
    endfunction


    hi User1 guifg=#ffdad8  guibg=#880c0e
    hi User2 guifg=#000000  guibg=#F4905C
    hi User3 guifg=#292b00  guibg=#f4f597
    hi User4 guifg=#112605  guibg=#aefe7B
    hi User5 guifg=#051d00  guibg=#7dcc7d
    hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
    hi User8 guifg=#ffffff  guibg=#5b7fbb
    hi User9 guifg=#ffffff  guibg=#810085
    hi User0 guifg=#ffffff  guibg=#094afe
    

    set statusline=
    set statusline+=%7*\[%n]                                  "buffernr
    set statusline+=%1*\ %<%F\                                "File+path
    set statusline+=%2*\ %y\                                  "FileType
    set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
    set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
    set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
    set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
    set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
    set statusline+=%9*\ col:%03c\                            "Colnr
    set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
    set statusline+=%0*\ %{CurTime()}\                        "Time
       
    " Включить радужную подсветку скобок для CoffeeScript и JS
    autocmd BufWinEnter *.coffee,*.js,*.php,*.html RainbowParenthesesLoadBraces
    autocmd BufWinEnter *.coffee,*.js,*.php,*.html RainbowParenthesesLoadRound
    autocmd BufWinEnter *.coffee,*.js,*.php,*.html RainbowParenthesesLoadSquare
    autocmd BufWinEnter *.coffee,*.js,*.php,*.html RainbowParenthesesActivate
    
    autocmd VimEnter * RainbowParenthesesToggle
    autocmd Syntax * RainbowParenthesesLoadRound
    autocmd Syntax * RainbowParenthesesLoadSquare
    autocmd Syntax * RainbowParenthesesLoadBraces
    "autocmd Syntax * RainbowParenthesesLoadChevrons


    let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
    let g:rbpt_max = 16
    let g:rbpt_loadcmd_toggle = 0
    
    
    
    
    " Включаем отображение дополнительной информации в статусной строке
    "set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P %{CurTime()}




    " Включаем подсветку выражения, которое ищется в тексте
    set hlsearch
    " При поиске перескакивать на найденный текст в процессе набора строки
    set incsearch
    " Останавливать поиск при достижении конца файла
    set nowrapscan
    " Игнорировать регистр букв при поиске
    set ignorecase
    
    " Отключаем создание бэкапов
    set nobackup
    " Отключаем создание swap файлов
    set noswapfile
    " Все swap файлы будут помещаться в эту папку
    "set dir=~/.vim/swp
    "

    " Перемещать курсор на следующую строку при нажатии на клавиши вправо-влево и пр.
    set whichwrap=b,s,<,>,[,],l,h


    " Подсветка строки, в которой находится в данный момент курсор
    set cursorline

    " Список кодировок файлов для автоопределения
    set fileencodings=utf-8,cp1251,koi8-r,cp866

     " Меню Encoding -->
        " Выбор кодировки, в которой читать файл -->
            set wildmenu
            set wcm=<Tab>
            menu Encoding.Read.utf-8<Tab><F7> :e ++enc=utf8 <CR>
            menu Encoding.Read.windows-1251<Tab><F7> :e ++enc=cp1251<CR>
            menu Encoding.Read.koi8-r<Tab><F7> :e ++enc=koi8-r<CR>
            menu Encoding.Read.cp866<Tab><F7> :e ++enc=cp866<CR>
            map <F7> :emenu Encoding.Read.<TAB>
        " Выбор кодировки, в которой читать файл <--

        " Выбор кодировки, в которой сохранять файл -->
            set wildmenu
            set wcm=<Tab>
            menu Encoding.Write.utf-8<Tab><S-F7> :set fenc=utf8 <CR>
            menu Encoding.Write.windows-1251<Tab><S-F7> :set fenc=cp1251<CR>
            menu Encoding.Write.koi8-r<Tab><S-F7> :set fenc=koi8-r<CR>
            menu Encoding.Write.cp866<Tab><S-F7> :set fenc=cp866<CR>
            map <S-F7> :emenu Encoding.Write.<TAB>
        " Выбор кодировки, в которой сохранять файл <--

        " Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) -->
            set wildmenu
            set wcm=<Tab>
            menu Encoding.End_line_format.unix<Tab><C-F7> :set fileformat=unix<CR>
            menu Encoding.End_line_format.dos<Tab><C-F7> :set fileformat=dos<CR>
            menu Encoding.End_line_format.mac<Tab><C-F7> :set fileformat=mac<CR>
            map <C-F7> :emenu Encoding.End_line_format.<TAB>
        " Выбор формата концов строк (dos - <CR><NL>, unix - <NL>, mac - <CR>) <--
    " Меню Encoding <--


    " Просмотр нетекстовых файлов в Vim -------------------------------->
    au BufReadPost *.pdf silent %!pdftotext -nopgbrk "%" - |fmt -csw78
    au BufReadPost *.doc silent %!antiword "%"
    au BufReadPost *.odt silent %!odt2txt "%"
    " Просмотр нетекстовых файлов в Vim <-------------------------------
       
    map <F4>  <esc>:call SWITCHFOLD()<cr>
    function SWITCHFOLD()
    if &foldmethod=="marker"
        set foldmethod=syntax
        return
    endif
    if &foldmethod=="syntax"
        set foldmethod=indent
        return
    endif
    if &foldmethod=="indent"
        set foldmethod=manual
        return
    endif
    if &foldmethod=="manual"
        set foldmethod=marker
        return
    endif
    endfunction
    
    
    
    filetype off
     
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
      
    "" PLUGINS
    " Common ones
    Plugin 'kien/rainbow_parentheses.vim'
    Plugin 'sukima/xmledit'
    Plugin 'jpalardy/vim-slime'
     
    " JavaScript + frontend
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'digitaltoad/vim-jade'
    Plugin 'wavded/vim-stylus'
     
    " Clojure
    Plugin 'guns/vim-clojure-static'
   
    Plugin 'tpope/vim-surround'

    " Plugin 'lepture/vim-css'
    Plugin 'othree/xml.vim'

    " vim-coloresque
    Plugin 'gorodinskiy/vim-coloresque'
    
    " ctrlp
    Plugin 'kien/ctrlp.vim'

    " ngnix syntax highlight
    Plugin 'evanmiller/nginx-vim-syntax'

    call vundle#end()
     
    let g:slime_target = "tmux"
     
    " Для Clojure пусть при переключении вкладок переключается
    " и текущее пространство имен
    function! SendNs ()
      let cpos = getpos('.')
      exec "1 SlimeSend"
      call setpos('.', cpos)
    endfunction
    autocmd TabEnter *.clj :call SendNs()
    autocmd BufWinEnter *.clj :call SendNs()    
     
     
    filetype plugin indent on
