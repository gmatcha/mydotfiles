call pathogen#infect()
filetype plugin indent on
syntax on

set nowrap

set hidden

" vim-json
autocmd BufNewFile,BufRead *.json setlocal filetype=json
set tabstop=4
set shiftwidth=4
set expandtab
set linespace=5

" show line numbers and bind 123<CR> to go to line
set nu
nnoremap <CR> G

" <leader>d goes to definition etc
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>

" hex editing
nnoremap <C-h> :Hexmode

" ignore these regex in nerdtree list
"let NERDTreeIgnore = ['\.pyc$']

" set leader to space
let mapleader=' '
set autoindent
set smartindent
set nostartofline
syntax enable
set noswapfile
set gdefault
set incsearch
set ignorecase
set smartcase
set encoding=utf-8
set laststatus=2
set splitbelow
set splitright
set wildmenu
set wildmode=longest:full,full

" change gutter color
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

"let g:gitgutter_map_keys=0
let g:gitgutter_map_keys=1
"let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_added = '➕'
"let g:gitgutter_sign_modified = 'o'
let g:gitgutter_sign_modified = '⚪️'
"let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed = '➖'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = 'ww'

" UltiSnips snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
let g:UltiSnipsListSnippets="<C-tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsEnableSnipMate=0

" YCM + UltiSnips compatibility
let g:UltiSnipsExpandTrigger = "<nop>"
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

" clang completer
"let g:ycm_global_ycm_extra_conf = "~/.files/extra/global_extra_youcompleteme_conf.py"

" syntastic
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy5'
"let g:syntastic_error_symbol = '✘✘'
"let g:syntastic_error_symbol = '❌'
let g:syntastic_error_symbol = '⚔️'
"let g:syntastic_warning_symbol = '⚡⚡'
let g:syntastic_warning_symbol = '⚡'
"let g:syntastic_warning_symbol = '🐯'

" gitgutter emoji
silent! if emoji#available()
  let g:gitgutter_sign_added = emoji#for('small_blue_diamond')
  let g:gitgutter_sign_modified = emoji#for('small_orange_diamond')
  let g:gitgutter_sign_removed = emoji#for('small_red_triangle')
  let g:gitgutter_sign_modified_removed = emoji#for('collision')
endif

" custom home/end
map <leader>a 0
map <leader>l $
map <leader>j 9j 
map <leader>k 9k
map <leader>h 19h
map <leader>l 19l

" python tabs
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4

" detect python django filetype
autocmd FileType python set ft=python.django

" a better htmldjango detection
augroup filetypedetectHTML
  " removes current htmldjango detection located at $VIMRUNTIME/filetype.vim
  au! BufNewFile,BufRead *.html
  au  BufNewFile,BufRead *.html   call FThtml()

  func! FThtml()
    let n = 1
    while n < 10 && n < line("$")
      if getline(n) =~ '\<DTD\s\+XHTML\s'
        setf xhtml
        return
      endif
      if getline(n) =~ '{%\|{{\|{#'
        setf htmldjango.html
        return
      endif
      let n = n + 1
    endwhile
    setf html
  endfunc
augroup END

" copy to system clipboard from visual
vnoremap y "+y
nnoremap y "+y
vnoremap p "+p
nnoremap p "+p

" use ag over ack
if executable('ag')
  " Use ag over ack
  let g:ackprg='ag --nogroup --nocolor --column'

  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" wildignore
set wildignore+=*.pyc,*~
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj
set wildignore+=*/node_modules/*,*/.hg/*,*/.git/*

" enable the mouse for cursor navigation
set mouse=a

" automatically open nerdtree
" autocmd vimenter * NERDTree

" open nerdtree if no file is opened on startup
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only pane open is the NERDtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Toggle nerd with leader nt
nnoremap <leader>nt :NERDTreeToggle<CR>
nmap nt :NERDTreeToggle<CR>

" Open Ag search
nnoremap <leader>g :Ack 

" Window switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
cmap wh wincmd h<CR>
cmap wj wincmd j<CR>
cmap wk wincmd k<CR>
cmap wl wincmd l<CR>

" reference SoF: https://stackoverflow.com/questions/28304137/youcompleteme-works-but-can-not-complete-using-tab
" automatically toggle (no)paste indents when pasting from clipboard
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" start in INSERT mode
" start

" column highlighting
set cursorline
"set colorcolumn=72
"hi ColorColumn cterm=none gui=none guibg=white ctermfg=white 

" solarized
"set background=dark " light | dark "
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1 " this will use terminal background color instead
"set t_Co=256
"colorscheme solarized

" shame tab characters visually
" set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.

" don't shame tab characters in HTML
autocmd filetype html,xml set listchars-=tab:>.

" map ; to :
nnoremap ; :

" disable arrow keys (force use of hjkl)
map <up> <nop>
imap <up> <nop>
map <down> <nop>
imap <down> <nop>
map <left> <nop>
imap <left> <nop>
map <right> <nop>
imap <right> <nop>

" alias j and k to jump wrapped lines
nnoremap j gj
nnoremap k gk

" alias ii to ESCAPE for command palette
imap ii <C-c>

" 

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" Map jj to canceling command T prompt -- not working
let g:CommandTCancelMap=['<Esc>', '<C-c>', 'jj']


