filetype plugin on

let mapleader =" " " space works well with both US an CSA keyboard layouts
call plug#begin('~/.vim/plugged')
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" omnisharp-vim settings
	let g:OmniSharp_timeout = 5
	let g:Omnisharp_start_server = 1
	"let g:OmniSharp_server_path = '/home/mbarakatt/.omnisharp/omnisharp-roslyn/omnisharp/OmniSharp.exe'
	let g:OmniSharp_server_use_mono = 1
	set completeopt=longest,menuone,preview
	set previewheight=5

" ale settings
	" If ALE is installed, it will automatically be used to asynchronously check your code for errors.  No further configuration is necessary. However, be aware that ALE supports multiple C# linters, and will run all linters that are available on your system. To limit ALE to only use OmniSharp (recommended), add this to your .vimrc:
	"
	let g:ale_linters = {
	\ 'cs': ['OmniSharp']
	\}

" Deoplete settings
	" Use deoplete.
	let g:deoplete#enable_at_startup = 1
	call deoplete#custom#option('min_pattern_length', 0)

" MULTIPURPOSE TAB KEY
	" Indent if we're at the beginning of a line. Else, do completion.
	function! InsertTabWrapper()
	    let col = col('.') - 1
	    if !col || getline('.')[col - 1] !~ '\k'
		return "\<tab>"
	    else
		return "\<c-n>"
	    endif
	endfunction
	inoremap <expr> <tab> InsertTabWrapper()
	inoremap <s-tab> <c-p>
