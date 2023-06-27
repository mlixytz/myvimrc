set nocompatible
filetype off
syntax on
set ic
set hlsearch
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,GB2312,big5
set cursorline
set autoindent
set smartindent
set scrolloff=4
set showmatch
set backspace=2
set nu
set mouse=nvi

" 分割默认分割在右下
set splitright
set splitbelow

filetype plugin indent on

" 停止搜索高亮的键映射
nnoremap <silent> <F2>      :nohlsearch<CR>
inoremap <silent> <F2> <C-O>:nohlsearch<CR>

" 替换光标下单词的键映射
nnoremap <Leader>v viw"0p
vnoremap <Leader>v    "0p

" visual模式复制到剪切板
vnoremap <C-c> "+y

" 不保留备份文件，支持跨会话撤回
set nobackup
set undofile
set undodir=~/.vim/undodir

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
call vundle#end()


Plugin 'Chiel92/vim-autoformat'
nnoremap <F6> :Autoformat<CR>
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

Plugin 'https://github.com/scrooloose/nerdtree'
nnoremap <F1> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

Plugin 'kien/rainbow_parentheses.vim'
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
			\ ['darkmagenta', 'DarkOrchid3'],
			\ ['Darkblue',    'firebrick3'],
			\ ['darkgreen',   'RoyalBlue3'],
			\ ['darkcyan',    'SeaGreen3'],
			\ ['darkred',     'DarkOrchid3'],
			\ ['red',         'firebrick3'],
			\ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

Plugin 'vim-airline/vim-airline'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#show_tab_nr = 0

Plugin 'Valloric/YouCompleteMe'
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = ['g:ycm_python_interpreter_path', 'g:ycm_python_sys_path']
let g:ycm_global_ycm_extra_conf = '~/.vim/global_extra_conf.py'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>']
let g:ycm_filetype_whitelist = {
      \ 'python': 1,
      \ 'vim': 1,
      \ 'sh': 1,
      \ 'zsh': 1,
      \ }
" 开启 YCM 基于标签引擎
let g:ycm_collect_identifiers_from_tags_files=1
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_autoclose_preview_window_after_completion=1
"关闭自动展示doc
let g:ycm_auto_hover = ''
nnoremap <Leader>gt :rightbelow vertical YcmCompleter GoTo<CR>
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>d :YcmCompleter GetDoc<CR>

Plugin 'w0rp/ale'
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_python_flake8_options = '--max-line-length=120'

Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
set background=dark
colorscheme solarized

Plugin 'python-mode/python-mode'
let g:pymode_rope = 0
let g:pymode_syntax_print_as_function = 1
let g:pymode_syntax_string_format = 0
let g:pymode_syntax_string_templates = 0
let g:pymode_lint_on_write = 0
let g:pymode_options_max_line_length = 120
let g:pymode_options_colorcolumn = 1
nnoremap <F3> :PymodeLint<CR>
nnoremap <F4> :PymodeLintAuto<CR>

Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '│'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
highlight! link SignColumn LineNr
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1
let g:gitgutter_set_sign_backgrounds = 1

Plugin 'preservim/nerdcommenter'
nnoremap <Leader><space> <plug>NERDCommenterToggle
vnoremap <Leader><space> <plug>NERDCommenterToggle

Plugin 'mg979/vim-visual-multi'
