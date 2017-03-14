filetype plugin indent on

set ruler               "Always show cursor position
set pastetoggle=<F2>

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
	set fileencodings=utf-8,latin1
endif

set nocompatible

set background=dark

let c_space_errors=1

set history=50
set wildmenu

syntax on

set modeline
set backspace=indent,eol,start

colorscheme eraz0r

