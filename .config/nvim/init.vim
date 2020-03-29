
let mapleader =" " " space works well with both US an CSA keyboard layouts

call plug#begin('~/.config/nvim/plugged')
	Plug 'godlygeek/tabular'
	Plug 'plasticboy/vim-markdown'
	Plug 'PotatoesMaster/i3-vim-syntax'
	Plug 'tpope/vim-commentary'
	Plug 'OmniSharp/omnisharp-vim'
	Plug 'prabirshrestha/asyncomplete.vim'
	Plug 'junegunn/goyo.vim'
	" Plug 'dkarter/bullets.vim'
	"Plug 'w0rp/ale'
	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
    Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'lervag/vimtex'
	"Plug 'Konfekt/FastFold' " Essential if you want to use folding in vimlatex otherwise really slow
	"Plug 'jreybert/vimagit'
	"Plug 'LukeSmithxyz/vimling'
	"Plug 'vimwiki/vimwiki'
	Plug 'mattn/emmet-vim'
	"Plug 'easymotion/vim-easymotion'
	"Plug 'roxma/vim-hug-neovim-rpc'
	"Plug 'fatih/vim-go'
	"Plug 'tmhedberg/SimpylFold'
	"Plug 'Valloric/YouCompleteMe'
	"Plug 'scrooloose/syntastic'
	"Plug 'davidhalter/jedi-vim'
	"Plug 'dpelle/vim-Grammalecte'
	"Plug 'tpope/vim-fugitive'
	"Plug 'tpope/vim-surround'
call plug#end()


" Some basics:
    command W w
	set nocompatible
	"filetype plugin on
	autocmd BufNewFile,BufRead *.md filetype plugin indent off
	syntax on
	set encoding=utf-8
	set nonumber
	set wildmode=longest,list,full
    set showbreak=\ \ \ ↪
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " Disables automatic commenting on newline:

" Increases readability when typing notes or readable stuff
	" Indents word-wrapped lines as much as the 'parent' line
	autocmd FileType rmd set breakindent
	" Ensures word-wrap does not split words
	autocmd FileType rmd set formatoptions=l
	autocmd FileType rmd set lbr
	" Indents word-wrapped lines as much as the 'parent' line
	autocmd FileType md set breakindent
	" Ensures word-wrap does not split words
	autocmd FileType md set formatoptions=l
	autocmd FileType md set lbr

" vim-Grammalecte
	" let g:grammalecte_cli_py='/usr/bin/cli.py' " had to create a simlink that pointed to grammalecte_cli_py
	" map <leader>o <Esc>:GrammalecteCheck<CR><C-j><Down><Down>zt<C-k><C-w>=
	" map <leader>O <Esc>:GrammalecteClear<CR>

	"nnoremap Pt <Esc>:wa<Enter>:redir => scriptn \| sil exe 'args' \| redir end \| echo(system('CountPoints',scriptn))<Enter>
" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set linebreak<CR>


" vim markdown
	autocmd FileType rmd,md set indentexpr= " avoiding weird bug with new line
	let g:vim_markdown_folding_style_pythonic = 1
	let g:vim_markdown_auto_insert_bullets = 0
	let g:vim_markdown_new_list_item_indent = 0 "avoiding autoindent for list items " not working?
	"let g:vim_markdown_folding_level = 1 " not working
	"let g:vim_markdown_folding_disabled = 1


" Spell-check set to <leader>o, 'o' for 'orthography':
	"map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR><CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	autocmd BufRead,BufNewFile *.tex set filetype=tex

" Use urlscan to choose and open a url:
	:noremap <leader>u :w<Home> !urlscan -r 'linkhandler {}'<CR>
	:noremap ,, !urlscan -r 'linkhandler {}'<CR>

" Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
	vnoremap <C-c> "+y
	map <C-p> "+P
	inoremap <C-v> <Esc>"+pa

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost ~/.bmfiles,~/.bmdirs !shortcuts

" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost ~/.Xresources !xrdb %

" Navigating with guides
"	inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
"	vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
"	map <Space><Tab> <Esc>/<++><Enter>"_c4l

 "____        _                  _
"/ ___| _ __ (_)_ __  _ __   ___| |_ ___
"\___ \| '_ \| | '_ \| '_ \ / _ \ __/ __|
 "___) | | | | | |_) | |_) |  __/ |_\__ \
"|____/|_| |_|_| .__/| .__/ \___|\__|___/
              "|_|   |_|

"""LATEX
	" Word count:
	autocmd FileType tex map <leader><leader>o :w !detex \| wc -w<CR>
	" Code snippets
	autocmd FileType tex inoremap ,fr \begin{frame}<Enter>\frametitle{}<Enter><Enter><++><Enter><Enter>\end{frame}<Enter><Enter><++><Esc>6kf}i
	autocmd FileType tex inoremap ,fi \begin{fitch}<Enter><Enter>\end{fitch}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,exe \begin{exe}<Enter>\ex<Space><Enter>\end{exe}<Enter><Enter><++><Esc>3kA
	autocmd FileType tex inoremap ,em \emph{}<++><Esc>T{i
	autocmd FileType tex inoremap ,bf \textbf{}<++><Esc>T{i
	autocmd FileType tex vnoremap , <ESC>`<i\{<ESC>`>2la}<ESC>?\\{<Enter>a
	autocmd FileType tex inoremap ,it \textit{}<++><Esc>T{i
	autocmd FileType tex inoremap ,ct \textcite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,cp \parencite{}<++><Esc>T{i
	autocmd FileType tex inoremap ,glos {\gll<Space><++><Space>\\<Enter><++><Space>\\<Enter>\trans{``<++>''}}<Esc>2k2bcw
	autocmd FileType tex inoremap ,x \begin{xlist}<Enter>\ex<Space><Enter>\end{xlist}<Esc>kA<Space>
	autocmd FileType tex inoremap ,ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
	autocmd FileType tex inoremap ,li <Enter>\item<Space>
	autocmd FileType tex inoremap ,ref \ref{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,tab \begin{tabular}<Enter><++><Enter>\end{tabular}<Enter><Enter><++><Esc>4kA{}<Esc>i
	autocmd FileType tex inoremap ,ot \begin{tableau}<Enter>\inp{<++>}<Tab>\const{<++>}<Tab><++><Enter><++><Enter>\end{tableau}<Enter><Enter><++><Esc>5kA{}<Esc>i
	autocmd FileType tex inoremap ,can \cand{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,con \const{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,v \vio{}<Tab><++><Esc>T{i
	autocmd FileType tex inoremap ,a \href{}{<++>}<Space><++><Esc>2T{i
	autocmd FileType tex inoremap ,sc \textsc{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,chap \chapter{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sec \section{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
	autocmd FileType tex inoremap ,st <Esc>F{i*<Esc>f}i
	autocmd FileType tex inoremap ,beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
	autocmd FileType tex inoremap ,up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex nnoremap ,up /usepackage<Enter>o\usepackage{}<Esc>i
	autocmd FileType tex inoremap ,tt \texttt{}<Space><++><Esc>T{i
	autocmd FileType tex inoremap ,bt {\blindtext}
	autocmd FileType tex inoremap ,nu $\varnothing$
	autocmd FileType tex inoremap ,col \begin{columns}[T]<Enter>\begin{column}{.5\textwidth}<Enter><Enter>\end{column}<Enter>\begin{column}{.5\textwidth}<Enter><++><Enter>\end{column}<Enter>\end{columns}<Esc>5kA
	autocmd FileType tex inoremap ,rn (\ref{})<++><Esc>F}i

"""HTML
	autocmd FileType html inoremap ,b <b></b><Space><++><Esc>FbT>i
	autocmd FileType html inoremap ,it <em></em><Space><++><Esc>FeT>i
	autocmd FileType html inoremap ,1 <h1></h1><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,2 <h2></h2><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,3 <h3></h3><Enter><Enter><++><Esc>2kf<i
	autocmd FileType html inoremap ,p <p></p><Enter><Enter><++><Esc>02kf>a
	autocmd FileType html inoremap ,a <a<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,e <a<Space>target="_blank"<Space>href=""><++></a><Space><++><Esc>14hi
	autocmd FileType html inoremap ,ul <ul><Enter><li></li><Enter></ul><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,li <Esc>o<li></li><Esc>F>a
	autocmd FileType html inoremap ,ol <ol><Enter><li></li><Enter></ol><Enter><Enter><++><Esc>03kf<i
	autocmd FileType html inoremap ,im <img src="" alt="<++>"><++><esc>Fcf"a
	autocmd FileType html inoremap ,td <td></td><++><Esc>Fdcit
	autocmd FileType html inoremap ,tr <tr></tr><Enter><++><Esc>kf<i
	autocmd FileType html inoremap ,th <th></th><++><Esc>Fhcit
	autocmd FileType html inoremap ,tab <table><Enter></table><Esc>O
	autocmd FileType html inoremap ,gr <font color="green"></font><Esc>F>a
	autocmd FileType html inoremap ,rd <font color="red"></font><Esc>F>a
	autocmd FileType html inoremap ,yl <font color="yellow"></font><Esc>F>a
	autocmd FileType html inoremap ,dt <dt></dt><Enter><dd><++></dd><Enter><++><esc>2kcit
	autocmd FileType html inoremap ,dl <dl><Enter><Enter></dl><enter><enter><++><esc>3kcc
	autocmd FileType html inoremap &<space> &amp;<space>
	" autocmd FileType html inoremap á &aacute;
	" autocmd FileType html inoremap é &eacute;
	" autocmd FileType html inoremap í &iacute;
	" autocmd FileType html inoremap ó &oacute;
	" autocmd FileType html inoremap ú &uacute;
	" autocmd FileType html inoremap ä &auml;
	" autocmd FileType html inoremap ë &euml;
	" autocmd FileType html inoremap ï &iuml;
	" autocmd FileType html inoremap ö &ouml;
	" autocmd FileType html inoremap ü &uuml;
	" autocmd FileType html inoremap ã &atilde;
	" autocmd FileType html inoremap ẽ &etilde;
	" autocmd FileType html inoremap ĩ &itilde;
	" autocmd FileType html inoremap õ &otilde;
	" autocmd FileType html inoremap ũ &utilde;
	" autocmd FileType html inoremap ñ &ntilde;
	" autocmd FileType html inoremap à &agrave;
	" autocmd FileType html inoremap è &egrave;
	" autocmd FileType html inoremap ì &igrave;
	" autocmd FileType html inoremap ò &ograve;
	" autocmd FileType html inoremap ù &ugrave;


""".bib
	autocmd FileType bib inoremap ,a @article{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>journal<Space>=<Space>{<++>},<Enter>volume<Space>=<Space>{<++>},<Enter>pages<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i
	autocmd FileType bib inoremap ,b @book{<Enter>author<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>6kA,<Esc>i
	autocmd FileType bib inoremap ,c @incollection{<Enter>author<Space>=<Space>{<++>},<Enter>title<Space>=<Space>{<++>},<Enter>booktitle<Space>=<Space>{<++>},<Enter>editor<Space>=<Space>{<++>},<Enter>year<Space>=<Space>{<++>},<Enter>publisher<Space>=<Space>{<++>},<Enter>}<Enter><++><Esc>8kA,<Esc>i

"MARKDOWN
	autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
	autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
	autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
	autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
	autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
	autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
	autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
	autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
	autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
	autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO

""".xml
	autocmd FileType xml inoremap ,e <item><Enter><title><++></title><Enter><guid<space>isPermaLink="false"><++></guid><Enter><pubDate><Esc>:put<Space>=strftime('%a, %d %b %Y %H:%M:%S %z')<Enter>kJA</pubDate><Enter><link><++></link><Enter><description><![CDATA[<++>]]></description><Enter></item><Esc>?<title><enter>cit
	autocmd FileType xml inoremap ,a <a href="<++>"><++></a><++><Esc>F"ci"

" MY STUFF

" Miscellaneous
	"filetype plugin indent on " required (but why?)

	" Should speed up thing  (scrolling, moving, etc) in vim when using tmux"
	set ttyfast

	" Highlight searched words with # and * for eg.
	set hlsearch

	" Turn backup off, since most stuff is in SVN, git et.c anyway...
	set nobackup
	set nowb

	" Use * and # to search for the current selection
	vnoremap * y/<C-R>"<CR>
	vnoremap # y?<C-R>"<CR>

	" Can edit crontab file
	au BufEnter /tmp/crontab.* setl backupcopy=yes


" Deoplete settings
	"let g:acp_enableAtStartup = 0
	" let g:deoplete#enable_at_startup = 1
	" let g:neocomplete#sources#syntax#min_keyword_length = 3
    " let g:deoplete#enable_smart_case = 1
	" call deoplete#custom#option('sources', {
	" 	\ 'cs': ['omnisharp'],
	" 	\})




" Tab completion
	inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" omnisharp-vim settings
	"let g:OmniSharp_timeout = 5
	"let g:Omnisharp_start_server = 1
	"let g:OmniSharp_server_path = '/home/mbarakatt/.omnisharp/omnisharp-roslyn/omnisharp/OmniSharp.exe'
	"let g:OmniSharp_server_use_mono = 1
	"set previewheight=5
	set completeopt+=preview,longest,menuone
	let g:OmniSharp_server_stdio =1
	let g:OmniSharp_server_stdio_quickload = 1


" ale settings
	" If ALE is installed, it will automatically be used to asynchronously check your code for errors.  No further configuration is necessary. However, be aware that ALE supports multiple C# linters, and will run all linters that are available on your system. To limit ALE to only use OmniSharp (recommended), add this to your .vimrc:
	"
	" let g:ale_linters = {
	" \ 'cs': ['OmniSharp']
	" \}


" vim-latex settings
	" for skim vimlatex syncronyzation
	" let g:vimtex_view_method = 'skim'
	" let g:vimtex_view_general_viewer = 'zathura'
	" let g:vimtex_view_general_options = '@line @pdf @tex'
	" let g:vimtex_view_general_viewer = '/Users/mbarakat/Applications/Skim.app/Contents/SharedSupport/displayline'
	" let g:vimtex_view_general_options = '@line @pdf @tex'
	" No Spell check in latex comments
	let g:tex_comment_nospell=1
	let g:vimtex_complete_close_braces=1
	" Spellcheck in latex-vim mode
	autocmd FileType tex set spelllang=en spell

let g:tex_fold_enabled = 1
" set foldmethod=expr
" set foldexpr=vimtex#fold#level(v:1)
" set foldtext=vimtex#fold#text()
" Don't fold the first level of things
" set foldlevel=1



" Settings for vim-commentary
	autocmd FileType python set commentstring=#\ %s
	autocmd FileType vim set commentstring=\"\ %s
	autocmd FileType sh set commentstring=#\ %s
	autocmd FileType tex set commentstring=%\ %s
	autocmd FileType cs set commentstring=//\ %s

"Settings for syntastic
	" let g:syntastic_quiet_messages = { "type": "style" } " No style messages
	" set statusline+=%#warningmsg#
	" set statusline+=%{SyntasticStatuslineFlag()}
	" set statusline+=%*

	" let g:syntastic_always_populate_loc_list = 1
	" let g:syntastic_auto_loc_list = 0  " remove the list of errors at the bottom.
	" let g:syntastic_check_on_open = 1
	" let g:syntastic_check_on_wq = 0
	" let g:syntastic_python_checkers = ['flake8']
	" " W191: ignore tab as indentation,
	" " E501: line to long
	" " F403 thinks import _ from * is an error.
	" " E128 when doing multi line code and the indentation is wrong.
	" let g:syntastic_python_flake8_args = '--ignore=W191,E501,F403,E128'



""""""""""""""" MORE RANDOM STUFF """""""""""""""""

" Return to last edit position when opening files
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line("'\"") <= line("$") |
	\ exe "normal! g`\"" |
	\ endif
" Remember info about open buffers on close
	set viminfo^=%

"Replace selected text by something else. Select, then enter C-r then type the replacing text.
	vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

"Save using \s
	noremap <Leader>s :update<CR>

"Single character insertion
	" nmap <Space> i_<Esc>r conflicting with new leader

" Smart way to move between windows
	" map <C-j> <C-W>j
	" map <C-k> <C-W>k
	" map <C-h> <C-W>h
	" map <C-l> <C-W>l
	" map <C-p> <C-W>p
	" map <C-\> <C-W>\

" The number of spaces a tab is. the following two lines must be present for > to work properly
	set tabstop=4
	set shiftwidth=4
	set expandtab

" backspace that makes sense
	set backspace=indent,eol,start
	set whichwrap+=<,>,h,l

" Treat long lines as break lines (useful when moving around in them)
	map j gj
	map k gk

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
	func! DeleteTrailingWS()
	exe "normal mz"
	%s/\s\+$//ge
	exe "normal `z"
	endfunc
	autocmd BufWrite *.py :call DeleteTrailingWS()

" This will execute the update command on leaving vim to a tmux pane. Default is Zero
	let g:tmux_navigator_save_on_switch = 1

" Always show the status bar in vim
	" set laststatus=2

" Return to normal mode with jj
	inoremap jj <Esc>

" Compile cs files using dotnet build
	" autocmd FileType cs inoremap <F5> <Esc>:wa<Enter>:!dotnet run<Enter>
	" autocmd FileType cs nnoremap <F5> <Esc>:wa<Enter>:!dotnet run<Enter>
	autocmd FileType cs inoremap <F5> <Esc>:wa<Enter>:!cscmonodel "%"<Enter>
	autocmd FileType cs nnoremap <F5> <Esc>:wa<Enter>:!cscmonodel "%"<Enter>

" Compile latex file using pdflatex
	autocmd FileType tex inoremap <F5> <Esc>:wa<Enter>:!pdflatex "%"<Enter>
	autocmd FileType tex nnoremap <F5> <Esc>:wa<Enter>:!pdflatex "%"<Enter>

" Run py files using python3
	autocmd FileType python inoremap <F5> <Esc>:wa<Enter>:!python3<space><c-r>%<Enter>
	autocmd FileType python nnoremap <F5> <Esc>:wa<Enter>:!python3<space><c-r>%<Enter>

" Marking code for students
	nnoremap Pc o// Correction [[  points ]]<space><Esc>F[<right><right>i
	"nnoremap Pt <Esc>:w<Enter>:!CountPoints<space>%<Enter>
	" nnoremap Pt <Esc>:wa<Enter>:!CountPoints<space>$( ls *.cpp<space>*.h<space>*.cs<space>*.py)<Enter>
	nnoremap Pt <Esc>:wa<Enter>:redir => scriptn \| sil exe 'args' \| redir end \| echo(system('CountPoints',scriptn))<Enter>

" Quit and save all
	nnoremap <leader>s <Esc>:wa<Enter>
" Quickly insert date (in ISO format)
  nmap Pd i<C-R>=strftime("%Y-%m-%d ")<CR><Esc>
" Quickly insert hour and minute (in ISO format)
  nmap PD i<C-R>=strftime("%H:%M ")<CR><Esc>
" To use fzf in Vim, add the following line to your .vimrc:
  set rtp+=/usr/local/opt/fzf

" Color, not ideal but better.
	" hi StatusLine ctermbg=4 ctermfg=black   " 8
	" hi Search cterm=NONE ctermfg=white ctermbg=grey
	"

let s:hidden_all = 0
function! ToggleHiddenAll()
    if s:hidden_all  == 0
        let s:hidden_all = 1
        set noshowmode
        set noruler
        set laststatus=0
        set noshowcmd
    else
        let s:hidden_all = 0
        set showmode
        set ruler
        set laststatus=2
        set showcmd
    endif
endfunction
nnoremap <S-h> :call ToggleHiddenAll()<CR>

" Airline theme
	let g:airline_theme='dracula'

" ################# Not useful ############
" you-complete-me settings
	" let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
	" let g:ycm_server_keep_logfiles = 1

	" Load ycm_extra_conf.py in current directory without confirmation
	" let g:ycm_extra_conf_globlist = ['./*']

	" can use both ycm and jedi-vim at the same time.
	" let g:jedi#completions_enabled = 0
	" let g:jedi#auto_initialization = 0

	" let g:ycm_auto_trigger = 1
	" let g:ycm_min_num_of_chars_for_completion =

	" semantic triggers for ref and cite in tex mode
	" let g:ycm_semantic_triggers = {
	" \  'tex'  : ['\ref{','\cite{'],
	" \ }

" jedi-vim settings
	" let g:jedi#use_splits_not_buffers = "left"
