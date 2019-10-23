set encoding=utf-8
scriptencoding utf-8
" ↑1行目は読み込み時の文字コードの設定
" ↑2行目はVim Script内でマルチバイトを使う場合の設定
" Vim scritptにvimrcも含まれるので、日本語でコメントを書く場合は先頭にこの設定が必要になる

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/dein')
  call dein#begin('~/.vim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

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
  " 構文エラーチェック
  "call dein#add('scrooloose/syntastic')
  " 多機能セレクタ
  call dein#add('ctrlpvim/ctrlp.vim')
  " ファイルツリー
  call dein#add('scrooloose/nerdtree')
  " emmet
  call dein#add('mattn/emmet-vim')
  " cssシンタックスカラー
  call dein#add('hail2u/vim-css3-syntax')
  " htmlシンタックスカラー
  call dein#add('othree/html5.vim')
  " jsonファイル表示用
  call dein#add('elzr/vim-json')
  " pug シンタックスカラー
  call dein#add('digitaltoad/vim-pug')
  " pug予測変換
  call dein#add('dNitro/vim-pug-complete')
  " javascriptシンタックスカラー
  call dein#add('othree/yajs.vim')
  " eslint静的解析
  call dein#add('w0rp/ale')
  " javascript予測変換
  call dein#add('shougo/neocomplete.vim')
  call dein#add('mattn/jscomplete-vim')
  " javascriptインデント
  call dein#add('jiangmiao/simple-javascript-indenter')
  " 括弧自動補完
  " call dein#add('Townk/vim-autoclose')
  " ステータスバー表示強化
  "call dein#add('vim-airline/vim-airline')
  "call dein#add('vim-airline/vim-airline-themes')
  " Gitツール
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  " fzf(あいまい検索)
  call dein#add('junegunn/fzf', {'build': './install --all'})
  " fzf.vim
  call dein#add('junegunn/fzf.vim')
  " ウェルカムページ
  call dein#add('mhinz/vim-startify')


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
set clipboard=unnamed,autoselect
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
set visualbell "ビープ音を視覚表示
" 新しいウィンドウを右に開く
set splitright

"----------------------------------------------------------
" キーマップ
"----------------------------------------------------------
map <silent> <UP> :Files<CR>
map <C-j> gT
map <C-k> gt

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
"背景色をターミナルに合わせる
autocmd ColorScheme * highlight molokai ctermbg=none
colorscheme molokai

set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける
set termguicolors
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

"----------------------------------------------------------
" カーソル形状変更
"----------------------------------------------------------
"if has('vim_starting')
"    " 挿入モード時に非点滅の縦棒タイプのカーソル
"    let &t_SI .= "\e[6 q"
"    " ノーマルモード時に非点滅のブロックタイプのカーソル
"    let &t_EI .= "\e[2 q"
"    " 置換モード時に非点滅の下線タイプのカーソル
"    let &t_SR .= "\e[4 q"
"endif


"----------------------------------------------------------
" タブページ
"----------------------------------------------------------
set showtabline=2 "常にタブを表示させておく
let s:palette = g:lightline#colorscheme#powerline#palette
let s:palette.tabline.tabsel = [ [ '#1c1e1e', '#afdf02', 016, 118, 'bold' ] ]
let s:palette.tabline.middle = [ [ '#f8f8f8', '#1c1e1e', 015, 016, 'bold' ] ]
unlet s:palette

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
" カーソル
"----------------------------------------------------------
set number " 行番号を表示
"set cursorline " カーソルラインをハイライト

" バックスペースキーの有効化
set backspace=indent,eol,start
let &t_EI .= "\e[1 q" "カーソル形状変更

"マウス操作の許可
set mouse=a

"----------------------------------------------------------
" カッコ・タグの対応
"----------------------------------------------------------
set showmatch " 括弧の対応関係を表示する
set matchtime=1
source $VIMRUNTIME/macros/matchit.vim " Vimの「%」を拡張する
set matchpairs& matchpairs+=<:> " 対応括弧に<と>のペアを追加

"----------------------------------------------------------
" neocomplete・jscomplete-vimの設定
"----------------------------------------------------------
" Vim起動時にneocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" smartcase有効化. 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" 3文字以上の単語に対して補完を有効にする
let g:neocomplete#min_keyword_length = 3
" 区切り文字まで補完する
let g:neocomplete#enable_auto_delimiter = 1
" 1文字目の入力から補完のポップアップを表示
let g:neocomplete#auto_completion_start_length = 1
" バックスペースで補完のポップアップを閉じる
inoremap <expr><BS> neocomplete#smart_close_popup()."<C-h>"
" DOMとMozilla関連とES6のメソッドを補完
let g:jscomplete_use = ['dom', 'moz', 'es6th']

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
" neadtree
"----------------------------------------------------------
map <silent> <Down> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1


"----------------------------------------------------------
" winresizer
"----------------------------------------------------------
let g:winresizer_start_key = '<C-s>'

"----------------------------------------------------------
" fzf
"----------------------------------------------------------
" ファイル一覧を出すときにプレビュー表示
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" ripgrepで検索中、?を押すとプレビュー:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
"----------------------------------------------------------
" memolist
"----------------------------------------------------------
let g:memolist_path = "~/memo"
let g:memolist_memo_suffix = "txt"
