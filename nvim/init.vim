"
"
"
" http://github.com/lennypeers/dotfiles
" vim FTW
"
"
"
:set cursorline
:set termguicolors "only for linux
:set shellcmdflag=-ic
:set nu rnu
:set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
:set mouse=nv
"
" exiting terminal
"
:tnoremap <Esc> <C-\><C-n>
"
" Quick move in terminal mode
"
:tnoremap <C-w>w <C-\><C-n><C-w>w
"
" silent undo redo
"
:nmap <C-r> :sil redo<Return>
:nmap <A-u> :sil u<Return>
"
" scrolling
"
:set scrolloff=5
if &mouse == 'nv'
	" scroll up with k
	:noremap <ScrollWheelUp>     k
	:noremap <2-ScrollWheelUp>   2k
	:noremap <3-ScrollWheelUp>   4k
	:noremap <4-ScrollWheelUp>   8k
	" scroll down with j
	:noremap <ScrollWheelDown>   j
	:noremap <2-ScrollWheelDown> 2j
	:noremap <3-ScrollWheelDown> 4j
	:noremap <4-ScrollWheelDown> 8j
	" control + scroll adjusts the screen
	:noremap <C-ScrollWheelUp>     <C-y>
	:noremap <C-2-ScrollWheelUp>   2<C-y>
	:noremap <C-3-ScrollWheelUp>   4<C-y>
	:noremap <C-4-ScrollWheelUp>   8<C-y>
	:noremap <C-ScrollWheelDown>   <C-e>
	:noremap <C-2-ScrollWheelDown> 2<C-e>
	:noremap <C-3-ScrollWheelDown> 4<C-e>
	:noremap <C-4-ScrollWheelDown> 8<C-e>
	" same but with keyboard
	:noremap <C-k> <C-y>
	:noremap <C-j> <C-e>
else
	:nnoremap <C-Up> <C-y>
	:nnoremap <C-Down> <C-e>
endif
"
" don't paste in normal mode
"
:map <MiddleMouse> <Nop>
"
" arrow keys like hjkl feature
"
:map <C-h> <C-left>
:map <C-l> <C-right>
"
" add lines
"
:nnoremap o o<Esc>
:nnoremap O O<Esc>
"
" https://vim.fandom.com/wiki/Replace_a_builtin_command_using_cabbrev
"
:cabbrev <silent> w <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'sil w' : 'w')<CR>
:cabbrev <silent> wq <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'sil wq' : 'wq')<CR>
"
" to work faster
"
:command Q q
:command Qa qa
:command W :sil w
:command WQ wq
:command Wq wq
:command Wqa wqa
:command Nt tabnew
:command E edit
"
" switching tabs
"
:nmap <Tab> gt
:nmap <S-Tab> gT
"
" C-x do decrement and C-c to increment
"
:nnoremap <C-c> <C-a>
"
" C-a/e to go to the beginning / end of line
"
:imap <C-a> <home>
:map <C-a> <home>
:imap <C-e> <end>
:map <C-e> <end>
"
" C-o quick save
"
:imap <silent> <C-o> <Esc>:w<Return>
:map <silent> <C-o> :w<Return>
:map <C-q> :q<Return>
:imap <C-q> <Esc>:q<Return>
"
" switch windows
"
:map <leader>1 1gt
:map <leader>2 2gt
:map <leader>3 3gt
:map <leader>4 4gt
:map <leader>5 5gt
:map <leader>6 6gt
:map <leader>7 7gt
"
" default split to right
"
:set splitright
"
"
"
" My plugins
"
"
"
call plug#begin('~/.vim/plugged')
Plug 'oblitum/rainbow'
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/nerdcommenter'
Plug 'unblevable/quick-scope'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/Colorizer'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vimsence/vimsence'
Plug 'fladson/vim-kitty'
call plug#end()
"
" rainbow settings
"
:let g:rainbow_active = 1
"
" Terminal settings
"
:set splitbelow
"
" Nerd tree
"
:nmap <Leader>] :NERDTreeToggle<CR>
:let g:NERDTreeWinSize=35
"
" New tab
"
:nmap <Leader>= :Nt<CR>
"
" Theme settings
"
:let g:PaperColor_Theme_Options = {
	\   'theme': {
	\     'default.dark': {
	\       'override' : {
	\         'color00' : ['#263238', '15'],
	\         'color07' : ['', '15'],
	\		  'cursorline' : ['#1f292e', ''],
	\         'cursorlinenr_fg' : ['', '44'],
	\         'cursorlinenr_bg' : ['#263238', ''],
	\         'linenumber_bg' : ['#263238', ''],
	\         'linenumber_fg' : ['', '110'],
	\         'tabline_bg' : ['#575757', ''],
	\		  'statusline_inactive_bg' : ['#263238', ''],
	\		  'statusline_active_bg' : ['#263238', ''],
	\       }
	\     },
	\      'default.light': {
	\        'override' : {
	\          'color00' : ['#fdf6e3', ''],
	\	       'cursorlinenr_fg' : ['', '25'],
	\          'cursorlinenr_bg' : ['#fdf6e3', ''],
	\          'linenumber_bg' : ['#fdf6e3', ''],
	\          'linenumber_fg' : ['', '110'],
	\          'tabline_bg' : ['#e4e4e4', ''],
	\		   'tabline_inactive_bg' : ['#e4e4e4', ''],
	\	       'tabline_inactive_fg' : ['#263238', ''],
	\	       'tabline_active_bg' : ['#666666', ''],
	\	       'tabline_active_fg' : ['#fdf6e3', ''],
	\          'vertsplit_bg' : ['#fdf6e3', ''],
	\	       'statusline_inactive_bg' : ['#fdf6e3', ''],
	\	       'statusline_active_bg' : ['#fdf6e3', ''],
	\       }
	\     },
	\   }
	\ }
:colorscheme PaperColor
:highlight Normal ctermbg=none
"
" quick-scope
"
:let g:qs_highlight_on_keys = ['f', 'F']
:highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
:highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
"
" remove trailing spaces
"
:function! Rms ()
:	%s/\s\+$//e
:endfunction
"
" highlight the colors
"
:nmap <Leader>p :ColorToggle<CR>
"
" Setting the theme
"
function! UpdateBg()
	if system("cat ~/.t")  =~ "day\n"
		set background=light
	else
		set background=dark
	endif
	redraw
endfunction
"
:call UpdateBg()
"
" SIGUSR1 updates bg
"
:autocmd Signal SIGUSR1 :call UpdateBg()
"
"
" cleaning the new terminal split
"
:autocmd TermOpen * :set nonu nornu nocursorline
:autocmd TermOpen term://* :startinsert
:autocmd TermClose * :set nu rnu cursorline
"
" open everything in tabs
"
:tab all
"
" sourcing
"
:source ~/dotfiles/nvim/whitespace.vim
:source ~/dotfiles/nvim/myprettyruler.vim
"
" hide statusline
"
:set laststatus=0 "statusline is BLOAT
:set statusline=%(\ %)
"
" hide "tap enter to continue" at launch
"
:set shortmess=Fs
"
" cleaning after a command
"
augroup cmdline
	autocmd!
	autocmd CmdlineLeave : echo ''
augroup end
"
" hsplit sep is the minus character
"
:set fillchars=stl:―,stlnc:―
"
" coc vim
"
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()
" use shift tab navigate backwards
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
" vimsence
"
let g:vimsence_client_id = '783349650148950076'
let g:vimsence_small_text = 'neovim'
let g:vimsence_small_image = 'neovim'
"
" vim: set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab :
"
