" LeaderキーをSpaceに変更
let mapleader = "\<space>"


""""""""""""""""
" Vim Settings "
""""""""""""""""

" シンタックスハイライトを有効化
syntax on
" ファイルタイプに基づいたインデントを有効化
filetype plugin indent on
" 行数表示
set number
" 新しい行を始めるときに自動でインデント
set autoindent
" タブをスペースに変換
set expandtab
" タブをスペース4文字とカウント
set tabstop=4
" 自動インデントに使われるスペースの数
set shiftwidth=4
" 多くのターミナルでバックスペースの挙動を修正
set backspace=2
" コードを折りたたむ
set foldmethod=indent
" Tabによる自動補完を有効にする
set wildmenu
" 最長マッチまで補完してから自動補完メニューを開く
set wildmode=list:longest,full
" 検索用
set hlsearch
set incsearch
" ファイルを開いたときは折りたたみを展開する
autocmd BufRead * normal zR
" ウィンドウを閉じずにバッファを閉じる
command! Bd :bp | :sp | :bn | :bd
" スワップファイルを保存するディレクトリ
" set directory=$HOME/.vim/swap//


""""""""""""""""""""""""""""
" デフォルトキーマッピング "
""""""""""""""""""""""""""""

" 対応する閉じカッコや引用符を入力する
inoremap ' ''<esc>i
inoremap " ""<esc>i
" inoremap ( ()<esc>i
" inoremap { {}<esc>i
" inoremap [ []<esc>i

" YouCompleteMe用
noremap <leader>] :YcmCompleter GoTo<cr>


""""""""""""""""""
" プラグイン関連 "
""""""""""""""""""

" vim-plugがまだインストールされていなければインストールする
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
                \https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'mileszs/ack.vim'
" Plug 'sjl/gundo.vim'

let g:plug_timeout = 300
Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }

call plug#end()

"""""""""
" ctags "
"""""""""
" 親ディレクトリにあるtagsファイルを再帰的に探す
set tags=tags
" Pythonのファイルを保存するたびにタグファイルを再生成する
autocmd BufWritePost *.py silent! !ctags -R &

