" line `. last edit `` last jump `^ insertmod
let filename=expand('%:r')
let mapleader="\<Space>"
nnoremap K i<CR><Esc>
nnoremap <c-l> gg=G `. 
inoremap <c-l> <Esc> gg=G `^ <CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>q q 
"record key leader q disable record q
nnoremap q :w <CR>
inoremap <B-q> <Esc>:w <CR>
nnoremap <Leader>\| :TableModeToggle<CR>
noremap  <Leader>l :tabn<CR> 
noremap  <Leader>h :tabp<CR>
noremap  <Leader>o :tabnew<CR>
noremap  <Leader>x :tabclose<CR>
noremap  <Leader>v :call ToggleMouse()<CR>
noremap  <Leader>y "+y
map <Leader> <Plug>(easymotion-prefix)
set number 
set relativenumber 
set nocompatible
set encoding=utf-8
set mouse+=a

" +--------------+
" | TOGGLE MOUSE |
" +--------------+
function! ToggleMouse()
	if &mouse == 'a'
		set mouse=
	else
		set mouse=a
	endif
endfunc

filetype off

" +------------+
" | POWER LINE |
" +------------+
set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/   
set laststatus=2                                                            
set t_Co=256

" +--------+
" | PLUGIN |
" +--------+
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-pathogen'
Plugin 'python-mode/python-mode' 	" python
Plugin 'tpope/vim-surround'		" 'Hello world!' cs'<q> <q>Hello world!</q> vS add 
Plugin 'VundleVim/Vundle.vim'		"set Plugin
Plugin 'Lokaltog/powerline' 		" power line mode
Plugin 'jiangmiao/auto-pairs'           "auto closing pair brak
Plugin 'SirVer/ultisnips'		"snippet 
Plugin 'jrozner/vim-antlr'              "antlr
Plugin 'Valloric/YouCompleteMe' 	"auto complete
Plugin 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plugin 'easymotion/vim-easymotion' 	"easy motion Leader Leader j or k
Plugin 'scrooloose/nerdcommenter' 	"commnent Leader cc cu ma md
Plugin 'artur-shaik/vim-javacomplete2'  "java complete
Plugin 'dhruvasagar/vim-table-mode', {'on': 'TableModeToggle'} 	" || && Leader |
Plugin 'dim13/smyck.vim' 	 	" color
Plugin 'nightsense/willy' 	 	" color for terminal
call vundle#end()            
filetype plugin indent on    
call pathogen#infect()
call pathogen#helptags()
syntax enable
colors smyck

" +-------+
" | TABLE |
" +-------+
let g:table_mode_corner='|'
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='-'

" +---------------+
" | AUTO COMPLETE |
" +---------------+
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" +------------+
" | SUPPER TAB |
" +------------+
au FileType java setlocal omnifunc=javacomplete#Complete
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" +---------+
" | COMMENT |
" +---------+
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" +--------+
" | BUFFER |
" +--------+
au BufNewFile,BufRead *.py,*.c,*.cpp,*.scala,*.java,*.java
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set textwidth=79 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2

" +---------+
" | COMPILE |
" +---------+
au Filetype python  nnoremap <F5> :w <CR> :!clear && python  % <CR>
" au Filetype python  nnoremap q :w <CR> :!clear && python  % <CR>
au Filetype python  inoremap <F5> <Esc>:w <CR> :!clear && python  % <CR>
au Filetype c,cpp  nnoremap <F5>  :w <CR> :call CompileCpp() <CR>
au Filetype c,cpp  inoremap <F5>  <Esc>:w <CR> :call CompileCpp() <CR>
au Filetype c,cpp  nnoremap <F10>  :w <CR> :!clear && g++  % -o %:r && ./%:r <CR>
au Filetype c,cpp  inoremap <F10>  <Esc>:w <CR> :!clear && g++  % -o %:r && ./%:r <CR>
" au Filetype java  nnoremap <F5>  :w <CR>:call CompileJava() <CR>
au Filetype java  nnoremap <F5>  :w <CR>:call CompileJava() <CR>
" command! -complete=shellcmd  B call s:ExecuteInShell("clear && g++  % -o %:r && %:p:r")
nnoremap <F4> :call s:ExecuteInShell("clear && g++  % -o %:r && %:p:r")<CR>
au Filetype java  inoremap <F5>  <Esc>:w <CR>:call CompileJava() <CR>
au Filetype java  nnoremap <F10>  :w <CR> :!clear && javac %  && java  %:r <CR>
au Filetype java  inoremap <F10> <Esc> :w <CR> :!clear && javac %  && java  %:r <CR>
au Filetype txt  nnoremap <F5> :e! <CR>
au Filetype txt  inoremap <F5> <Esc> :e! <CR>
au Filetype scala  nnoremap <F5>  :!clear && scalac %  && scala  %:r <CR>
function! CompileCpp()
	if !empty(glob("input"))
		:!clear && g++  % -o %:r && ./%:r<input 
	else
		:!clear && g++  % -o %:r && ./%:r
	endif
endfunction
function! CompileJava()
	if !empty(glob("input"))
		:!clear && javac %  && java  %:r < input
	else
		:!clear && javac %  && java  %:r 
	endif
endfunction

" +---------+
" | COMMENT |
" +---------+
" autocmd FileType c,cppva,scala let b:comment_leader = '// '
" autocmd FileType sh,ruby,python   let b:comment_leader = '# '
" autocmd FileType conf,fstab       let b:comment_leader = '# '
" autocmd FileType tex              let b:comment_leader = '% '
" autocmd FileType mail             let b:comment_leader = '> '
" autocmd FileType vim              let b:comment_leader = '" '
" noremap <silent> <leader>cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
" noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>'"'"

" +-------------+
" | EASY MOTION |
" +-------------+
nmap <leader>g :YcmCompleter GoTo<CR>
nmap <leader>d :YcmCompleter GoToDefinition<CR>
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)
nmap s <Plug>(easymotion-overwin-f2)
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map  <Leader>f <Plug>(easymotion-bd-w)
nmap <Leader>f <Plug>(easymotion-overwin-w)

function! s:ExecuteInShell(command)
	let command = join(map(split(a:command), 'expand(v:val)'))
	let winnr = bufwinnr('^' . command . '$')
	silent! execute  winnr < 0 ? 'botright vnew ' . fnameescape(command) : winnr . 'wincmd w'
	setlocal buftype=nowrite bufhidden=wipe nobuflisted noswapfile nowrap number
	silent! execute 'silent %!'. command
	silent! execute 'resize '
	silent! redraw
	silent! execute 'au BufUnload <buffer> execute bufwinnr(' . bufnr('#') . ') . ''wincmd w'''
	silent! execute 'nnoremap <silent> <buffer> <LocalLeader>r :call <SID>ExecuteInShell(''' . command . ''')<CR>'
	echo 'Shell command ' . command . ' executed.'
endfunction
command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)]
