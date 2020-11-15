set encoding=utf-8
scriptencoding utf-8
" ↑1行目は読み込み時の文字コードの設定
" ↑2行目はVim Script内でマルチバイトを使う場合の設定
" Vim scritptにvimrcも含まれるので、日本語でコメントを書く場合は先頭にこの設定が必要になる

"dein Scripts-----------------------------
"
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

"----------------------------------------------------------
" 導入プラグイン
"----------------------------------------------------------
  " ウィンドウサイズ変更用
  call dein#add('simeji/winresizer')
  " メモ機能
  call dein#add('glidenote/memolist.vim')
  " molokaiテーマ
  call dein#add('tomasr/molokai')
  " ステータスラインの表示内容強化
  call dein#add('itchyny/lightline.vim')
  " インデントの可視化
  call dein#add('Yggdroot/indentLine')
  " 末尾の全角半角空白文字を赤くハイライト
  call dein#add('bronson/vim-trailing-whitespace')
  " emmet
  call dein#add('mattn/emmet-vim')
  " pug シンタックスカラー
  call dein#add('digitaltoad/vim-pug')
  " pug予測変換
  call dein#add('dNitro/vim-pug-complete')
  " jsonファイル表示用
  call dein#add('elzr/vim-json')
  " eslint静的解析
  call dein#add('w0rp/ale')
  " Gitツール
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  " fzf(あいまい検索)
  call dein#add('junegunn/fzf', {'build': './install --all'})
  " fzf.vim
  call dein#add('junegunn/fzf.vim')
  " ウェルカムページ
  call dein#add('mhinz/vim-startify')
  " lsp
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('mattn/vim-lsp-settings', {'merged': 0})
  call dein#add('hrsh7th/vim-vsnip')
  call dein#add('hrsh7th/vim-vsnip-integ')
  " Docker
  call dein#add('skanehira/docker.vim')
  call dein#add('skanehira/docker-compose.vim')
  " React & JavaScript syntax
  call dein#add('yuezk/vim-js')
  call dein#add('maxmellon/vim-jsx-pretty')
  call dein#add('justinj/vim-react-snippets')
  call dein#add('jbgutierrez/vim-babel')
  " ファイラー
  call dein#add('lambdalisue/fern.vim')
  call dein#add('lambdalisue/fern-hijack.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------
" クリップボード連携
"set clipboard=unnamed,autoselect
"set clipboard&
"set clipboard^=unnamedplus
set clipboard+=unnamed
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
set visualbell "ビープ音を視覚表示
" 新しいウィンドウを右に開く
set splitright
" ファイラ機能をONにする
filetype plugin on
" tree view
let g:netrw_liststyle = 3
" 上部に表示される情報を非表示
let g:netrw_banner = 0
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1
" 矢印でも自動補完をするようにする
inoremap <expr> <down> ((pumvisible())?("\<C-n>"):("\<down>"))
inoremap <expr> <up> ((pumvisible())?("\<C-p>"):("\<up>"))
" ビープを無効
set visualbell t_vb=
"----------------------------------------------------------
" 日時表示
"----------------------------------------------------------
let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
let wday = strftime("%w")
command! Time echo strftime('%Y-%m-%d ').weeks[wday].strftime(' %H:%M')
"----------------------------------------------------------
" キーマップ
"----------------------------------------------------------
"map <silent> <UP> :Files<CR>
map <C-j> gT
map <C-k> gt

"----------------------------------------------------------
" ターミナル設定
"----------------------------------------------------------
" <Esc> で :terminal の insert を抜ける
tnoremap <Esc> <C-w><S-n>
" タブ移動キー設定
tnoremap <C-j> <C-w>g<S-t>
tnoremap <C-k> <C-w>gt
" タブでターミナルを開く
command! Ttm :tab terminal

"----------------------------------------------------------
" WELCOMEページ
"----------------------------------------------------------
" startifyのヘッダー部分に表示する文字列を設定する(dateコマンドを実行して日付を設定している)
let g:startify_custom_header =
  \ map(split(system('date'), '\n'), '"   ". v:val') + ['','']
" デフォルトだと、最近使ったファイルの先頭は数字なので、使用するアルファベットを指定
let g:startify_custom_indices = ['f', 'g', 'h', 'r', 'i', 'o', 'b']
" よく使うファイルをブックマークとして登録しておく
let g:startify_bookmarks = [
  \ '~/.vimrc',
  \ '~/.zshrc',
  \ '~/.zprofile',
  \ '~/memo',
  \ '~/internous-pjt/4each-pjt/4each/',
  \ '~/internous-pjt/college-app/',
  \ ]

"----------------------------------------------------------
" カラースキーム
"----------------------------------------------------------
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none

colorscheme molokai

set t_Co=256 " iTerm2など既に256色環境なら無くても良い
"set termguicolors
let g:rehash256 = 1
let g:molokai_original = 1

"----------------------------------------------------------
" カーソル
"----------------------------------------------------------
set number " 行番号を表示
"set cursorline " カーソルラインをハイライト

" バックスペースキーの有効化
set backspace=indent,eol,start
let &t_EI .= "\e[1 q" "カーソル形状変更

"----------------------------------------------------------
" タブページ
"----------------------------------------------------------
"set showtabline=2 "常にタブを表示させておく
"let s:palette = g:lightline#colorscheme#powerline#palette
"let s:palette.tabline.tabsel = [ [ '#1c1e1e', '#afdf02', 016, 118, 'bold' ] ]
"let s:palette.tabline.middle = [ [ '#f8f8f8', '#1c1e1e', 015, 016, 'bold' ] ]
"unlet s:palette

"----------------------------------------------------------
" 文字
"----------------------------------------------------------
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

"----------------------------------------------------------
" ステータスライン
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの位置を表示する

"----------------------------------------------------------
" コマンドモード
"----------------------------------------------------------
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

"----------------------------------------------------------
" タブ・インデント
"----------------------------------------------------------
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅

"タブ、空白、改行の可視化
set list
set listchars=tab:->,

"----------------------------------------------------------
" 文字列検索
"----------------------------------------------------------
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

"----------------------------------------------------------
" カッコ・タグの対応
"----------------------------------------------------------
"対応括弧の表示を無効にする
let loaded_matchparen = 1
"set showmatch " 括弧の対応関係を表示する
"set matchtime=1
"source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
"set matchpairs& matchpairs+=<:> " 対応括弧に<と>のペアを追加

"----------------------------------------------------------
" indentLine
"----------------------------------------------------------
"let g:indentLine_color_term = 111
"let g:indentLine_color_gui = '#696969'
let g:indentLine_char = '¦'

"----------------------------------------------------------
" HTMLおよび括弧の自動補完
"----------------------------------------------------------
augroup MyXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

"----------------------------------------------------------
"emmet-vim
"----------------------------------------------------------
let g:user_emmet_leader_key='<c-l>'

"----------------------------------------------------------
"elzr/vim-json
"----------------------------------------------------------
let g:vim_json_syntax_conceal = 0

"----------------------------------------------------------
" winresizer
"----------------------------------------------------------
command! Wr :WinResizerStartResize
let g:winresizer_start_key = 'C-s'

"----------------------------------------------------------
" git
"----------------------------------------------------------
"記号列（左のエリア）を透明にする
highlight clear SignColumn

"----------------------------------------------------------
" fzf
"----------------------------------------------------------
" ripgrepで検索中、?を押すとプレビュー:
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Filesコマンドにもプレビューを出す
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.cache/dein/repos/github.com/junegunn/fzf.vim/bin/preview.sh {}']}, <bang>0)
"----------------------------------------------------------
" memolist
"----------------------------------------------------------
let g:memolist_path = "~/memo"
let g:memolist_memo_suffix = "txt"


"----------------------------------------------------------
" lightline
"----------------------------------------------------------
let g:lightline = {
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive'], [ 'filepath' ]]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filepath': 'LightlineFilePath',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFilePath()
  if winwidth(0) > 90
    return expand("%:s")
  else
    return expand("%:t")
  endif
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


"----------------------------------------------------------
" vim-lsp
"----------------------------------------------------------
if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1

"----------------------------------------------------------
" Fern
"----------------------------------------------------------
noremap <silent> <Leader>. :Fern . -drawer -width=35 -toggle<CR><C-w>=
