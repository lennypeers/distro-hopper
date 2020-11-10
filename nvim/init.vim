"
"
" http://github.com/lennypeers/dotfiles
" vim FTW
"
"
"
:set termguicolors "only for linux
:set shellcmdflag=-ic
:set tabstop=8
:set nu rnu
:set softtabstop=8 noexpandtab
:set shiftwidth=8
"
"exiting terminal
"
:tnoremap <Esc> <C-\><C-n>
"
"scrolling
"
:nnoremap <C-Up> <C-y>
:nnoremap <C-Down> <C-e>
:set scrolloff=5
"
"add lines
"
:nnoremap o o<Esc>
:nnoremap O O<Esc>
"
"to work faster
"
:command Q q
:command Qa qa
:command W :sil w | echo ''
:command WQ wq
:command Wq wq
:command Nt tabnew
:command E edit
"
"switching tabs
"
:nmap <Tab> gt
:nmap <S-Tab> gT
"
"C-x do decrement and C-c to increment
"
:nnoremap <C-c> <C-a>
"
"C-a/e to go to the beginning / end of line
"
:imap <C-a> <home>
:map <C-a> <home>
:imap <C-e> <end>
:map <C-e> <end>
"
"C-o quick save
"
:imap <C-o> <Esc>:w<Return>
:map <C-o> :w<Return>
:map <C-q> :q<Return>
:imap <C-q> <Esc>:q<Return>
"
"overwrite w, hide the messages: "filename" XC written...
"
function Clean()
	echo ''
endfunction
"
" https://vim.fandom.com/wiki/Replace_a_builtin_command_using_cabbrev
"
:cabbrev w <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'sil w \| call Clean()' : 'w')<CR>
"
"switch windows
"
:map <leader>1 1gt
:map <leader>2 2gt
:map <leader>3 3gt
:map <leader>4 4gt
:map <leader>5 5gt
:map <leader>6 6gt
:map <leader>7 7gt
"
"default split to right
"
:set splitright
"
"My plugins
"
"
"
call plug#begin('~/.vim/plugged')
Plug 'vimlab/split-term.vim'
Plug 'oblitum/rainbow'
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/nerdcommenter'
Plug 'unblevable/quick-scope'
Plug 'preservim/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'chrisbra/Colorizer'
call plug#end()
"
"rainbow settings
"
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
"
"Terminal settings
"
:set splitbelow
":command T 10Term
"
"Nerd tree
"
:nmap <Leader>] :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=35
"
"New tab
"
:nmap <Leader>= :Nt<CR>
"
"Theme settings
"
let g:PaperColor_Theme_Options = {
	\   'theme': {
	\     'default.dark': {
	\       'override' : {
	\         'color00' : ['#263238', '15'],
	\         'color07' : ['', '15'],
	\         'cursorlinenr_fg' : ['', '44'],
	\         'cursorlinenr_bg' : ['#263238', ''],
	\         'linenumber_bg' : ['#263238', ''],
	\         'linenumber_fg' : ['', '110'],
	\         'tabline_bg' : ['#575757', '']
	\       }
	\     },
	\      'default.light': {
	\        'override' : {
	\         'color00' : ['#fdf6e3', ''],
	\	    'cursorlinenr_fg' : ['', '25'],
	\         'cursorlinenr_bg' : ['#fdf6e3', ''],
	\         'linenumber_bg' : ['#fdf6e3', ''],
	\         'linenumber_fg' : ['', '110'],
	\         'tabline_bg' : ['#e4e4e4', ''],
	\	    'tabline_inactive_bg' : ['#e4e4e4', ''],
	\	    'tabline_inactive_fg' : ['#263238', ''],
	\	    'tabline_active_bg' : ['#666666', ''],
	\	    'tabline_active_fg' : ['#fdf6e3', ''],
	\         'vertsplit_bg' : ['#fdf6e3', ''],
	\	    'statusline_inactive_bg' : ['#fdf6e3', ''],
	\	    'statusline_active_bg' : ['#fdf6e3', ''],
	\       }
	\     },
	\   }
	\ }
colorscheme PaperColor
highlight Normal ctermbg=none
"
"quick-scope
"
let g:qs_highlight_on_keys = ['f', 'F']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
"
"extra spaces
"
:function! Rms ()
:	%s/\s\+$//e
:endfunction
"
"highlight the colors
"
:nmap <Leader>p :ColorToggle<CR>
"
"Setting the theme
"
if $THEME =~ 'day'
	set background=light
	let g:airline_theme='minimalist'
else
	set background=dark
	let g:airline_theme='papercolor'
endif
"
"cleaning the new terminal split
"
:autocmd TermOpen * :set nonu nornu
:autocmd TermOpen term://* :startinsert
:autocmd TermClose * :set nu rnu
"
"open everything in tabs
"
:tab all
"
"sourcing coding style modules
"
source ~/dotfiles/nvim/whitespace.vim
"
"custom ruler
"
set laststatus=0
set rulerformat=%50(%#CursorLineNr#%=%{StatuslineTabWarning()}\ %#VertSplit#%{StatuslineTrailingSpaceWarning()}%#String#%F%)